
class TabelaController < ApplicationController
   before_action :set_alunos, :set_todas_duplas, :set_ultimas_duplas

def index
  if(@alunos.empty? || @alunos.length < 2)
    flash[:notice] = "Para gerar a matriz, crie pelo menos 2 alunos!"
    redirect_to :controller => 'alunos', :action => 'index'
  else
    @duplas = []
    @selecionados = []
    definir_duplas
  end
end

  def definir_duplas
    alunos_manter_historia = []
    unless params[:manter] == nil
      @selecionados =  params[:manter].split(",").map {|i| i.to_i}
      @selecionados.each { |id| alunos_manter_historia.push(Aluno.find(id)) }
    end

    @todas_duplas_ordenada = @todas_duplas.sort { |x,y| x.num_pareamento <=> y.num_pareamento }

    unless(alunos_manter_historia.empty?)
      deletar_duplas_manter_historia(alunos_manter_historia)
    end

    @num_duplas = @alunos.length/2+1
    i = 0

    while(@num_duplas>0) do
        unless(lista_contem_alunos_dessa_dupla?(@duplas,@todas_duplas_ordenada[i]))
          @duplas.push(@todas_duplas_ordenada[i])
          @num_duplas-=1
        end
        i+=1
      end
      @duplas = @duplas.compact
  end

  def lista_contem_alunos_dessa_dupla?(lista,dupla)
    lista.each do |dupla_lista|
      if(dupla != nil && dupla_lista != nil)
        if( dupla_lista.aluno1.id == dupla.aluno1.id ||
            dupla_lista.aluno1.id == dupla.aluno2.id ||
            dupla_lista.aluno2.id == dupla.aluno1.id ||
            dupla_lista.aluno2.id == dupla.aluno2.id)

            return true
         end
     end
    end
     false
  end

  def definir_primeira_dupla(aluno)
     @todas_duplas_ordenada.each do |dupla|
      if(dupla.aluno1.id == aluno.id || dupla.aluno2.id == aluno.id)
        unless(lista_contem_alunos_dessa_dupla?(@duplas,dupla))
         @duplas.push(dupla)
       end
      end
    end
  end

   def deletar_duplas_manter_historia(alunos_manter_historia)
    alunos_manter_historia = alunos_manter_historia.sort {|x,y| y <=> x }
    for i in 0..(alunos_manter_historia.length-1) 
      for j in i+1..(alunos_manter_historia.length-1) 
        @dupla_banco = Dupla.where("aluno1_id = #{alunos_manter_historia[i].id} AND aluno2_id = #{alunos_manter_historia[j].id}").to_a[0]
        if(@dupla_banco!=nil)
          @todas_duplas_ordenada.delete_if { |d| d.id == @dupla_banco.id } 
        end
      end
    end

    for i in 0..(alunos_manter_historia.length-1) 
      definir_primeira_dupla(alunos_manter_historia[i])
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
