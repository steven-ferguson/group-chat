require 'spec_helper'

describe Chatroom do
  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most(50) }
  # it { should belong_to :user }
  it { should have_and_belong_to_many :users }
  
end
