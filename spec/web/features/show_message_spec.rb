require 'features_helper'

feature 'Create message' do
  before do
    MessageRepository.clear
  end

  given(:message) do
    MessageRepository.create(Message.new(text: 'New message!', visits_limit: 2, password: 'password'))
  end

  scenario 'User can show existing message' do
    visit "/messages/#{message.url}"
    expect(page).to have_content("#{message.text}")
  end

  scenario 'User can\'t show expaired message' do
    3.times { visit "/messages/#{message.url}" }
    expect(page).to have_content("404")
  end
end
