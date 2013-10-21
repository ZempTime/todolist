# If errors, do one thing
# if not, do another

if @task.errors.any?
  json.success false
  json.error @task.errors.full_messages.first
else
  #id, description
  json.id @task.id
  json.description @task.description
  json.success true
  json.partial render(partial: "task.html.erb", locals: {task:@task})
end
