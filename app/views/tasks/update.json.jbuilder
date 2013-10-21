json.id @task.id
json.description @task.description

if @task.completed_at?
  json.completed_at @task.completed_at.strftime("%A, %I:%M %p %Z")
else
  json.completed_at @task.completed_at # nil
end
