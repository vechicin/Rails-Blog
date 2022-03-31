require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Santiago') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a positive posts counter' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it "shouldn't have any posts" do
    expect(subject.recent_posts.length).to eq(0)
  end
end
