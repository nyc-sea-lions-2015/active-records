$(document).ready(function() {

  $('#all-tracks').on('click', '.add-track-btn', function(){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({url: $target.attr('href'),
            method: 'get',
            dataType: 'html'
    }).done(function(response){
      $('#track-list').append(response);

    });
  });

    $('#track-list').on('submit', function(){
      event.preventDefault();
      $target = $(event.target);

      $.ajax({url: $target.attr('action'),
              method: 'POST',
              data : $target.serialize(),
              dataType: 'json'
      }).done(function(response){
        $('#all-tracks').append('<li>'+ response.title + '</li>'); 
        $('.tracks-add-form').remove();
      });
    });

});
