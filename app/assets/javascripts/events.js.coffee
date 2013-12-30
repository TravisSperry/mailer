# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $ed = $('#event_date')
  $ed.datepicker()
  $ed.on 'change', ->
    today = new Date()
    date = new Date($ed.val())
    string_date = date.toString()
    event_date = new Date(string_date)
    half_month = new Date(today.getYear(), today.getMonth(), 15)
    if today > half_month and event_date <= (1).months().fromNow().moveToLastDayOfMonth()
      alert "Event registrations for #{event_date.toString("MMMM")} #{event_date.getFullYear()} are closed.
      You may only add events for #{today.add(2).months().toString("MMMM")} #{today.add(2).months().getFullYear()} or later"
      $ed.val("")
    else if today < half_month and event_date <= event_date.moveToLastDayOfMonth()
      alert "Event registrations for #{event_date.toString("MMMM")} #{event_date.getFullYear()} are closed.
      You may only add events for #{today.add(2).months().toString("MMMM")} #{today.add(2).months().getFullYear()} or later"
    else if today.getDate >= half_month and event_date > (1).months().fromNow()
      alert "Notice of this event will be sent with the #{event_date.addMonths(-1).toString("MMMM")} 20th mailing."
    else
      alert "Notice of this event will be sent with the #{event_date.addMonths(-1).toString("MMMM")} 20th mailing."