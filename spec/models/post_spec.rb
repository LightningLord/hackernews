require 'spec_helper'

describe Post do
  it {should have_many :comments}
  it {should belong_to :user}

  it {should validate_presence_of :title}
  it {should validate_presence_of :content}
  it {should validate_presence_of :user}

  it {should have_many :votes}
end
