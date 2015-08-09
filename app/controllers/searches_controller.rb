class SearchesController < ApplicationController
  
    def new
        @search = Search.new
    end

    def create	
    	@search2 = Biblioteca.exists?(search_params)
    	if @search2

    		@search = Biblioteca.find_by(search_params2)
    		#@search_in_academico = Academico.find_by_N_PASTA(@search.N_PASTA)
    		#@search_in_academico = Alunos.where(N_PASTA: @search.N_PASTA).first
    		#@search_in_academico = Alunos.where(search_params).first
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
    end

    def search_params
        params.require(:search).permit(:N_PASTA)
    end

    def search_params2
        params.require(:search).permit(:N_PASTA, :CONDICAO)
    end
end
#SELECT  "nada_consta".* FROM "nada_consta"  WHERE (:N_PASTA = 43918) LIMIT 1
#SELECT  "nada_consta".* FROM "nada_consta"  WHERE "nada_consta"."N_PASTA" = '43918' LIMIT 1
#SELECT  "nada_consta".* FROM "nada_consta"  WHERE (N_PASTA =43918 and CONDICAO ='f') LIMIT 1
#SELECT  "nada_consta".* FROM "nada_consta"  WHERE "nada_consta"."nada_consta" IN ('N_PASTA =? and CONDICAO =?', 43918, 'f') LIMIT 1
#SELECT  "nada_consta".* FROM "nada_consta"  WHERE (CONDICAO = 't' N_PASTA = 43918) LIMIT 1
#SELECT  "nada_consta".* FROM "nada_consta"  WHERE "nada_consta"."conditions" = ':N_PASTA = ''43918''' LIMIT 1

#if not livro.nil?
        #render :text => "Livro: " + livro.titulo
      #else
        #render :text => "Livro não encontrado"
      #end