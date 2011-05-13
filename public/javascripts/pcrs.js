jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
}); 

$(document).ready(function (){  
  $('select#gene_primer').live('change',function (){
      dataString = $('select#gene_primer').val();
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
      
      $('select#gene_primer2').live('change',function(){
          dataString = $('select#gene_primer2').val();
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
    