FactoryBot.define do
  factory :fornecedor do
    nome { 'Fornecedor Teste' }
    email { 'email@example.com' }
    cnpj { '00.000.000/0000-00' }
    endereco { 'Rua Exemplo, 123' }
    telefone { '123456789' }
  end
end
