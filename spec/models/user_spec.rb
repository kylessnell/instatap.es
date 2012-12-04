require 'spec_helper'

describe User do
  
  it 'generates a remember token on create' do
    user = create(:user)
    user.remember_token.should_not be_nil
  end
  
  it 'is invalid without a remember token' do
    user = create(:user)
    user.remember_token = nil
    user.should_not be_valid
  end
  
  it 'is invalid with a duplicate remember token' do
    user1 = create(:user)
    user2 = create(:user)
    user2.remember_token = user1.remember_token
    user2.should_not be_valid
  end
  
end
