// $("h1").addClass("big-title")

// for (let i = 0; i < 5; i++) {
//     document.querySelectorAll("button")[i].addEventListener("click", function () {
//         document.querySelector("h1").style.color = "green";
//     });
// }

// $("button").click(function () {
//     $("h1").css("color", "red");
// });

// $(document).keypress(function (event) {
//     $("h1").text(event.key);
// })

$("button").on("click", function () {
  // Does both the function: .show() and .hide()
  // $("h1").toggle();

  // Does both the function: .fadeIn() and .fadeOut()
  // $("h1").fadeToggle();

  // Does both the function: .slideUp() and .slideDown()
  // $("h1").slideToggle();

  // $("h1").animate({
  //     opacity: 0.5,
  //     "font-size": "100px"
  // })

  $("h1").hide().slideDown().animate({ opacity: 0.5 });
});
