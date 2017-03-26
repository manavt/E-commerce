class User < ApplicationRecord
  has_one :image , as: :entity
  accepts_nested_attributes_for :image
  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user |
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.user_image = auth.info.image
      user.token = auth.credentials.token
      user.email = auth.extra.raw_info.email
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save(validate: false)
    end
  end
end
