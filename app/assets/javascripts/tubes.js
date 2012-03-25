jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

$(document).ready(function() {

    $('.tubes_index tr').click(function(e) {

        selected = $(this).closest('tr').children('td.icons#show').children('a').attr("href");
        window.location = selected;

    });
//Autocompletes Primer in form

    $('#primer_select').autocomplete(

		{

        // This shows the min length of charcters that must be typed before the autocomplete looks for a match.
        minLength: 2,
        // This is the source of the auocomplete suggestions. In this case a list of names from the people controller, in JSON format.
        source: '/primers.json',
        // This updates the textfield when you move the updown the suggestions list, with your keyboard. In our case it will reflect the same value that you see in the suggestions which is the person.given_name.
        focus: function(event, ui) {
            $('#primer_select').val(ui.item.name);
            return false;
        },
        // Once a value in the drop down list is selected, do the following:
        select: function(event, ui) {
            // place the person.given_name value into the textfield called 'select_origin'...
            $('#primer_select').val(ui.item.name);
			$('<span style="float:right;" class="ui-icon ui-icon-check"></span>').insertAfter('#primer_select');	
            // and place the person.id into the hidden textfield called 'link_origin_id'.
            $('#primer_id').val(ui.item.id);
            return false;
        }
 	
    })
    // The below code is straight from the jQuery example. It formats what data is displayed in the dropdown box, and can be customized.
    .data("autocomplete")._renderItem = function(ul, item) {
        return $("<li></li>")
        .data("item.autocomplete", item)
        // For now which just want to show the person.given_name in the list.
        .append("<a>" + item.name  + "</a>")
        .appendTo(ul);
            };
	      
//Autocompletes PCR in form

    $('#pcr_select').autocomplete(

		{

        // This shows the min length of charcters that must be typed before the autocomplete looks for a match.
        minLength: 2,
        // This is the source of the auocomplete suggestions. In this case a list of names from the people controller, in JSON format.
        source: '/pcrs.json',
        // This updates the textfield when you move the updown the suggestions list, with your keyboard. In our case it will reflect the same value that you see in the suggestions which is the person.given_name.
        focus: function(event, ui) {
            $('#pcr_select').val(ui.item.pcr_tube_number);
            return false;
        },
        // Once a value in the drop down list is selected, do the following:
        select: function(event, ui) {
            // place the person.given_name value into the textfield called 'select_origin'...
            $('#pcr_select').val(ui.item.pcr_tube_number);
			$('<span style="float:right;" class="ui-icon ui-icon-check"></span>').insertAfter('#pcr_select');	
            // and place the person.id into the hidden textfield called 'link_origin_id'.
            $('#pcr_id').val(ui.item.id);
            return false;
        }
 	
    })
    // The below code is straight from the jQuery example. It formats what data is displayed in the dropdown box, and can be customized.
    .data("autocomplete")._renderItem = function(ul, item) {
        return $("<li></li>")
        .data("item.autocomplete", item)
        // For now which just want to show the person.given_name in the list.
        .append("<a>" + item.pcr_tube_number  + "</a>")
        .appendTo(ul);
            };
	});    