class Skill < ApplicationRecord

    validates :name, presence: true, length: { maximum: 100 }
    validates :category, presence: true
    validates :proficiency, presence: true, inclusion: { in: 1..5 }

    scope :by_category, ->(category) { where(category: category) }
    scope :featured, -> { where(is_featured: true) }
    scope :proficiency , -> { order(:proficiency, :created_at) }
end
