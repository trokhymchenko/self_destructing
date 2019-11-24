require 'spec_helper'

RSpec.describe Message, type: :entity do
  # place your tests here
  let(:message) { Message.new(text: 'New message!', hours_to_destroy: 2, visits_limit: 2) }
  let(:record) { MessageRepository.new.create(message) }
  let(:time) { Time.now }

  before do
    MessageRepository.new.clear
    Timecop.freeze(time)
  end

  after do
    Timecop.return
  end

  describe '#url' do
    it 'returns a String' do
      expect(record.url).to be_a String
  end

    it 'has size of 16' do
      expect(record.url.size).to eq 16
  end

  end

  describe '#time_of_destroy' do
   it 'sets time of destroy message' do
     expect(record.time_of_destroy.to_i).to eq time.to_i + record.hours_to_destroy.hours
  end
 end
end
