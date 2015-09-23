class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by(provider: auth_hash.provider, uid: auth_hash.uid) do |user|
      user.name = auth_hash.info.name
      user.image = auth_hash.info.image
      user.email = auth_hash.info.email
    end
  end
end
