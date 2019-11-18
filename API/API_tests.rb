require_relative 'quickstart'

service = initializee_the_API
user_id = "me"
result = service.list_user_labels user_id
puts "Labels:"
puts "No labels found" if result.labels.empty?
result.labels.each { |label| puts "- #{label.name}" }

describe 'API: practical_task ' do

  it 'verify sending mail' do
    test_message = create_message('nazikbo1996@gmail.com','nazikbo1996@gmail.com','Testing  messages.',File.read('body.txt'))
    message_id = send_message(service, user_id,test_message)
    expect(message_id.to_s.empty?).to be false
    expect(service.get_user_message(user_id, message_id ).to_s.empty?).to be false
    expect(File.read('body.txt').include? (service.get_user_message(user_id, message_id)).snippet).to be true
  end
end
