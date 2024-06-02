class Produto < ApplicationRecord
  self.table_name = 'produtos'
  belongs_to :fornecedor, foreign_key: 'fornecedor_id', class_name: 'Fornecedor'
end
