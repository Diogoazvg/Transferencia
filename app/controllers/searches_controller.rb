class SearchesController < ApplicationController
    before_action :authenticate_user!
    before_action :user_signed_in?
    before_action :current_user
    before_action :user_session
    #attr_accessor :N_PASTA
  
    def new
        @search = Search.new
    end

    def create	
    	@search2 = Biblioteca.exists?(search_params)
    	if @search2

    		@search = Biblioteca.find_by(search_params2)		
    		#@search_in_academico = Alunos.where(N_PASTA: @search.N_PASTA).first
            @search_in_academico = Aluno.teste	
                if @search
            		flash[:notice] = 'Sem pendências pode prosseguir.'
                	render :show
            	else
            		flash[:notice] = 'Com pendências.'
            		redirect_to :back
            	end
        else
        	flash[:notice] = 'pasta inexistente.'
            redirect_to :back    	
        end    
    end

    def show
        render :new2
    end

    def search_params
        params.require(:search).permit(:N_PASTA)
    end

    def search_params2
        params.require(:search).permit(:N_PASTA, :CONDICAO)
    end
end
