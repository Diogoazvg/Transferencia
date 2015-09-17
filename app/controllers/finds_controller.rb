class FindsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :current_user
  before_action :user_session
  before_action :set_find, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #@finds = Find.all
    #respond_with(@finds)
  end

  def show
    respond_with(@find)
  end

  def new
    #@find = Find.new
    #respond_with(@find)
  end

  def edit
  @find = Find.new
  end

  def create
    @find = Find.new(find_params)
    @find.save
    flash[:notice] = 'CONFIRMADO'
    render :new
    #respond_with(@find)
  end

  def search
    aluno_existe?
      if aluno_existe?
        aluno_possui_pendencia_na_biblioteca?            
        if aluno_possui_pendencia_na_biblioteca?
          flash[:notice] = 'Você não possui pendências na biblioteca, pode prosseguir.'                  
          turno_atual
          periodo_minimo
        else
          flash[:notice] = 'Você possui pendências na biblioteca, não pode solicitar uma transferência antes de resolve-las..'
          redirect_to :back
        end
      else
        flash[:notice] = 'Pasta inexistente, provavelmente você não é um aluno matriculado.'
        redirect_to :back       
      end 
  end

  def update
    @find = Find.new(find_params)
    @find.save

    #@find.update(find_params)
    #respond_with(@find)
  end

  #def destroy
    #@find.destroy
    #respond_with(@find)
  #end
  def aluno_existe?
    @search2 = Biblioteca.where(N_PASTA: (params[:N_PASTA])).exists?
  end

  def aluno_possui_pendencia_na_biblioteca?
    @search = Biblioteca.find_by(N_PASTA: params[:N_PASTA], CONDICAO: params[:CONDICAO])
  end

  def turno_atual
    @search_in_academico = Aluno.turno_atual(params[:N_PASTA])
  end

  def turno_disponivel
    #!@search_in_academico_ano_letivo_atual = Matricula.ano_letivo_atual(params[:N_PASTA]).first
    @search_in_academico_periodo_atual = Matricula.periodo_atual(params[:N_PASTA]).first
    @search_in_academico_codigo_do_curso = Matricula.codigo_do_curso(params[:N_PASTA]).first
    @search_in_academico_codigo_do_turno = Matricula.codigo_do_turno(params[:N_PASTA]).first
    @search_in_academico3 = Aluno.turma_disponivel(@search_in_academico_periodo_atual.periodo_atual, 
    @search_in_academico_codigo_do_curso.cod_curso, @search_in_academico_codigo_do_turno.cod_turno)
  end

  def periodo_minimo
    @search_in_academico.each do |teste|
      if teste.periodo_atual < 2
        flash[:notice] = "Você precisa estar pelo menos no 2º módulo para solicitar uma transferência"
        redirect_to :back
      else
        turno_disponivel
        render :show
      end
    end
  end

  private
    def set_find
      @find = Find.find(params[:id])
    end

    def find_params
        params.require(:find).permit(:TURNO, :N_PASTA)
    end
end
