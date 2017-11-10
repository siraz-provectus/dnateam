class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :lockable, :validatable

  STATUSES  = %w(pending approved declined)

  mount_uploader :document, DocumentUploader

  validates :first_name, :last_name, :middle_name, :phone, :city, :document, presence: true
  validates :status, inclusion: {in: STATUSES, message: 'invalid value'}

  after_create_commit { UserBroadcastJob.perform_later self }
end
