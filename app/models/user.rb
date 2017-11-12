class User < ApplicationRecord
   PHONE_REGEX = /(\+){1}\d{11}/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :lockable, :validatable, :omniauthable

  STATUSES  = %w(pending approved declined)

  mount_uploader :document, DocumentUploader

  validates :first_name, :last_name, :middle_name, :phone, :city, :document, presence: true
  validates :status, inclusion: {in: STATUSES, message: I18n.t(:'messages.invalid_value') }
  validates :phone, format: {with: PHONE_REGEX, message: I18n.t(:'messages.wrong_format')}

  after_create_commit { UserBroadcastJob.perform_later self }

  def self.find_for_vkontakte_oauth(auth)
    user = find_by(email: auth.info.email)

    if user.present?
      user.update_attributes(first_name: auth.info.first_name, last_name: auth.info.last_name,
                             provider: auth.provider, url: auth.info.urls.Vkontakte, status: 'approved')
    else
      user = new( email: auth.info.email,
                  provider: auth.provider,
                  url: auth.info.urls.Vkontakte,
                  first_name: auth.info.first_name,
                  last_name: auth.info.last_name,
                  status: 'approved' )

      user.save(validate: false)
    end

    user
  end
end
