    window.onscroll = function() {myFunction()};
    
    var navbar = document.getElementById("nav-sticky");
    var sticky = navbar.offsetTop;
    
    function myFunction() {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky")
    } else {
        navbar.classList.remove("sticky");
    }
    }
    $('.square').click(function(){ 
        $('.square2').css({
            'visibility': 'visible'
        });
        $('.square').css({
            'visibility': 'hidden'
        });
       });

       


       const button = document.querySelector('input');
       
       button.addEventListener('click', updateButton);
       function updateButton() {
        var x = document.getElementById("toclose");
        x.style.display = "block";

      }

      var slideIndex = 1;
      showSlides(slideIndex);
      
      function plusSlides(n) {
        showSlides(slideIndex += n);
      }
      
      function currentSlide(n) {
        showSlides(slideIndex = n);
      }
      
      function showSlides(n) {
        var i;
        var slides = $(".mySlides");
        if (n > slides.length) {slideIndex = 1}    
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
        }

        slides[slideIndex-1].style.display = "block";  
      }
      $('.prev').click(function(){ plusSlides(-1);  });
      $('.next').click(function(){ plusSlides(1);});

