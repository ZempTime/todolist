class Task < ActiveRecord::Base
  def complete!(value)
    self.completed_at = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value) ? Time.zone.now : nil
    self.save
  end
end
