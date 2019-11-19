require_relative 'quickstart'

describe 'API: practical_task ' do

let(:service) { initializee_the_API }
let(:user_id) { 'me' }
let(:test_message) { create_message('nazikbo1996@gmail.com','nazikbo1996@gmail.com','Testing  messages.',File.read('body.txt'), 'image.jpg') }
let(:message_id) { send_message(service, user_id,test_message) }

  it 'verify sending mail' do
    expect(message_id.to_s.empty?).to be false
    expect(service.get_user_message(user_id, message_id ).to_s.empty?).to be false
    #expect((service.get_user_message(user_id, message_id).snippet).include? File.read('body.txt')).to be true
    expect((File.read('body.txt')).include? (service.get_user_message(user_id, message_id).snippet)).to be true
  end
end
