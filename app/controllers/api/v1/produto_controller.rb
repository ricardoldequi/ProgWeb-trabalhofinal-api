module Api
  module V1
    class ProdutoController < ApplicationController
      before_action :set_produto, only: %i[show update destroy]

      # GET /produto
      def index
        if params[:search].present?
          @produtos = Produto.search_by_nome_descricao_fornecedor(params[:search])
          Rails.logger.info("Search results: #{@produtos.pluck(:nome)}")
        else
          @produtos = Produto.all
        end
      
        render json: @produtos
      end
      

      # GET /produto/1
      def show
        render json: @produto
      end

      # POST /produto
      def create
        @produto = Produto.new(produto_params)

        if @produto.save
          render json: @produto, status: :created, location: api_v1_produto_url(@produto)
        else
          render json: @produto.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /produto/1
      def update
        if @produto.update(produto_params)
          render json: @produto
        else
          render json: @produto.errors, status: :unprocessable_entity
        end
      end

      # DELETE /produto/1
      def destroy
        @produto.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_produto
        @produto = Produto.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def produto_params
        params.require(:produto).permit(:fornecedor_id, :nome, :descricao, :quantidade, :preco, :observacao)
      end
    end
  end
end
