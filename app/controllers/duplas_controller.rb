class DuplasController < ApplicationController
  before_action :set_dupla, only: [:show, :edit, :update, :destroy]

  # GET /duplas
  # GET /duplas.json
  def index
    @duplas = Dupla.all
  end

  # GET /duplas/1
  # GET /duplas/1.json
  def show
  end

  # GET /duplas/new
  def new
    @dupla = Dupla.new
    @alunos = Aluno.all
  end

  # GET /duplas/1/edit
  def edit
  end

  # POST /duplas
  # POST /duplas.json
  def create
    @dupla = Dupla.new(dupla_params)

    respond_to do |format|
      if @dupla.save
        format.html { redirect_to @dupla, notice: 'Dupla was successfully created.' }
        format.json { render :show, status: :created, location: @dupla }
      else
        format.html { render :new }
        format.json { render json: @dupla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /duplas/1
  # PATCH/PUT /duplas/1.json
  def update
    respond_to do |format|
      if @dupla.update(dupla_params)
        format.html { redirect_to @dupla, notice: 'Dupla was successfully updated.' }
        format.json { render :show, status: :ok, location: @dupla }
      else
        format.html { render :edit }
        format.json { render json: @dupla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duplas/1
  # DELETE /duplas/1.json
  def destroy
    @dupla.destroy
    respond_to do |format|
      format.html { redirect_to duplas_url, notice: 'Dupla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dupla
      @dupla = Dupla.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dupla_params
      params.require(:dupla).permit(:aluno1_id, :aluno2_id, :num_pareamento)
    end
end
