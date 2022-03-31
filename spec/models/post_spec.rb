require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Title', text: 'Text', author_id: 1, commentsCounter: 0, likesCounter: 0) }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "title shouldn't exceed 250 character" do
    subject.title = 'Latest August of this year I started to learn Rails.
    I was following the book Ruby on Rails Tutorial from Learn Enough To Be Dangerous
    website which uses Minitest to test their application.
    Truth is: I was not understanding a single line of code about those tests.
    So I decided to skip them and try to write it using RSpec because the syntax
    is way more similar to human language than others.
    But you may be wondering:'
    expect(subject).to_not be_valid
  end

  it 'should have positive comments counter' do
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'should have positive likes counter' do
    subject.likesCounter = -1
    expect(subject).to_not be_valid
  end

  it 'post_counter method should not work without an User' do
    expect { subject.post_counter }.to raise_error NoMethodError
  end

  it "shouldn't have any comments" do
    expect(subject.recent_comments.length).to eq(0)
  end
end
