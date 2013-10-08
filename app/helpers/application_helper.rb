module ApplicationHelper
  def task_class(task)
    "strikeout" if task.completed_at?
  end
end
