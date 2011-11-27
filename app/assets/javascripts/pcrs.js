jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

$(document).ready(function() {

    $('select#pcr_dnasamples').live('change',
    function() {
        selected_id = $('select#pcr_dnasamples').val()
        x = $("a#sample_link").attr("href", "/dnasamples/" + selected_id);
        $.ajax({
            url: "/pcrs/getdnasamplestats",
            type: "POST",
            data: {
                id: selected_id
            },

            success: function(json, status) {
                var obj = jQuery.parseJSON(json);
                $('.dnasample_stats').html(obj.stats)
            },
            error: function(json, status) {
                $('.dnasample_stats').html("Error Loading DNA Sample")
            }

        });

    });
    $('select#gene_primerl').live('change',
    function() {
        dataString = $('select#gene_primerl').val();



        $.ajax({
            url: "/pcrs/getprimersequence",
            type: "POST",
            data: {
                id: dataString
            },

            success: function(json, textStatus) {

                var obj = jQuery.parseJSON(json);

                $('.primerl').html(obj.sequence);
            },

            error: function(json, status) {
                alert(status)
            }
        });
        //close ajax
    });

    $('select#gene_primerh').live('change',
    function() {
        dataString = $('select#gene_primerh').val();



        $.ajax({
            url: "/pcrs/getprimersequence",
            type: "POST",
            data: {
                id: dataString
            },

            success: function(json, textStatus) {

                var obj = jQuery.parseJSON(json);

                $('.primerh').html(obj.sequence);
            },

            error: function(json, textStatus) {

                }
        });
        //close ajax
    });
    // $('select#pcr_dnasamples').live('change',function(){
    // 		selected_id=$('select#pcr_dnasamples').val()
    // 		x=$("a#sample_link").attr("href", "/dnasamples/"+selected_id);
    // 		
});
