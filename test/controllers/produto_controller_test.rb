require 'test_helper'

class ProdutoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto = produto(:one)
  end

  test 'should get index' do
    get produto_url, as: :json
    assert_response :success
  end

  test 'should create produto' do
    assert_difference('Produto.count') do
      post produto_url,
           params: { produto: { descricao: @produto.descricao, fornecedor_id_id: @produto.fornecedor_id_id, nome: @produto.nome, observacao: @produto.observacao, preco: @produto.preco, quantidade: @produto.quantidade } }, as: :json
    end

    assert_response :created
  end

  test 'should show produto' do
    get produto_url(@produto), as: :json
    assert_response :success
  end

  test 'should update produto' do
    patch produto_url(@produto),
          params: { produto: { descricao: @produto.descricao, fornecedor_id_id: @produto.fornecedor_id_id, nome: @produto.nome, observacao: @produto.observacao, preco: @produto.preco, quantidade: @produto.quantidade } }, as: :json
    assert_response :success
  end

  test 'should destroy produto' do
    assert_difference('Produto.count', -1) do
      delete produto_url(@produto), as: :json
    end

    assert_response :no_content
  end
end
