require 'rails_helper'

RSpec.describe EncodingConverter, type: :service do
  let(:book_path) { Rails.root.join('spec/fixtures/cp1251.fb2') }
  let(:instance)  { described_class.new(book_path) }

  subject { instance.call }

  it 'should return utf-8 encoded string' do
    expect(subject.encoding).to eq Encoding::UTF_8
  end

  it { is_expected.to match /Джером Д. Сэлинджер/ }
end
