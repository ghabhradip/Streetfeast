jQuery(document).ready(function() {
  $('#menu_list_datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#menu_list_datatable').data('source'),
    "pagingType": "full_numbers",
 
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});