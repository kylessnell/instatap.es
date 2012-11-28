class User < ActiveRecord::Base
  attr_accessible :remember_token
  has_many :mixtapes
  before_create :create_remember_token

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
