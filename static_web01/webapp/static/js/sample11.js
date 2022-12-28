$(document).ready(function() {
    $("span").each(function(index,element){
        if($(element).text() === "up") {
            $(element).on("click", up);
        } else if($(element).text() === "down") {
            $(element).on("click", down)
        }

    })
});

function textup(event) {
    $(event.target).prev().before($(event.target).parent());
}
function textdown(event) {
    $(event.target).parent().next().after($(event.target).parent());
}

