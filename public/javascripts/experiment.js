//Experiment views

//Sets up AJAX request to accept js
jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
}); 


//
$(document).ready(function (){  

        //Executes everytime the experiment pcr tube select box changes
        $('button.message').live('click',function(){
            $('p.message').remove();
          
        });
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
             $('select#experiment_pcrs').attr('disabled', 'disabled');
             myDiv.appendTo('table.custom');
                         $('p.message#errorExplanation').remove();
             

          },
          
          error: function(json,textStatus){
              $('tr.exp:last select#experiment_pcrs').val(0);
                                       $('p.message').remove();
              $('<p class="message" id="errorExplanation">Error1: No DNA Sample is associated witht that PCR Tube.<button class="message"><p id="cancel">x</p></button></p>').appendTo('#messages').fadeIn(slow);

          }

      });
     
    });
    
    $('button.save').live('click', function(){
        var pcrs=new Array();
        var currentExperiment=$('input#experimentId').val();

        $('select#experiment_pcrs').each(function (i){
            if ($(this).val()!=''){
            
                  pcrs[i]=$(this).val();
                
                }                  
        });
        
        $.ajax({
            url: "/experiments/savepcrtubes",
            type: "POST",
            data:{id:pcrs,experimentId:currentExperiment},
            
            success: function(json,textStatus){

                $('p.message#errorExplanation').remove();
                 $('<p class="message" id="success">PCR Tubes saved to this experiment.<button class="message"><p id="cancel">x</p></button></p>').appendTo('#messages').fadeIn(slow);
            },
            
            error: function(json,textStatus){

                $('p.message').remove();
              $('<p class="message" id="errorExplanation">Error: No DNA Sample is associated witht that PCR Tube.<button class="message"><p id="cancel">x</p></button></p>').appendTo('#messages').fadeIn(slow);
            }
        });


    });
    
    
    

}); //docuement ready 


























