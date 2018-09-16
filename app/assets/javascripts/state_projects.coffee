# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#state-form-project", (ev,data) -> 
    # console.log data
$(document).on "ajax:error", "form#state-form-project", (ev,data) -> 
    # console.log data
