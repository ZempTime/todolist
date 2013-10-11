# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  completed_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  list_id      :integer
#

class Task < ActiveRecord::Base
  belongs_to :list
  validates :description, presence: true

  def complete!(value)
    self.completed_at = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value) ? Time.zone.now : nil
    self.save
  end

  scope :sorted, -> {order(completed_at: :asc, created_at: :desc)}
end
