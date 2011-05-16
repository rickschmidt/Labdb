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
      success=jQuery('tr.exp:last').find('select#pcr_success').val();
      alert(success);
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
             $('.success:last').attr('id',index);
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
    
    $('select#pcr_success').live('change', function(){

    
        var currentId = $(this).parent().parent();
        var row_idx = currentId.prevAll().length;
        alert(row_idx);
        var tubeid=$(this).parent().parent().find('.custom').find('select#experiment_pcrs').val();
        var tubeidPrev=$(this).parent().parent().find('.customPrev').html();
        if(tubeid!=null){
        alert(tubeid);
        }
        if(tubeidPrev){
            alert(tubeidPrev);
        }
        

    });
    
    $('input#pcr_pcr_success').click(function() {
        var checked=this.checked
         alert(checked);
        var currentId = $(this).parent().parent();
        var row_idx = currentId.prevAll().length;
        alert(row_idx);
        var tubeid=$(this).parent().parent().find('.custom').find('select#experiment_pcrs').val();
        var tubeidPrev=$(this).parent().parent().find('.customPrev').html();
        if(tubeid!=null){
            var tube=tubeid;
        alert(tubeid);
        }
        if(tubeidPrev){
            var tube=tubeidPrev;
            alert(tubeidPrev);
        }
        
         $.ajax({
            url: "/experiments/updatesuccess",
            type: "POST",
            data:{checked:checked,tube:tube},
            
            success: function(json,textStatus){
                alert(textStatus);
            },
            error: function(json,textStatus){
                alert(textStatus);
            }
        });
        
    });
    
    $('button.save').live('click', function(){
        var pcrs=new Array();
        var successfulPcrsArray=new Array();
        var currentExperiment=$('input#experimentId').val();

        $('tr#.exp').each(function (i){
            alert("i",i.val);
            var selpcr=$('select#experiment_pcrs').val();
            if(selpcr!=''){
                pcrs[i]=selpcr;
                alert(pcrs[i]);
                var x=$('select#pcr_success').val();
                alert("x",x);
                
                if(x=="1"){
                     alert("here");
                        var id=$('select#pcr_success').val();
                        alert(id+"id");
                          successfulPcrsArray[i]=id;
                        alert(successfulPcrsArray);
                    
                }
            }
            
            
        });

        // $('select#experiment_pcrs').each(function (i){
        // 
        //             if ($(this).val()!=''){
        //                   pcrs[i]=$(this).val();
        //                   alert(pcrs[i]);
        //                  var x= $('select#pcr_success');
        //                  alert("x",x);
        //                 if(x=="1"){
        //                         alert("here");
        //                         var id=$('select#pcr_success').val();
        //                         alert(id+"id");
        //                   successfulPcrsArray[i]=id;
        //                         alert(successfulPcrsArray);
        //                     };
        // 
        //                 };
        //                           
        //         });
        

        
        $.ajax({
            url: "/experiments/savepcrtubes",
            type: "POST",
            data:{id:pcrs,experimentId:currentExperiment,successfulPcrs:successfulPcrsArray},
            
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


























