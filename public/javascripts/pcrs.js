jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
}); 

$(document).ready(function (){  
  $('select#gene_primerl').live('change',function (){
      dataString = $('select#gene_primerl').val();
      

  
      $.ajax({
          url: "/pcrs/getprimersequence",
          type: "POST",
          data: {id:dataString},
    
          success: function(json,textStatus){

              var obj = jQuery.parseJSON(json);     
      
              $('.primerl').html(obj.sequence);
          },
          
          error: function(json,status){
      
          }
      }); //close ajax
  });
      
      $('select#gene_primerh').live('change',function(){
          dataString = $('select#gene_primerh').val();
      
          
          
         $.ajax({
          url: "/pcrs/getprimersequence",
          type: "POST",
          data: {id:dataString},
    
          success: function(json,textStatus){
      
              var obj = jQuery.parseJSON(json);              
                            
              $('.primerh').html(obj.sequence);
          },
          
          error: function(json,textStatus){
      
          }
      }); //close ajax
          
          
      });
    });
    