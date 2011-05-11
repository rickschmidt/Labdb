// // Place your application-specific JavaScript functions and classes here
// // This file is automatically included by javascript_include_tag :defaults
// // $(document).ready(function (){  
// //   $('#primerh').submit(function (){  
// //     $.post($(this).attr('action'), $(this).serialize(), null, "script");  
// //     return false;  
// //   });  
// // }); 
// 
// // jQuery.ajaxSetup({  
// //     'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
// // });  
// 
// $(document).ready(function() {
//                $('#toggleButton').click(function() {
//                  if ($('#toggleSection').is(":hidden"))
//                                 {
//                                      $('#toggleSection').slideDown("slow");
// 
//                                 } else {
//                                      $('#toggleSection').slideUp("slow");
// 
//                         }
//                     return false;
//                });
//              
//                  $('.target2').live(function (){  
//                      $.post($(this).attr('getprimerpair'), $(this).serialize(), null, "script");  
//             return false;  
//           });  
//                  $('#toggleButton2').live("click",function() {
//                 jQuery('#newpair').clone().appendTo('body');
//             });
// 
//           });
//           
// 
//           
// $('#toggleButton').live('change', function() {
//     $(this).after('<input id="input' + ++newNum + '" value="Add another item" />');
// });
// 
// $(function() {
//   $(".newprimer a").live("click", function() {
//     $(".primer").html("Page is loading...");
//     $.getScript(this.href);
//     return false;
//   });
// });
// 
// 
// $('.target2').click(function() {
//   alert('Handler for .change() called.');
// });
// 

jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
}); 

$(document).ready(function (){  
  $('select#gene_primer').live('change',function (){
      dataString = $('select#gene_primer').val();

  
      // $.post('/genes/getprimerpair', function(dataString){
      //                //$.('target3').html(dataString);
      //                alert("hello from ajax");
      //            });
      $.ajax({
          url: "/genes/getprimerpair",
          type: "POST",
          data: {id:dataString},
    
          success: function(json,textStatus){
              
              var obj = jQuery.parseJSON(json);

              
              $('.primerh').html(obj.primerh);
            $('.primerl').html(obj.primerl);


          }
      });
    });
    
      // $('NULLselect#pcr_dnasamples').live('change',function (){
      //      dataString = $('select#pcr_dnasamples').val();
      //      pcr=$('input#pcrid').val();
      //      
      //      alert(pcr);
      //  
      //      // $.post('/genes/getprimerpair', function(dataString){
      //      //                //$.('target3').html(dataString);
      //      //                alert("hello from ajax");
      //      //            });
      // 
      //      $.ajax({
      //          url: "/pcrs/getdnasample",
      //          type: "POST",
      //          data: {id:dataString,pcrid:pcr},
      //    
      //          success: function(json,textStatus){
      //                   
      //              var obj = jQuery.parseJSON(json);
      //              alert(obj.dnaid)
      //              
      // 
      // 
      // 
      //          }
      //      });
      //    });
    //experiment show
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