//Experiment views

//Sets up AJAX request to accept js
jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
}); 


//
$(document).ready(function (){  
        //Executes everytime the experiment pcr tube select box changes
     $('select#experiment_pcrs').live('change',function (){

      dataString = jQuery('tr.exp:last').find('select#experiment_pcrs').val();

         $.ajax({
          url: "/experiments/getpcrtube",
          type: "POST",
          data: {id:dataString},
    
          success: function(json,textStatus){

              var obj = jQuery.parseJSON(json);


             

            
             var index = jQuery('tr.exp:last').index();

          var myDiv = jQuery('tr.exp:last').clone().attr('id',index);
             $('.primerh:last').attr('id',index).html(obj.primerh);
             $('.dna:last').attr('id',index).html(obj.dna);
             $('.primerl:last').attr('id',index).html(obj.primerl);
             myDiv.appendTo('table.custom');
             

          },
          
          error: function(json,textStatus){

              var flash_div = $("p#error");
              $('<p id="error" style="color: red">Error: No DNA Sample is associated witht that PCR Tube.</p>').insertBefore('table.custom').fadeOut(3200);

          }

      });
     
    });
}); //docuement ready 