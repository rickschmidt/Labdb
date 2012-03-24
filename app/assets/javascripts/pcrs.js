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


  //Autocompletes Taxonomy in form
    $('#taxonomy_select').autocomplete({
        // This shows the min length of charcters that must be typed before the autocomplete looks for a match.
        minLength: 2,
        // This is the source of the auocomplete suggestions. In this case a list of names from the people controller, in JSON format.
        source: '/taxonomies.json',
        // This updates the textfield when you move the updown the suggestions list, with your keyboard. In our case it will reflect the same value that you see in the suggestions which is the person.given_name.
        focus: function(event, ui) {
            $('#taxonomy_select').val(ui.item.genus + " " + ui.item.species + " " + ui.item.subspecies);
            return false;
        },
        // Once a value in the drop down list is selected, do the following:
        select: function(event, ui) {
            // place the person.given_name value into the textfield called 'select_origin'...
            $('#taxonomy_select').val(ui.item.genus + " " + ui.item.species + " " + ui.item.subspecies);
			$('<span style="float:right;" class="ui-icon ui-icon-check"></span>').insertAfter('#taxonomy_select');	
            // and place the person.id into the hidden textfield called 'link_origin_id'.
            $('#taxonomy_id').val(ui.item.id);
            return false;
        }
 	
    })
    // The below code is straight from the jQuery example. It formats what data is displayed in the dropdown box, and can be customized.
    .data("autocomplete")._renderItem = function(ul, item) {
        return $("<li></li>")
        .data("item.autocomplete", item)
        // For now which just want to show the person.given_name in the list.
        .append("<a>" + item.genus + " " + item.species + " " + item.subspecies + "</a>")
        .appendTo(ul);
    };

//Autocompletes Taxonomy in form
    $('#dnasample_select').autocomplete(
		{
        // This shows the min length of charcters that must be typed before the autocomplete looks for a match.
        minLength: 2,
        // This is the source of the auocomplete suggestions. In this case a list of names from the people controller, in JSON format.
        source: '/dnasamples.json',
        // This updates the textfield when you move the updown the suggestions list, with your keyboard. In our case it will reflect the same value that you see in the suggestions which is the person.given_name.
        focus: function(event, ui) {
            $('#dnasample_select').val(ui.item.dna_accession);
            return false;
        },
        // Once a value in the drop down list is selected, do the following:
        select: function(event, ui) {
            // place the person.given_name value into the textfield called 'select_origin'...
            $('#dnasample_select').val(ui.item.dna_accession);
			$('<span style="float:right;" class="ui-icon ui-icon-check"></span>').insertAfter('#dnasample_select');	
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
    };
}
				);
    // $('select#pcr_dnasamples').live('change',
    //   function() {
    //       selected_id = $('select#pcr_dnasamples').val()
    //       x = $("a#sample_link").attr("href", "/dnasamples/" + selected_id);
    //       $.ajax({
    //           url: "/pcrs/getdnasamplestats",
    //           type: "POST",
    //           data: {
    //               id: selected_id
    //           },
    // 
    //           success: function(json, status) {
    //               var obj = jQuery.parseJSON(json);
    //               $('.dnasample_stats').html(obj.stats)
    //           },
    //           error: function(json, status) {
    //               $('.dnasample_stats').html("Error Loading DNA Sample")
    //           }
    // 
    //       });
    // 
    //   });
    //   $('select#gene_primerl').live('change',
    //   function() {
    //       dataString = $('select#gene_primerl').val();
    // 
    // 
    // 
    //       $.ajax({
    //           url: "/pcrs/getprimersequence",
    //           type: "POST",
    //           data: {
    //               id: dataString
    //           },
    // 
    //           success: function(json, textStatus) {
    // 
    //               var obj = jQuery.parseJSON(json);
    // 
    //               $('.primerl').html(obj.sequence);
    //           },
    // 
    //           error: function(json, status) {
    //               alert(status)
    //           }
    //       });
    //       //close ajax
    //   });
    // 
    //   $('select#gene_primerh').live('change',
    //   function() {
    //       dataString = $('select#gene_primerh').val();
    // 
    // 
    // 
    //       $.ajax({
    //           url: "/pcrs/getprimersequence",
    //           type: "POST",
    //           data: {
    //               id: dataString
    //           },
    // 
    //           success: function(json, textStatus) {
    // 
    //               var obj = jQuery.parseJSON(json);
    // 
    //               $('.primerh').html(obj.sequence);
    //           },
    // 
    //           error: function(json, textStatus) {
    // 
    //               }
    //       });
    //       //close ajax
    //   });
    //   // $('select#pcr_dnasamples').live('change',function(){
    //   // 		selected_id=$('select#pcr_dnasamples').val()
    //   // 		x=$("a#sample_link").attr("href", "/dnasamples/"+selected_id);
    //   // 		
// });
