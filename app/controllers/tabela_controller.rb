class TabelaController < ApplicationController
  

  def index
    @alunos = Aluno.all
  end

  
end
