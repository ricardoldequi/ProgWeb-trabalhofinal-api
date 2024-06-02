require "test_helper"

class FornecedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedor = fornecedors(:one)
  end

  test "should get index" do
    get fornecedors_url, as: :json
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference("Fornecedor.count") do
      post fornecedors_url, params: { fornecedor: { cnpj: @fornecedor.cnpj, email: @fornecedor.email, endereco: @fornecedor.endereco, nome: @fornecedor.nome, telefone: @fornecedor.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show fornecedor" do
    get fornecedor_url(@fornecedor), as: :json
    assert_response :success
  end

  test "should update fornecedor" do
    patch fornecedor_url(@fornecedor), params: { fornecedor: { cnpj: @fornecedor.cnpj, email: @fornecedor.email, endereco: @fornecedor.endereco, nome: @fornecedor.nome, telefone: @fornecedor.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy fornecedor" do
    assert_difference("Fornecedor.count", -1) do
      delete fornecedor_url(@fornecedor), as: :json
    end

    assert_response :no_content
  end
end
