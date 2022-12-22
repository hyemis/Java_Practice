/*
    id 속성의 값을 사용하여 엘리먼트 선택    -> document.getElementById
    name 속성의 값을 사용하여 엘리먼트 선택  -> document.getElementsByName
    태그명을 사용하여 엘리먼트 선택          -> document.getElementsByTagName
    class 속성의 값을 사용하여 엘리먼트 선택 -> document.getElementsByClassName


    CSS의 선택자를 활용하여 1개의 엘리먼트 선택    -> document.querySelector
    CSS의 선택자를 활용하여 여러 개의 엘리먼트 선택 -> document.querySelectorAll
*/

function changeUpper() {
    //var listItems = document.getElementsByClassName("menu-item");
    var listItems = document.querySelectorAll(".menu-item");

    for(let item of listItems) {
        item.innerText = item.innerText.toUpperCase();
    }
}