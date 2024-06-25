module Api
  module V1
    class FornecedorController < ApplicationController
      before_action :set_fornecedor, only: %i[show update destroy]

      # GET /fornecedor
      def index
        if params[:search]
          @fornecedores = Fornecedor.where("nome ILIKE ? OR cnpj ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
        else
          @fornecedores = Fornecedor.all
        end

        render json: @fornecedores
      end

      # GET /fornecedor/1
      def show
        render json: @fornecedor
      end

      # POST /fornecedor
      def create
        @fornecedor = Fornecedor.new(fornecedor_params)
      
        if @fornecedor.save
          render json: @fornecedor, status: :created
        else
          render json: @fornecedor.errors, status: :unprocessable_entity
        end
      rescue => e
        Rails.logger.error("Erro inesperado: #{e.message}")
        render json: { error: 'Internal Server Error', exception: e.message }, status: :internal_server_error
      end

      # PATCH/PUT /fornecedor/1
      def update
        if @fornecedor.update(fornecedor_params)
          render json: @fornecedor
        else
          render json: @fornecedor.errors, status: :unprocessable_entity
        end
      end

      # DELETE /fornecedor/1
      def destroy
        @fornecedor.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_fornecedor
        @fornecedor = Fornecedor.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def fornecedor_params
        params.require(:fornecedor).permit(:nome, :email, :cnpj, :endereco, :telefone)
      end
    end
  end
end
