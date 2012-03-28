jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

$(document).ready(function() {

    $('.pcrs_index tr').click(function(e) {

        selected = $(this).closest('tr').children('td.icons#show').children('a').attr("href");
        window.location = selected;

    });
	
	//Used in show page of pcr-updates tube info after select
	$('select#tube_id').live('change',function(){
             dataString = jQuery('select#tube_id').val();
              $.ajax({
                  url: "/tubes/"+dataString,
                  type:"GET",
                  data:{id:dataString},

                  success: function(json,textStatus){
                      	var obj=jQuery.parseJSON(json);

						$('div#tube_name').text("Tube Name: "+obj.pcr_tube_name);
						$('div#tube_updated_at').text("Updated at: "+obj.updated_at);
						$('div#tube_created_at').text("Created at: "+obj.created_at);
						

                      
					
                  }
              });
        });

	$('#pcr_tubesToAdd').focus(function() {
		$(this).val("");
		
	});
	$('#pcr_tubesToRemove').focus(function() {
		$(this).val("");
	});


//Autocompletes Taxonomy in form

    $('#dnasample_select').autocomplete(

		{
        // This shows the min length of charcters that must be typed before the autocomplete looks for a match.
        minLength: 2,
        // This is the source of the auocomplete suggestions. In this case a list of names from the people controller, in JSON format.
        source: '/dnasamples.json',
        // This updates the textfield when you move the updown the suggestions list, with your keyboard. In our case it will reflect the same value that you see in the suggestions which is the person.given_name.
        focus: function(event, ui) {
            $('#dnasample_select').val(ui.item.id);
            return false;
        },
        // Once a value in the drop down list is selected, do the following:
        select: function(event, ui) {
            // place the person.given_name value into the textfield called 'select_origin'...
            $('#dnasample_select').val(ui.item.dna_accession);
			$('<span style="float:right;" class="ui-icon ui-icon-check"></span>').insertAfter('#dnasample_select');	
			updateDnasampleInfo(ui.item.id);
            // and place the person.id into the hidden textfield called 'link_origin_id'.
            $('#dnasample_id').val(ui.item.id);
            return false;
        }
 	
    })
    // The below code is straight from the jQuery example. It formats what data is displayed in the dropdown box, and can be customized.
    .data("autocomplete")._renderItem = function(ul, item) {
        return $("<li></li>")
        .data("item.autocomplete", item)
        // For now which just want to show the person.given_name in the list.
        .append("<a>" + item.dna_accession  + "</a>")
        .appendTo(ul);
            }
			});      


		function updateDnasampleInfo(dnasample_id){

               $.ajax({
                   url: "/dnasamples/"+dnasample_id+"/stats",
                   type:"GET",
                   data:{id:dnasample_id},
 
                   success: function(json,textStatus){
                       	var obj=jQuery.parseJSON(json);
						var taxa=obj.taxonomy[0].genus+" "+obj.taxonomy[0].species+" "+obj.taxonomy[0].subspecies
 						$('div#gene_info').text(obj.gene[0].genbank )
						jQuery("<a />").prepend("<img src='/assets/show.png'/>").attr("href", "/genes/"+obj.gene[0].id).appendTo("#gene_info");
 						$('div#taxonomy_info').text(taxa);
						jQuery("<a />").prepend("<img src='/assets/show.png'/>").attr("href", "/taxonomies/"+obj.taxonomy[0].id).appendTo("#taxonomy_info");

 						
 
                       
 					
                   }
				
               });
        };        

   			
  