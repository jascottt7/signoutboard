# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
        $('#hor-minimalist-a').dataTable({
        "iDisplayLength": 100,
        "bPaginate": false,
        "aoColumns": [
          { "bSortable": false, "bSearchable": false },
          { "bSearchable": false },
          { "bSortable": false, "bVisible": false  },
          { "bSortable": false, "bSearchable": false }, 
          { "bSortable": false, "bSearchable": false },
          { "bSortable": false, "bSearchable": false },
        ]
 
        });
