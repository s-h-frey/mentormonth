$(document).ready(function(){
    $('.single-item').slick({
        prevArrow:"<img class='a-left control-c prev slick-prev' src='../images/carousel-arrow-left.svg'>",
        nextArrow:"<img class='a-right control-c next slick-next' src='../images/carousel-arrow-right.svg'>",
    });
});

$(document).ready(function(){
    $('.multiple-items').slick({
      infinite: false,
      slidesToShow: 2.5,
      slidesToScroll: 3,
      arrows: false,
    });
});



var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        /* Toggle between adding and removing the "active" class,
        to highlight the button that controls the panel */
        this.classList.toggle("active");

        /* Toggle between hiding and showing the active panel */
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });
}
