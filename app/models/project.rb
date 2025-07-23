class Project < ApplicationRecord
    enum category: { data: "data", backend: "backend" }
    enum status: { pending: "pending", in_progress: "in_progress", completed: "completed" }

    validates :title, presence: true, length: { maximum: 255 }
    validates :description, presence: true
    validates :category, presence: true, :inclusion { in: %w[data backend] }
    validates :status, presence: true :inclusion { in: %w[pending in_progress completed] }

    serialize :technologies, Array
    serialize :features, Array
    serialize :results, Array
    serialize :endpoints, Array
    serialize :design_patterns, Array
 
    scope :by_category, -> (category) { where(category: category) }
    scope :featured, -> { where(is_featured: true) }
    scope :ordered, -> { order(:order_index, :created_at) }
end
