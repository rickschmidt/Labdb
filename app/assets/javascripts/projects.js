jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

$(document).ready(function() {
    $('.projects_index tr').click(function(e) {
    
           selected = $(this).closest('tr').children('td.icons#show').children('a').attr("href");
           window.location = selected;
    
       });
	$('.pcr').selectable({	  
	  selected: function(event, ui) { 
	    var p = $(this).html();
		alert(p);
		
	    
	  }
	});
});