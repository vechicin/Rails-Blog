require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new }
  it 'like_counter method should raise an error without a Post' do
    expect { subject.like_counter }.to raise_error NoMethodError
  end
end
