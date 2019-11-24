require 'features_helper'

feature 'Create message' do
  before do
    MessageRepository.new.clear
    Timecop.freeze(time)
  end

  after do
    Timecop.return
  end

  given!(:time) { Time.now }

  given(:message) do
    MessageRepository.new.create(Message.new(text: 'New message!', visits_limit: 2, password: 'password', hours_to_destroy: 1))
  end

  scenario 'User can show existing message' do
    visit "/messages/#{message.url}"
    expect(page).to have_content("#{message.text}")
  end

  scenario 'User can\'t show expaired message' do
    3.times { visit "/messages/#{message.url}" }
    expect(page).to have_content("404")
  end

  scenario 'User can\'t show destruction message' do
    Timecop.travel(time + 10.hours)
    ExpiredWorker.new.perform
    visit "/messages/#{message.url}"
    expect(page).to have_content('404')
  end
end
