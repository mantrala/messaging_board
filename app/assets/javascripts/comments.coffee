$ ->
  $("._comment_box").keyup ->
    console.log $(this).val()
    if $(this).val().trim().length > 0
      $('._comment').addClass('blue')
      $('._comment').prop('disabled', false)
    else
      $('._comment').removeClass('blue')
      $('._comment').prop('disabled', true)