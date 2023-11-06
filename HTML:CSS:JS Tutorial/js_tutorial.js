function init() {

    var h1tags = document.getElementsByTagName("h2");

    h1tags[0].onclick = changeColor;

}

function changeColor() {

    this.innerHTML = "Click again!";

    //generate random text color

    var random_color = '#' + Math.floor(Math.random()*16777215).toString(16);

    this.style.color = random_color;

}

onload = init;

