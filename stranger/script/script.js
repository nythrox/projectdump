function myFunction() {
    var botao = document.getElementById("menuIcon");
    elements = document.getElementsByClassName("menu");
    console.log(elements)
    for (i = 0; i < elements.length; ++i) {
        if (!(elements[i].classList.contains("active"))) {//if the elements dont have the class active
            elements[i].classList.add("active");   
        }
        else {
            elements[i].classList.remove("active"); 
        }
    }
    // elements.forEach(function(elemento) {
    //     if (!(elemento.classList.contains("active"))) { //if they dont have the class active
    //         // add the class acitve
    //         elemento.classList.add("aaaa");
    //     }
    //     else {
    
    //     }
    //     });
    // elements = getElementsbyClass "menu"
    // elements.addClass "toggle"
    //  if click again
    // elements.removeClass "toggle"  
}