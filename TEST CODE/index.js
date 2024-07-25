$(document).ready(function () {
  var jokeSource = "https://api.icndb.com/jokes/";
  var joke = "Prepare for a joke";
  var category = "";
  $("#getJoke").click(function () {
    $.getJSON(jokeSource, function (json) {
      var rnd = Math.round(Math.random() * json.value.length);
      //   rnd = Math.round(rnd);
      if (json.value[rnd].joke.length > 124) {
        //sorting out the jokes longer than 124 symbols
        $(".twitter-button").removeClass("btn-primary").addClass("btn-danger");
      } else {
        $(".twitter-button").removeClass("btn-danger").addClass("btn-primary");
      }
      category = "Category: " + json.value[rnd].categories;
      if (json.value[rnd].categories == "") {
        category = "Category: Common";
      }
      joke = json.value[rnd].joke;
      $(".joke").fadeOut(300).html(joke).fadeIn(300);
      $(".category").fadeOut(300).html(category).fadeIn(300);
    });
  });
  $(".twitter-share-button").click(function () {
    $(this).attr(
      "href",
      "https://twitter.com/intent/tweet?text=" + joke + category
    );
  });
});
