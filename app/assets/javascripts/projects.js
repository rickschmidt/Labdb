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
	$('select#pcr_id').live('change',function(){
             dataString = jQuery('select#pcr_id').val();
              // var currentExperiment=$('input#experimentId').val();
              $.ajax({
                  url: "/pcrs/"+dataString,
                  type:"GET",
                  data:{id:dataString},

                  success: function(json,textStatus){
                      	var obj=jQuery.parseJSON(json);

						$('div#pcr_name').text("PCR Name: "+obj.pcr_tube_name);
						$('div#pcr_updated_at').text("Updated at: "+obj.updated_at);
						$('div#pcr_created_at').text("Created at: "+obj.created_at);
						

                      
					
                  }
              });
        });
        
});