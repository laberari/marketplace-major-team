class RequestsController < ApplicationController
        def new
          @request = Request.new
        end
      
        def create
          @request = Request.new(request_params)
          if @request.save
            redirect_to requests_path, notice: "Requerimiento creado exitosamente."
          else
            render :new
          end
        end
      
        private
      
        def request_params
          params.require(:request).permit(:details, :category_id)
        end
      end 
