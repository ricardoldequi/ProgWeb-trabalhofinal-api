class Produto < ApplicationRecord
  self.table_name = 'produtos'
  belongs_to :fornecedor, foreign_key: 'fornecedor_id', class_name: 'Fornecedor'

  include PgSearch::Model

  pg_search_scope :search_by_nome_descricao_fornecedor,
                  against: [:nome, :descricao],
                  associated_against: { fornecedor: :nome },
                  using: {
                    tsearch: { prefix: true }
                  }
end
