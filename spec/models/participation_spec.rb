require 'spec_helper' 

describe Participation do 
  it { should belong_to :user }
  it { should belong_to :chatroom }
end