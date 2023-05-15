//= require jquery
//= require popper
//= require bootstrap
//= require_tree.
//= require rails-ujs
*= require_tree .
*= require_self
*= require bootstrap-modal-bs3patch
*= require bootstrap-modal

$(function () {
    $('input, select').on('focus', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
    });
    $('input, select').on('blur', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
    });
});
