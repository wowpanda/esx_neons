$(function() {
  $(document).keyup(function(e) {
      if (e.keyCode == 27) {
          $(".container-fluid").fadeOut();
          $.post('http://esx_neons/fechar', JSON.stringify({}));
      }
  });
  $(document).ready(function() {
      window.addEventListener('message', function(event) {
          var item = event.data;
          if (item.ativa == true) {
              $('.container-fluid').css('display', 'block');
          } else if (item.ativa == false) {
              $('.container-fluid').css('display', 'none');
          }
      });

      $("#1").click(function() {
          $.post('http://esx_neons/1', JSON.stringify({}));
          2

      });

      
      $("#2").click(function() {
        $.post('http://esx_neons/2', JSON.stringify({}));
        2

    });

    
    $("#3").click(function() {
        $.post('http://esx_neons/3', JSON.stringify({}));
        2

    });

    
    $("#4").click(function() {
        $.post('http://esx_neons/4', JSON.stringify({}));
        2

    });

    $("#5").click(function() {
        $.post('http://esx_neons/5', JSON.stringify({}));
        2

    });

  })
})

const cards = Array.from(document.getElementsByClassName("job"));
const inner = document.querySelector(".inner");

(function init() {
  slideAndScale();
  cards.map((card, i) => {
      card.addEventListener("click", () => {
          const id = card.getAttribute("data-scale");
          if (id !== 2) {
              scale -= id - 2;
              slideAndScale();
          }
      }, false);
  });
})();