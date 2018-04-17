// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function(){
  if (($(".gigs.new").length > 0) || ($(".gigs.edit").length > 0)) {
    //Javascript for google places api, autocomplete
    var input = document.getElementById('gig_location');
    autocomplete = new google.maps.places.Autocomplete(input, {types: ['geocode']});
    google.maps.event.addListener(autocomplete, 'place_changed', function(){
      var place = autocomplete.getPlace();
    });

    //Javascript to hide location field if not needed by user
    var ddl = document.getElementById("gig_allow");
    locationField();
    ddl.onchange = locationField;
    function locationField() {
      var ddl = document.getElementById("gig_allow");
      var selectedValue = ddl.value;


      if (selectedValue == "Online Only") {
        $(".location-form-group").css("display", "none");
        $("#gig_location").val("");
      } else {
        $(".location-form-group").css("display", "");
      }
    };
  }

  $(".carousel-control").click(function() {
    $('.video').get(0).pause();
  });


  $('.video').parent().click(function () {
    if($(this).children(".video").get(0).paused){
        $(this).children(".video").get(0).play();
        $(this).children(".playpause").fadeOut();
    }else{
       $(this).children(".video").get(0).pause();
        $(this).children(".playpause").fadeIn();
    }
  });
});
