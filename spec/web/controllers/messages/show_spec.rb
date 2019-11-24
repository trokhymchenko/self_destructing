require 'spec_helper'
require_relative '../../../../apps/web/controllers/messages/show'

RSpec.describe Web::Controllers::Messages::Show, type: :action do
  let(:action) { described_class.new }
  let(:message) { MessageRepository.new.create(Message.new(text: 'New message!', visits_limit: 2))}
  let(:params) { Hash[url: message.url] }

  before do
    MessageRepository.new.clear
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'is failure' do
    params.merge!(url: message.url[0..8])
    response = action.call(params)
    expect(response[0]).to eq 404
  end
end
