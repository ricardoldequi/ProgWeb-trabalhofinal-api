require 'rails_helper'
require 'rspec/rails/swagger'
require 'rspec/rails'
require 'rspec/json_expectations'

Rswag::Api.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s
  config.swagger_format = :json
  # A linha abaixo configura o arquivo JSON principal para a documentação
  config.swagger_file = Rails.root.join('swagger', 'swagger.json').to_s
end

Rswag::Ui.configure do |config|
  config.swagger_endpoint '/api-docs/swagger.json', 'API V1 Docs'
end

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'Produtosefornecedores API',
        version: 'v1',
        description: 'API para gerenciamento de fornecedores e produtos',
      },
      paths: {},
      components: {
        schemas: {
          Fornecedor: {
            type: 'object',
            properties: {
              id: { type: :integer, example: 1 },
              nome: { type: :string, example: 'Fornecedor ABC' },
              email: { type: :string, example: 'fornecedor@example.com' },
              cnpj: { type: :string, example: '00.000.000/0000-00' },
              endereco: { type: :string, example: 'Rua Exemplo, 123' },
              telefone: { type: :string, example: '123456789' },
            },
            required: %w[nome email cnpj endereco],
          },
          Produto: {
            type: 'object',
            properties: {
              id: { type: :integer, example: 1 },
              nome: { type: :string, example: 'Produto ABC' },
              descricao: { type: :string, example: 'Descrição do Produto' },
              quantidade: { type: :integer, example: 10 },
              preco: { type: :number, example: 99.99 },
              observacao: { type: :string, example: 'Observações adicionais' },
            },
            required: %w[nome descricao quantidade preco],
          },
        },
      },
    },
  }
end

RSpec::Rails::Swagger.add_custom_matcher do |swagger|
  # Documentação para FornecedorController
  swagger.path '/api/v1/fornecedor', {
    get: {
      summary: 'Lista todos os fornecedores',
      responses: {
        '200': { description: 'Sucesso', content: { 'application/json': { schema: { type: 'array', items: { '$ref': '#/components/schemas/Fornecedor' } } } } }
      }
    },
    post: {
      summary: 'Cria um novo fornecedor',
      requestBody: { required: true, content: { 'application/json': { schema: { '$ref': '#/components/schemas/Fornecedor' } } } },
      responses: {
        '201': { description: 'Criado', content: { 'application/json': { schema: { '$ref': '#/components/schemas/Fornecedor' } } } },
        '422': { description: 'Entidade não processável', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    }
  }

  swagger.path '/api/v1/fornecedor/{id}', {
    parameters: [{ name: :id, in: :path, required: true, schema: { type: :integer } }],
    get: {
      summary: 'Retorna um fornecedor específico',
      responses: {
        '200': { description: 'Sucesso', content: { 'application/json': { schema: { '$ref': '#/components/schemas/Fornecedor' } } } },
        '404': { description: 'Não encontrado', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    },
    put: {
      summary: 'Atualiza um fornecedor existente',
      requestBody: { required: true, content: { 'application/json': { schema: { '$ref': '#/components/schemas/Fornecedor' } } } },
      responses: {
        '200': { description: 'Atualizado', content: { 'application/json': { schema: { '$ref': '#/components/schemas/Fornecedor' } } } },
        '404': { description: 'Não encontrado', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } },
        '422': { description: 'Entidade não processável', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    },
    delete: {
      summary: 'Exclui um fornecedor',
      responses: {
        '200': { description: 'Sucesso', content: { 'application/json': { schema: { type: 'object', properties: { message: { type: 'string' } } } } } },
        '404': { description: 'Não encontrado', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    }
  }

  # Documentação para ProdutoController
  swagger.path '/api/v1/produto', {
    get: {
      summary: 'Lista todos os produtos',
      responses: {
        '200': { description: 'Sucesso', content: { 'application/json': { schema: { type: 'array', items: { '$ref': '#/components/schemas/Produto' } } } } }
      }
    },
    post: {
      summary: 'Cria um novo produto',
      requestBody: { required: true, content: { 'application/json': { schema: { '$ref': '#/components/schemas/Produto' } } } },
      responses: {
        '201': { description: 'Criado', content: { 'application/json': { schema: { '$ref': '#/components/schemas/Produto' } } } },
        '422': { description: 'Entidade não processável', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    }
  }

  swagger.path '/api/v1/produto/{id}', {
    parameters: [{ name: :id, in: :path, required: true, schema: { type: :integer } }],
    get: {
      summary: 'Retorna um produto específico',
      responses: {
        '200': { description: 'Sucesso', content: { 'application/json': { schema: { '$ref': '#/components/schemas/Produto' } } } },
        '404': { description: 'Não encontrado', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    },
    put: {
      summary: 'Atualiza um produto existente',
      requestBody: { required: true, content: { 'application/json': { schema: { '$ref': '#/components/schemas/Produto' } } } },
      responses: {
        '200': { description: 'Atualizado', content: { 'application/json': { schema: { '$ref': '#/components/schemas/Produto' } } } },
        '404': { description: 'Não encontrado', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } },
        '422': { description: 'Entidade não processável', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    },
    delete: {
      summary: 'Exclui um produto',
      responses: {
        '200': { description: 'Sucesso', content: { 'application/json': { schema: { type: 'object', properties: { message: { type: 'string' } } } } } },
        '404': { description: 'Não encontrado', content: { 'application/json': { schema: { type: 'object', properties: { error: { type: 'string' } } } } } }
      }
    }
  }
end
