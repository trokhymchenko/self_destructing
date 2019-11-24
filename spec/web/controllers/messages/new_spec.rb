require 'spec_helper'
require_relative '../../../../apps/web/controllers/messages/new'

RSpec.describe Web::Controllers::Messages::New, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
