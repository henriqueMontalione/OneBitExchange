$(document).ready ->

  $('#amount').keyup(() -> converter() );  

  $("#icone").click(() ->
    source = $("#source_currency").val();
    target = $("#target_currency").val();
    $("#source_currency").val(target);
    $("#target_currency").val(source);
    converter();
  );
  
  converter = ->
    $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
  