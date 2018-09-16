# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form-project", (ev,data) -> 
    # console.log data
    $(this).find("textarea").val("")
    $("#comments-box-project").append("<li> #{data.user.name} - #{data.comment} </li>")
$(document).on "ajax:error", "form#comments-form-project", (ev,data) -> 
    # console.log data