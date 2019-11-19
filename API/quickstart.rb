require 'rubygems'
require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'mail'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APPLICATION_NAME = 'Gmail API Ruby Quickstart'.freeze
CREDENTIALS_PATH = 'credentials.json'.freeze

TOKEN_PATH = 'token.yaml'.freeze
SCOPE = Google::Apis::GmailV1::AUTH_SCOPE

Gmail = Google::Apis::GmailV1    # for initializee_the_API

def authorize
  client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
  token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
  authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
  user_id = 'default'
  credentials = authorizer.get_credentials user_id
  if credentials.nil?
    url = authorizer.get_authorization_url base_url: OOB_URI
    puts 'Open the following URL in the browser and enter the ' \
         'resulting code after authorization:\n' + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end

def create_message(from, to, subject, body, file)
  message = Mail.new do
    from    from
    to      to
    subject subject
    body    body
    add_file file
  end
end

def send_message(service, user_id, message)
  msg = message.encoded
  message_object = Google::Apis::GmailV1::Message.new(raw:message.to_s)
  mess = service.send_user_message(user_id, message_object)
  puts "Message was sended! Message id = #{mess.id}"
  mess.id
end

def initializee_the_API
  service = Gmail::GmailService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize
  return service
end
