class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
          omniauth_providers: [:facebook]

  has_one :profile_picture, dependent:  :destroy, as: :owner, class_name: "Media::ProfilePicture"
  has_many :books
  has_many :bids
  has_many :auth_keys, as: :owner
  has_many :notifications, as: :owner


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name

      if auth.extra && auth.extra.raw_info
        user.gender = auth.extra.raw_info.gender
      end

      Media::ProfilePicture.new do |media|
        media.attachment_remote_url = user.facebook_profile_pic_url(:large)
        user.profile_picture = media
      end
    end
  end

  def facebook_profile_pic_url(size)
    "https://graph.facebook.com/#{uid}/picture?type=#{size}"
  end

  def generate_or_last_active_auth_key
    auth_keys.active.last.presence || generate_new_auth_key
  end

  def generate_new_auth_key
    token =
      loop do
        key = SecureRandom.base64(60)
        break key unless AuthKey.where(auth_key: key).first
      end

    auth_keys.create!(auth_key: token, expires_at: 1.days.from_now)
  end
end
