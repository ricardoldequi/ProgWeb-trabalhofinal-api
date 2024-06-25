# spec/controllers/api/v1/fornecedor_controller_spec.rb
require 'rails_helper'
require 'spec_helper'



RSpec.describe Api::V1::FornecedorController, type: :controller do
  let!(:fornecedor) { create(:fornecedor) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).length).to eq(1)
    end
  end

  describe 'POST #create' do
    it 'creates a new fornecedor' do
      post :create,
           params: { fornecedor: { nome: 'teste', email: 'teste@example.com', cnpj: '32.345.666/0001-89',
                                   endereco: 'Rua das Flores, 123', telefone: '11 98765-4321' } }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['nome']).to eq('teste')
    end
  end
end
