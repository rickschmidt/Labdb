jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
}); 

$(document).ready(function (){  
  $('select#gene_primerl').live('change',function (){
      dataString = $('select#gene_primerl').val();
      alert('primer1');

  
      $.ajax({
          url: "/pcrs/getprimersequence",
          type: "POST",
          data: {id:dataString},
    
          success: function(json,textStatus){
              alert(textStatus);
              var obj = jQuery.parseJSON(json);     
               alert(obj.sequence);         
              $('.primerl').html(obj.sequence);
          },
          
          error: function(json,status){
              alert(status);
          }
      }); //close ajax
  });
      
      $('select#gene_primerh').live('change',function(){
          dataString = $('select#gene_primerh').val();
          alert("primer2");
          
          
         $.ajax({
          url: "/pcrs/getprimersequence",
          type: "POST",
          data: {id:dataString},
    
          success: function(json,textStatus){
              alert(textStatus);
              var obj = jQuery.parseJSON(json);              
                            alert(obj.sequence);
              $('.primerh').html(obj.sequence);
          },
          
          error: function(json,textStatus){
              alert(textStatus);
          }
      }); //close ajax
          
          
      });
    });
    