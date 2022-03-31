require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'Comment') }

  it 'comment_counter method should raise an error without a Post' do
    expect { subject.comment_counter }.to raise_error NoMethodError
  end

  it 'author_name method should raise an error without an User' do
    expect { subject.author_name }.to raise_error NoMethodError
  end
end
