# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'fornecedores', primary_key: 'fornecedor_id', id: :serial, force: :cascade do |t|
    t.string 'nome', limit: 60, null: false
    t.string 'email', limit: 50, null: false
    t.string 'cnpj', limit: 20, null: false
    t.string 'endereco', limit: 100, null: false
    t.string 'telefone', limit: 16, default: '00 00000-0000'

    t.unique_constraint ['cnpj'], name: 'fornecedores_cnpj_key'
    t.unique_constraint ['email'], name: 'fornecedores_email_key'
    t.unique_constraint ['nome'], name: 'fornecedores_nome_key'
  end

  create_table 'produtos', primary_key: 'produto_id', id: :serial, force: :cascade do |t|
    t.integer 'fornecedor_id', null: false
    t.string 'nome', limit: 60, null: false
    t.string 'descricao', limit: 100, null: false
    t.integer 'quantidade', null: false
    t.decimal 'preco', precision: 10, scale: 2, null: false
    t.string 'observacao', limit: 200

    t.unique_constraint ['descricao'], name: 'produtos_descricao_key'
    t.unique_constraint ['nome'], name: 'produtos_nome_key'
  end

  add_foreign_key 'produtos', 'fornecedores', column: 'fornecedor_id', primary_key: 'fornecedor_id',
                                              name: 'fk_fornecedor_id'
end
