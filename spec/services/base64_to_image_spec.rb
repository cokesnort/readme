require 'rails_helper'

RSpec.describe Base64ToImage, type: :service do
  let(:base64) { Rails.root.join('spec/fixtures/base64.txt').read }

  subject { described_class.new(base64).call }

  it 'extracts image' do
    expect(subject.size).to eq 6157
  end
end
