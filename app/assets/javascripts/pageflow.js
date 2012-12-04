var PageMover = {
  hidePage: function(element_id) {
    $(element_id).hide();
  },

  showPage: function(url, element_id) {
    $.ajax({
      url: url,
      type: 'post',
      dataType: 'json',
      success: function(data) {
        $(element_id).html(data.html);
      }
    });

    $(element_id).show();
  },

  transitionUp: function(element_id) {
    $('#band').css({'z-index': 1000});

    $(element_id).css({'z-index': 0})
                 .animate({position: 'relative', top: '-1000px'}, 3000, function() {
                   $(this).hide();
                 });
  },

  eventBindings: function() {

    // When click "Create New Mix", show the "new mixtape" page
    $('#new_mix_button').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href')

      PageMover.showPage(url, '#new_mixtape');
    });
  }
}

$(document).ready(function() {
  PageMover.hidePage('#new_mixtape');

  PageMover.eventBindings();
});
