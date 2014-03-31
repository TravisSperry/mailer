jQuery ->


  # Update student count and total when text is enetered in fields
  $("#students").on "change", ->
    student_count.update()

  #Update student count and total when field is removed
  $("#students").on "click", "a", ->
    setTimeout (-> student_count.update()), 1000

  #Initialize Stripe.
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  registration_payment.setupForm()

student_count =
  update: ->
    count = 0
    $("#students").find("[id$='_first_name']").each ->
      if ($(this).val() or $(this).closest("[id$='_last_name']").val()) and $(this).closest('tr').is(":visible")
        count += 1

    console.log count

    $("#registration_student_count").val(count)
    $('#registration_total > p').children('span').text("$#{count * 10}.00")


registration_payment =
  setupForm: ->
    $('#new_registration').submit ->
      student_count.update()
      if $('#registration_fee_waiver').is(":checked")
        registration_payment.amountUpdate()
        true
      else
        $('input[type=submit]').attr('disabled', true)
        if $('#card_number').val()
            registration_payment.processCard()
            false
          else if not $('#card_number').val() and $('#registration_stripe_card_token').val()
            true
          else
            alert "You have not entered a credit card."
            $('input[type=submit]').attr('disabled', false)
            false

  amountUpdate: ->
    str = $('#registration_total > p').children('span').text()
    str = str.replace(",","")
    str = str.replace("$","")
    str = str.replace(".","")
    amount = parseInt(str)
    $('#registration_total').val(amount)

  processCard: ->
    card =
      name: $('#registration_contact_email').val()
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, registration_payment.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      registration_payment.amountUpdate()
      $('#registration_stripe_card_token').val(response.id)
      if confirm('Your information has been validated. Click OK to complete the transaction (this will bill your card).')
        $('#new_registration')[0].submit()
      else
        false
        $('input[type=submit]').attr('disabled', false)
    else
      $('#stripe_error').text(response.error.message)
      $('#cc_field').addClass('has-error')
      $('input[type=submit]').attr('disabled', false)

