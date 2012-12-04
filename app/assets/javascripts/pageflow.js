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
        // $transitionUp.
      }
    });

    $(element_id).show();
  },

  transitionOutUp: function(element_id) {
    var headerPosition = $('#header').css('position');
    $('#header').css({position: 'relative'});

    $(element_id).css({'z-index': 0, 'margin-bottom': '600px'})
                 .animate({'margin-top': '-1000px'}, 3000, function() {
                   $(this).css({visibility: 'hidden'});
                   $('#header').css({position: headerPosition});
                 });
  },

  transitionInUp: function(element_id) {
    $(element_id).css({position: 'absolute', bottom: ''})
    $(element_id).show();
  },

  eventBindings: function() {
    // When click "Create New Mix", show the "new mixtape" page
    $('#new_mix_button').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      PageMover.showPage(url, '#new_mixtape');
      PageMover.transitionOutUp( '#home');
    });
  }
}

$(document).ready(function() {
  PageMover.hidePage('#new_mixtape');

  PageMover.eventBindings();
});
