require 'rails_helper'

RSpec.describe FbHeaderParser, type: :service do
  before { allow_any_instance_of(Base64ToImage).to receive(:call).and_return('file') }

  let(:path) { Rails.root.join('spec/fixtures/fiction.fb2') }

  subject { described_class.new(path).call }

  it 'parses the book' do
    expect(subject).to eq(
      authors: [{
        first_name: 'Пол',
        middle_name: '',
        last_name: 'Боулз',
        email: '' }],
      translators: [{
        first_name: 'Валерий',
        middle_name: '',
        last_name: 'Нугатов',
        email: '' }],
      title: 'Знаки во времени. Марокканские истории',
      annotation: "\"Знаки во времени\" - необычная книга, ее жанр невозможно определить. Марокканские легенды, исторические анекдоты, записки путешественников и строки песен перемежаются с вымыслом.",
      genre: ['story'],
      lang: 'ru',
      keywords: '',
      cover: 'file')
  end
end
