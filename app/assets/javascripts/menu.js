jQuery(document).ready(function() {
  $('#menu_list').dataTable({
    "processing": true,
    "serverSide": true,
    "pagingType": "full_numbers",
    "ajax": $('#menu_list').data('source')
  });
});