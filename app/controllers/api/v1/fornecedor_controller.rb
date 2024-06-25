module Api
  module V1
    class FornecedorController < ApplicationController
      before_action :set_fornecedor, only: %i[show update destroy]

      # GET /fornecedor
      def index
        @fornecedor = if params[:search]
                        Fornecedor.where('nome ILIKE ? OR cnpj ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
                      else
                        Fornecedor.all
                      end

        render json: @fornecedor
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
      rescue StandardError => e
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
        @fornecedor.destroy
        render json: { message: 'Fornecedor deletado com sucesso.' }, status: :ok
      rescue ActiveRecord::InvalidForeignKey => e
        render json: { error: 'Não é possível deletar este fornecedor porque está sendo usado no cadastro de produtos.' },
               status: :unprocessable_entity
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
