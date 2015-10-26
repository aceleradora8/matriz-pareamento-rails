var val = [];

function manter_historia() {
    var checkbox = $('input[type=checkbox]:checked');
    if(checkbox.length > 0){
        checkbox.each(function(){
            val.push($(this).val());
        });

}
        var link = "/tabela/" + val;
        window.location.replace(link);

}