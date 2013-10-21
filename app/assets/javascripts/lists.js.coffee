jQuery ->
  # TODO:
  # Select link
  # Add on click event
  # Get data url attribute .data("asdf")
  # Make AJAX DELETE request to that url
  # When it's done, remove item from list with jQuery

  $("#new_task").on "submit", (e) ->
    e.preventDefault()
    $form = $(this)
    url = $form.attr("action")
    errors = $(".errors")
    $.ajax(
      type: "POST",
      url: url,
      data: $form.serialize(),
      dataType: "JSON",
    ).done (data) ->
      console.log data
      if data.success
        errors.empty()
        $("#tasks").prepend(data.partial)
        $("#task_description").val("")

        $(".delete-link").first().on "click", delete_clicked
        $(".task-checkbox").first().on "change", task_checked
      else
        errors.empty().prepend "#{data.error}"

        # ("<li><label>#{data.description}</label></li>")

  $(".delete-link").on "click", delete_clicked
  $(".task-checkbox").on "change", task_checked

delete_clicked = (e) ->
  url = $(this).data("url")
  $li = $(this).parents("li")

  $.ajax(
    type: "DELETE",
    url: url,
    dataType: "JSON",
  ).done (data) ->
    $li.remove()

task_checked = (e) -> 
  $checkbox = $(this)
  $form     = $checkbox.parents("form")
  $label    = $checkbox.parents("label")
  url       = $form.attr("action")

  $.ajax(
    type: "PUT",
    url:  url,
    data: $form.serialize(),
    dataType: "JSON"
  ).done (data) ->
    console.log data

    # Add strikeout to item
    $checkbox.siblings("span").toggleClass("strikeout")

    if data.completed_at?
      console.log "Completed"
      $label.append("<span class='completed-at'>Completed on #{data.completed_at}</span>")

    else
      console.log "Incomplete"
      $label.find(".completed-at").remove()

