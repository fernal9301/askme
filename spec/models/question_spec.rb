require 'rails_helper'

describe Question do
  it 'sets hashtags from its text' do
    q = FactoryGirl.create(:question, text: 'мама мыла #раму')
    expect(q.reload.hashtags.count).to eq 1
    expect(q.hashtags.first.name).to eq 'раму'
  end

  it 'deletes old hashtags' do
    q = FactoryGirl.create(:question, text: 'мама мыла #раму')
    q.update(text: 'мама #мыла раму')
    expect(q.reload.hashtags.count).to eq 1
    expect(q.hashtags.first.name).to eq 'мыла'
  end
end
