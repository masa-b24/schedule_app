class Task < ApplicationRecord
  belongs_to :user
  enum klass: { schedule: 0, memo: 1 }
end
