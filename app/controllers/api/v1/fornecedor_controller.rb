module Api
  module V1
    class FornecedorController < ApplicationController
      before_action :set_fornecedor, only: %i[show update destroy]

      # GET /api/v1/fornecedor
     # Retorna todos os fornecedores ou filtra por nome/cnpj se houver parâmetro de busca

      def index
        @fornecedor = if params[:search]
                        Fornecedor.where('nome ILIKE ? OR cnpj ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
                      else
                        Fornecedor.all
                      end

        render json: @fornecedor
      end

      # GET /api/v1/fornecedor/1
      # Retorna um fornecedor específico passando o ID como parametro
      def show
        render json: @fornecedor
      end

      # POST /api/v1/fornecedor
      # Cria um novo fornecedor

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

      # PATCH/PUT /api/v1/fornecedor/1
      # Atualiza um fornecedor existente

      def update
        if @fornecedor.update(fornecedor_params)
          render json: @fornecedor
        else
          render json: @fornecedor.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/fornecedor/1
      # Deleta um fornecedor
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
