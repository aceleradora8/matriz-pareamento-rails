
class TabelaController < ApplicationController
   before_action :set_alunos, :set_todas_duplas, :set_ultimas_duplas

def index
  @duplas = []
  @selecionados = []
  alunos_manter_historia = []
  lista_alunos = []

  unless params[:manter] == nil
    @selecionados =  params[:manter].split(",").map {|i| i.to_i}
    @selecionados.each { |id| alunos_manter_historia.push(Aluno.find(id)) }
  end

  alunos_embaralhados = @alunos.shuffle
  alunos_manter_historia.each { |aluno| alunos_embaralhados.delete(aluno)}

  if(@alunos.empty?)
    redirect_to :controller => 'alunos', :action => 'index'
  elsif(@alunos.length < 2)
    redirect_to :controller => 'alunos', :action => 'index'
  else
    lista_alunos =  alunos_embaralhados.in_groups_of(@alunos.size/2)
    lista1 = lista_alunos.first
    lista2 = lista_alunos.second

    alunos_manter_historia.each do |aluno_manter|
      lista2 = [] if lista2==nil
      lista2.push(aluno_manter)
    end

    lista2 = lista2.compact

    for i in 0..(lista1.length-1)
      if lista1[i].id < lista2[i].id
        aux = lista1[i]
        lista1[i] = lista2[i]
        lista2[i] = aux
      end
      dupla_banco = Dupla.where({ aluno1_id: lista1[i].id, aluno2_id: lista2[i].id })
      @duplas.push(dupla_banco.to_a[0])
    end
  end
end

  def confirmar_dupla
    duplas = []
    unless params[:duplas] == nil
      parametros =  params[:duplas].split(",").map {|i| i.to_i}
      parametros.each do |id|
        duplas.push(Dupla.find(id));
      end
      duplas.each do |dupla|
        dupla.num_pareamento+=1
        dupla.save
      end
      redirect_to :controller => 'tabela', :action => 'index'
    end
  end

  private
  def set_alunos
    @alunos = Aluno.all
  end

  def set_todas_duplas
    @todas_duplas = Dupla.all
  end

  def set_ultimas_duplas
    @ultimas_duplas = Dupla.all.order("updated_at desc").limit(Aluno.all.length/2).to_a


  end

end
