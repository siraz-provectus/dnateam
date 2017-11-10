class User < ApplicationRecord
   PHONE_REGEX = /(\+){1}\d{11}/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :lockable, :validatable

  STATUSES  = %w(pending approved declined)

  mount_uploader :document, DocumentUploader

  validates :first_name, :last_name, :middle_name, :phone, :city, :document, presence: true
  validates :status, inclusion: {in: STATUSES, message: I18n.t(:'messages.invalid_value') }
  validates :phone, format: {with: PHONE_REGEX, message: I18n.t(:'messages.wrong_format')}

  after_create_commit { UserBroadcastJob.perform_later self }
end
