/**
 * 실시간 검사 
 *  아이디는 6 ~ 12 자 사이의 값을 입력하였는지 실시간으로 검사하여 문제가 있는 경우
 *  붉은색 테두리와 에러 메시지로 사용자에게 즉시 알릴 수 있도록 하고 정상 입력인 경우 
 *  초록색 테두리와 정상 메시지로 사용자에게 즉시 알릴 수 있도록 한다. 
 * 
 *  패스워드는 4 ~ 12 자 사이의 값을 입력하였는지 실시간으로 검사하여 위의 아이디와 동일
 *  한 처리를 하도록 한다. 
 * 
 *  패스워드 확인은 기존에 입력한 패스워드와 동일한 값인지를 실시간으로 검사형 위의 아이디와
 *  동일한 처리를 하도록 한다. 
 *  
 */
function userNameValid(e) {
    var element = e.target;

    if(element.nextElementSibling !== null){
        element.nextElementSibling.remove();
    }

    if(element.value.length >= 6 && element.value.length <= 12) {
        let div = document.createElement("div");
        div.innerText = "올바른 아이디 값 입니다.";
        div.style.color = "green"
        element.after(div);
        element.style.borderColor = "green";
        element.setAttribute("is-valid", true);
    } else {
        let div = document.createElement("div");
        div.innerText = "아이디는 6 ~ 12자를 입력해야 합니다.";
        div.style.color = "red";
        element.after(div);
        element.style.borderColor = "red";
        element.setAttribute("is-valid", false);
    }
}

function passwordValid(e) {
    var element = e.target;

    if(element.nextElementSibling !== null){
        element.nextElementSibling.remove();
    }
    
    if(element.value.length >= 4 && element.value.length <= 12) {
        let div = document.createElement("div");
        div.innerText = "올바른 패스워드 값 입니다.";
        div.style.color = "green"
        element.after(div);
        element.style.borderColor = "green";
        element.setAttribute("is-valid", true);

    } else {
        let div = document.createElement("div");
        div.innerText = "패스워드는 4 ~ 12자를 입력해야 합니다.";
        div.style.color = "red";
        element.after(div);
        element.style.borderColor = "red";
        element.setAttribute("is-valid", false);

    }
}

function passwordCheckValid(e, other) {
    var element = e.target;
    if(element.nextElementSibling !== null){
        element.nextElementSibling.remove();
    }

    if(element.value !== other.value){
        let div = document.createElement("div");
        div.innerText = "패스워드가 일치하지 않습니다.";
        div.style.color = "red";
        element.after(div);
        element.style.borderColor = "red";
        element.setAttribute("is-valid", false);
    } else {
        let div = document.createElement("div");
        div.innerText = "패스워드가 일치합니다.";
        div.style.color = "green";
        element.after(div);
        element.style.borderColor = "green";
        element.setAttribute("is-valid", true);

    }
}

function validCheck(form) {
    var userNameVaild = form.username.getAttribute("is-valid") === "true" ? true : false;
    var passwordVaild = form.password.getAttribute("is-valid") === "true" ? true : false;
    var passwordCheckVaild = form.passwordCheck.getAttribute("is-valid") === "true" ? true : false;

    if(userNameVaild && passwordVaild && passwordCheckVaild){
        alert("true" + userNameVaild);
        return true;
    } else {
        alert("false" + userNameVaild);
        return false;
    }
}


window.onload = function () {
    var form = document.forms[0];
    form.username.addEventListener("input", userNameValid);
    form.password.addEventListener("input", passwordValid);
    form.passwordCheck.addEventListener("input", function(e) {passwordCheckValid(e, "password")});
}

// 비밀번호, 비밀번호 확인 function

// 에러 출력 function

// 에러 출력 스타일 적용 function




/*
window.onload = function() {
    var div = document.getElementById("id_div");
    var input = document.getElementById("id_input");
    var select = document.getElementById("id_select");*/


    // 익명 함수 사용 
    /*input.addEventListener("focus", function() {console.log("focus 이벤트 발생!")});*/
    /*
    input.onfocus = function() {console.log("focus 이벤트 발생!!")};
    
    input.addEventListener("blur",  eventHandler);

    input.addEventListener("input",  eventHandler);

    div.addEventListener("mouseenter",  eventHandler);
    input.addEventListener("mouseenter",  eventHandler);

    div.addEventListener("mouseleave",  eventHandler);
    input.addEventListener("mouseleave",  eventHandler);

    div.addEventListener("click",  eventHandler);
    input.addEventListener("click",  eventHandler);

    div.addEventListener("dbclick", eventHandler);
    input.addEventListener("dbclick", eventHandler);

    input.addEventListener("change", eventHandler);
    select.addEventListener("change", eventHandler);
}

function eventHandler(e) {
    switch(e.type) {
        case "click":
            console.log("클릭 이벤트 발생!!"); break;
        case "dbclick":
            console.log("더블 클릭 이벤트 발생!!"); break;
        case "focus":
            console.log("포커스 이벤트 발생!!"); break;
        case "blur":
            console.log("블러 이벤트 발생!!"); break;
        case "input":
            console.log("입력 이벤트 발생!!"); break;
        case "change":
            console.log("값 변경 이벤트 발생!!"); break;
        case "mouseenter":
            console.log("마우스엔터 이벤트 발생!!"); break;
        case "mouseleave":
            console.log("마우스리브 이벤트 발생!!"); break;
    }
    console.log(e.target);
}
*/
