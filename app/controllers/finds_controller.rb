class FindsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :current_user
  before_action :user_session
  before_action :set_find, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index 
  end

  def show  
  end

  #def new 
  #end

  def create
    @gerar_pedido1 = Aluno.turno_atual_salvar(@@pasta).fetch(0).attributes
    @gerar_pedido2 = Turma.turma_disponivel_salvar(@@search_in_academico_periodo_atual.periodo_atual, @@search_in_academico_codigo_do_curso.cod_curso, @@search_in_academico_codigo_do_turno.cod_turno).fetch(0).attributes
    @hash_de_pedido = @gerar_pedido1, @gerar_pedido2
    @hash_unico_salvar = @hash_de_pedido.inject(:merge)
    @salvar = Find.new(@hash_unico_salvar)
    @salvar.save
    render :new
  end

  def search
      if aluno_existe?
        if aluno_possui_pendencia_na_biblioteca?
          flash[:notice] = 'Você não possui pendências na biblioteca, pode prosseguir.'
          turno_atual
          periodo_minimo
          @@pasta = params[:N_PASTA]
        else
          flash[:notice] = 'Você possui pendências na biblioteca, não pode solicitar uma transferência antes de resolve-las..'
          redirect_to :back
        end
      else
        flash[:notice] = 'Pasta inexistente, provavelmente você não é um aluno matriculado.'
        redirect_to :back
      end
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
    @@search_in_academico_periodo_atual = Matricula.periodo_atual(params[:N_PASTA]).first
    @@search_in_academico_codigo_do_curso = Matricula.codigo_do_curso(params[:N_PASTA]).first
    @@search_in_academico_codigo_do_turno = Matricula.codigo_do_turno(params[:N_PASTA]).first
    @search_in_academico3 = Turma.turma_disponivel(@@search_in_academico_periodo_atual.periodo_atual,
        @@search_in_academico_codigo_do_curso.cod_curso, @@search_in_academico_codigo_do_turno.cod_turno)
  end

  def periodo_minimo
    @search_in_academico.each do |teste|
      if teste.PERIODO_ATUAL < 2
        flash[:notice] = "Você precisa estar pelo menos no 2º módulo para solicitar uma transferência"
        redirect_to :back
      else
        turno_disponivel
        render :show
      end
    end
  end
end
