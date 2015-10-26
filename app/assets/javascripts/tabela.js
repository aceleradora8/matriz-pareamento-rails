var val = [];
var checkboxMarcados = [];


function manter_historia() {
    var checkbox = $('.cbmanter:checked');
    if(checkbox.length > 0) {
        checkbox.each(function(){
            val.push($(this).val());

        });
    }
        var link = "/tabela/" + val;
        window.location.replace(link);


}


function associaEventoCheckbox(){
  var checkbox = $('.cbmanter');
    checkbox.on("click",function() {
      if($(this).is(":checked")){
        checkboxMarcados.push($(this));

        if (checkboxMarcados.length > (checkbox.length/2)){
          console.log(checkboxMarcados)
        checkboxMarcados[0].prop('checked', false);
        checkboxMarcados.splice(checkboxMarcados.indexOf(checkboxMarcados[0]),1);
      }
        console.log($(this))
    }
  });
};

$(document).ready(function() {
  associaEventoCheckbox();
});
