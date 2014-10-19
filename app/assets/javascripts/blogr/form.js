$( document ).ready(function() {
  $('.name-input').focus(function() {
    this.select();
  });

  $('.editable').on('input', function() {
    $('#post_text').val($(this).html());
  });
});
