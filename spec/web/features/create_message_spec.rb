require 'features_helper'

feature 'Create message' do
  after do
    MessageRepository.clear
  end

  given(:message) { MessageRepository.first }

  scenario  'Create message without text' do
    visit '/'
    click_button 'Create Message'
    expect(page).to have_content('Text must be filled')
  end

  scenario  'Create message without option' do
    visit '/'
    fill_in 'Text', with: 'Some text'
    click_button 'Create Message'
    expect(page).to have_content('Hours To Destroy Or Visits Limit must be filled')
  end

  scenario  'Create message with correct values' do
    visit '/'
    fill_in 'Text', with: 'Some text'
    fill_in 'Visits limit', with: 2
    fill_in 'Password', with: 'password'
    page.all("input[id='message-encrypted']", visible: false).first.set('true')
    click_button 'Create Message'
    expect(page).to have_content("/messages/#{message.url}")
  end
end
