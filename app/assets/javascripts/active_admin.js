//= require active_admin/base
//= require jsoneditor
//= require json_editor_init


jQuery(function() {
  $('form').on('click', '.remove-fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide(500);
    return event.preventDefault();
  });

  $('form').on('click', '.add-nested-form', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});
