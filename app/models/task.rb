class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 300 }


  belongs_to :user
  enum klass: { schedule: 0, memo: 1 }

  def start_time
    self.due_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
