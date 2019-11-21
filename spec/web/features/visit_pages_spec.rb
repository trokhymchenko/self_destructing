require 'features_helper'

RSpec.describe 'Visit pages' do
  it 'is successful' do
    visit '/'

    expect(page.title).to eq('Self destructing messages')
  end
end
