class Fornecedor < ApplicationRecord
    self.table_name = "fornecedores"

    has_many :produtos, class_name: "Produto", foreign_key: "fornecedor_id"

end
