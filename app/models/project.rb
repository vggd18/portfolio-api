class Project < ApplicationRecord
    enum :category, { data: "data", backend: "backend" }
    enum :status, { pending: "pending", in_progress: "in_progress", completed: "completed" }

    validates :title, presence: true, length: { maximum: 255 }
    validates :description, presence: true
    validates :category, presence: true
    validates :status, presence: true

    scope :by_category, -> (category) { where(category: category) }
    scope :featured, -> { where(is_featured: true) }
    scope :ordered, -> { order(:order_index, :created_at) }
end
