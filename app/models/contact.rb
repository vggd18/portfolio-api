class Contact < ApplicationRecord
    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :subject, presence: true, length: { maximum: 200 }
    validates :message, presence: true
    scope :recent, -> { order(created_at: :desc) }
end
