// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// $(document).ready(function (){  
//   $('#primerh').submit(function (){  
//     $.post($(this).attr('action'), $(this).serialize(), null, "script");  
//     return false;  
//   });  
// }); 

$(document).ready(function() {
		          $('#toggleButton').click(function() {
					if ($('#toggleSection').is(":hidden"))
					               {
					                    $('#toggleSection').slideDown("slow");

					               } else {
					                    $('#toggleSection').slideUp("slow");

			               }
		               return false;
		          });
		          $('.target2').change(function() {
                      alert('Handler for .change() called.');
                      
                });
                 $('#toggleButton2').live("click",function() {
                jQuery('#newpair').clone().appendTo('body');
            });

		     });
		     
$('#toggleButton').live('change', function() {
    $(this).after('<input id="input' + ++newNum + '" value="Add another item" />');
});

$(function() {
  $(".newprimer a").live("click", function() {
    $(".primer").html("Page is loading...");
    $.getScript(this.href);
    return false;
  });
});


$('.target2').click(function() {
  alert('Handler for .change() called.');
});

