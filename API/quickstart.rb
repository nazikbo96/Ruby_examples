require 'rubygems'
require "google/apis/gmail_v1"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"
require 'mail'

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "Gmail API Ruby Quickstart".freeze
CREDENTIALS_PATH = "credentials.json".freeze

TOKEN_PATH = "token.yaml".freeze
SCOPE = Google::Apis::GmailV1::AUTH_SCOPE

def authorize
  client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
  token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
  authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
  user_id = "default"
  credentials = authorizer.get_credentials user_id
  if credentials.nil?
    url = authorizer.get_authorization_url base_url: OOB_URI
    puts "Open the following URL in the browser and enter the " \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end
#-------------------------------------------------------------------------------
def create_message(sender, to_who, message_subject, message_text)
  message = Mail.new do
    from    sender
    to      to_who
    subject message_subject
    body    message_text
  end
  puts 'Message was created!'
  return message
end
#-------------------------------------------------------------------------------
def send_message(service, user_id, message)
  msg = message.encoded
  message_object = Google::Apis::GmailV1::Message.new(raw:message.to_s)
  mess = service.send_user_message(user_id, message_object)
  puts "Message was sended! Message id = #{mess.id}"
  return mess.id
end
#-------------------------------------------------------------------------------

# Initialize the API
Gmail = Google::Apis::GmailV1 # Alias the module
service = Gmail::GmailService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Show the user's labels
describe 'API: practical_task ' do
  it 'verify sending mail' do
    user_id = "me"
    result = service.list_user_labels user_id
    puts "Labels:"
    puts "No labels found" if result.labels.empty?
    result.labels.each { |label| puts "- #{label.name}" }

    test_message = create_message('nazikbo1996@gmail.com','nazikbo1996@gmail.com','Testing  messages.',File.read('body.txt'))
    message_id = send_message(service, user_id,test_message)
    expect(message_id.to_s.empty?).to be false
    expect(service.get_user_message(user_id, message_id ).to_s.empty?).to be false
  end
end
