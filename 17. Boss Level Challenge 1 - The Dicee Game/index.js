// Generate random numbers for the dice faces
var randomNumber1 = Math.floor(Math.random() * 6 + 1);
var randomNumber2 = Math.floor(Math.random() * 6 + 1);

// Get references to the dice images and Set the src attribute to the randomly selected dice images
document
  .querySelector(".img1")
  .setAttribute("src", "images/dice" + randomNumber1 + ".png");
document
  .querySelector(".img2")
  .setAttribute("src", "images/dice" + randomNumber2 + ".png");

// Change the Title to Display a Winner
if (randomNumber1 > randomNumber2) {
  document.querySelector("h1").innerHTML = "🏁 Player 1 Wins!";
} else if (randomNumber1 < randomNumber2) {
  document.querySelector("h1").innerHTML = "Player 2 Wins! 🏁";
} else {
  document.querySelector("h1").innerHTML = "Draw! 🤷🏻‍♂️";
}
