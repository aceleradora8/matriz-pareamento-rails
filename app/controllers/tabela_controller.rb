
class TabelaController < ApplicationController


  def index
    @alunos = Aluno.all
    @todas_duplas = Dupla.all
    @duplas = []
    @selecionado = []
    alunos_manter_historia = []

    unless params[:manter] == nil

    	parametros =  params[:manter].split(",").map {|i| i.to_i}
    	@selecionado = parametros
    	parametros.each do |id|
    		alunos_manter_historia.push(Aluno.find(id))
    	end
    end

      alunos_embaralhados = @alunos.shuffle
      alunos_manter_historia.each { |aluno| alunos_embaralhados.delete(aluno)}

    	lista_alunos = []
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

    		@duplas.push(dupla_banco.to_a)
    	end

    end

    def confirmar_dupla


    end
end
