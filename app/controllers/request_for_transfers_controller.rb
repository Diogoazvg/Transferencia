class RequestForTransfersController < ApplicationController

	def new
    	@requestForTransfer = RequestForTransfer.new
      @requestForTransfer2 = @search

  	end

  	#def create
    	#@requestForTransfer = RequestForTransfer.find(params[:folder])
    	#unless :condition
    #end
      
  	#end  

    def show
      @search = Search.find(params[:id])
    end
  
  	def search_params
    	params.require(:requestForTransfer).permit(:folder)
  	end

end