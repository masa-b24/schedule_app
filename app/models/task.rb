class Task < ApplicationRecord
  belongs_to :user
  enum klass: { schedule: 0, memo: 1 }
  default_scope -> { order(due_date: :asc) }
end
