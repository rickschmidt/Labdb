jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

$(document).ready(function() {
	$('.genes_index tr').click(function(e) {

						selected=$(this).closest('tr').children('td.icons#show').children('a').attr("href");
						window.location=selected;

});
});