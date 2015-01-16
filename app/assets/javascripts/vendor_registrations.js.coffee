jQuery ->
  todays_date = new Date()
  late_fee_date = new Date(2015, 1, 10)

  if todays_date < late_fee_date
    $('#vendor_registration_total').val(0)
    $('#final_total').val(0)
  else
    $('#vendor_registration_total').val(20)
    $('#final_total').val(0)

  if $("input[name='vendor_registration[registration_fee]']").is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 70, 10)
      $('#final_total').val(parseInt($('#final_total').val()) + 70, 10)

  if $("input[name='vendor_registration[late_fee]']").is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 20, 10)
      $('#final_total').val(parseInt($('#final_total').val()) + 20, 10)

  if $("input[name='vendor_registration[ad_fee]']").is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 20, 10)
      $('#final_total').val(parseInt($('#final_total').val()) + 20, 10)

  $("input[name='vendor_registration[registration_fee]']").on 'click', ->
    if $(this).is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 70, 10)
      $('#final_total').val(parseInt($('#final_total').val()) + 70, 10)
    else
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) - 70, 10)
      $('#final_total').val(parseInt($('#final_total').val()) - 70, 10)
      # do something if not checked

  $("input[name='vendor_registration[late_fee]']").on 'click', ->
    if $(this).is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 20, 10)
      $('#final_total').val(parseInt($('#final_total').val()) + 20, 10)
    else
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) - 20, 10)
      $('#final_total').val(parseInt($('#final_total').val()) - 20, 10)
      # do something if not checked

  $("input[name='vendor_registration[ad_fee]']").on 'click', ->
    if $(this).is(':checked')
      # do something when checked
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) + 20, 10)
      $('#final_total').val(parseInt($('#final_total').val()) + 20, 10)
    else
      $('#vendor_registration_total').val(parseInt($('#vendor_registration_total').val()) - 20, 10)
      $('#final_total').val(parseInt($('#final_total').val()) - 20, 10)
      # do something if not checked

    #Initialize Stripe.
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  registration_payment.setupForm()

registration_payment =
  setupForm: ->
    $('#new_vendor_registration').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#vendor_registration_pay_by_check').is(':checked')
        true
      else
        if $('#card_number').val()
            registration_payment.processCard()
            false
          else if not $('#card_number').val() and $('#vendor_registration_vendor_stripe_card_token').val()
            true
          else
            alert "You have not entered a credit card."
            $('input[type=submit]').attr('disabled', false)
            false

  processCard: ->
    alert $('#card_number').val()
    card =
      name: $('#vendor_registration_email').val()
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, registration_payment.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#vendor_registration_vendor_stripe_card_token').val(response.id)
      if confirm('Your information has been validated. Click OK to complete the transaction (this will bill your card).')
        $('#new_vendor_registration')[0].submit()
      else
        false
        $('input[type=submit]').attr('disabled', false)
    else
      $('#stripe_error').text(response.error.message)
      $('#cc_field').addClass('has-error')
      $('input[type=submit]').attr('disabled', false)

