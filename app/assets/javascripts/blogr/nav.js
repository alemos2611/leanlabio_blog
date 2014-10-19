$( document ).ready(function() {
    $(document).scroll(function() {
      if ($(document).scrollTop() > 0) {
        return $(".navbar-custom").addClass("nav-border");
      } else {
        return $(".navbar-custom").removeClass("nav-border");
      }
    });
});
