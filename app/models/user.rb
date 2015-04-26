class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_one :profile_picture, dependent:  :destroy, as: :owner, class_name: "Media::ProfilePicture"


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.gender = auth.info.extra.raw_info.gender

      Media::ProfilePicture.new do |media|
        media.attachment_remote_url = user.facebook_profile_pic_url(:large)
        user.profile_picture = media
      end
    end
  end

  def facebook_profile_pic_url(size)
    "https://graph.facebook.com/#{uid}/picture?type=#{size}"
  end
end
