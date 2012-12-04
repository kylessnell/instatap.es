class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :oauth_token
  attr_accessible :remember_token
  has_many :mixtapes
  before_create :generate_remember_token

private

  def generate_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
