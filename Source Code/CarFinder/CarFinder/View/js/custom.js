/* HTML document is loaded. DOM is ready.
-------------------------------------------*/

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("gotoTopBtn").style.display = "block";
    } else {
        document.getElementById("gotoTopBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  var scrollDuration = 500;
  var scrollStep = -window.scrollY / (scrollDuration / 15),
     scrollInterval = setInterval(function(){
     if ( window.scrollY != 0 ) {
         window.scrollBy( 0, scrollStep );
     }
     else clearInterval(scrollInterval);
 },15);
}



function isWindows()
{
  return navigator.platform.indexOf('Win') > -1;
}

function changeVisibility(){
  if(isWindows()){
    document.getElementById("download_btn").style.visibility = "visible";

  }
  else {
      document.getElementById("download_btn").disabled = true;
      document.getElementById("download_btn").href="#home";
      showPopup();
  }
}
function showPopup(x) {
    var popup = document.getElementById(x);
    popup.classList.toggle("show");
}

function showfeaturePopup(x) {
    var popup = document.getElementById(x);
    popup.classList.toggle("show");
    console.log(1);
}

function hidefeaturePopup(x)
{
  var popup = document.getElementById(x);
  popup.classList.toggle("show");
}


$(function(){

    /* start typed element */
    //http://stackoverflow.com/questions/24874797/select-div-title-text-and-make-array-with-jquery
    var subElementArray = $.map($('.sub-element'), function(el) { return $(el).text(); });
    $(".element").typed({
        strings: subElementArray,
        typeSpeed: 30,
        contentType: 'html',
        showCursor: false,
        loop: true,
        loopCount: true,
    });
    /* end typed element */

    /* Smooth scroll and Scroll spy (https://github.com/ChrisWojcik/single-page-nav)
    ---------------------------------------------------------------------------------*/
    $('.templatemo-nav').singlePageNav({
        offset: $(".templatemo-nav").height(),
        filter: ':not(.external)',
        updateHash: false
    });

    /* start navigation top js */
    $(window).scroll(function(){
        if($(this).scrollTop()>58){
            $(".templatemo-nav").addClass("sticky");
        }
        else{
            $(".templatemo-nav").removeClass("sticky");
        }
    });

    /* Hide mobile menu after clicking on a link
    -----------------------------------------------*/
    $('.navbar-collapse a').click(function(){
        $(".navbar-collapse").collapse('hide');
    });
    /* end navigation top js */

    $('body').bind('touchstart', function() {});

    /* wow
    -----------------*/
    new WOW().init();
});

/* start preloader */
$(window).load(function(){
	$('.preloader').fadeOut(1000); // set duration in brackets
});
/* end preloader */
