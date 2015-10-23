class DuplasController < ApplicationController
  #before_action :set_dupla, only: [:show, :edit, :update, :destroy]


  def index
    @alunos = Aluno.all
  end

  
end
