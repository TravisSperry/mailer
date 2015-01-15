jQuery ->
  todays_date = new Date()
  late_fee_date = new Date(2015, 1, 10)

  if todays_date < late_fee_date
    $('#vendor_registration_total').val(0)
  else
    $('#vendor_registration_total').val(20)
  $("input[name='vendor_registration[registration_fee]']").on 'click', ->
    if $(this).is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 70, 10)
    else
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) - 70, 10)
      # do something if not checked

  $("input[name='vendor_registration[late_fee]']").on 'click', ->
    if $(this).is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 20, 10)
    else
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) - 20, 10)
      # do something if not checked

  $("input[name='vendor_registration[ad_fee]']").on 'click', ->
    if $(this).is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 20, 10)
    else
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) - 20, 10)
      # do something if not checked

