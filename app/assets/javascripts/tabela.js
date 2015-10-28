var val = [];
var checkboxMarcados = [];



function mandaSortearComParametros() {
    var checkbox = $('.cbmanter:checked');
    if(checkbox.length > 0) {
        checkbox.each(function(){
            val.push($(this).val());

        });
    }
        var link = "/tabela/" + val;
        window.location.replace(link);



}

function confirmarDupla() {
params = [];
    var duplas = $('.id-duplas');
        duplas.each(function(){
            params.push(this.getAttribute("value"));
        });

        var link = "/confirmar/" + params;
        window.location.replace(link);

}

function limitarOpcoesManterAluno(){
  $(".cbmanter").change(function () {
      var maxPermitido = $(".cbmanter").length/2;
      var cnt = $(".cbmanter:checked").length;
      if (cnt > maxPermitido) 
      {
         $(this).prop("checked", "");
     }
  });
}

function ManterDupla(){
  $(".cbdupla").change(function () {
    var ids_duplas = [];
     $(".cbdupla:checked").each(function(){
      ids_duplas.push(this.getAttribute("value"));
    });
    
         console.log(ids_duplas);

  });
}

function associaEventoBotaoConfirmar(){
  $("#botao-confirmar").on("click",confirmarDupla);
}

function associaEventoBotaoSortear(){
  $("#botao-sortear").on("click",mandaSortearComParametros);
}

$(document).ready(function () {
  limitarOpcoesManterAluno();
  associaEventoBotaoConfirmar();
  associaEventoBotaoSortear();
  ManterDupla();

  $(".dupla").each(function(){
      $(this).parent().addClass('success');
    });
});
