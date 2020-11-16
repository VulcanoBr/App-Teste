class AddCpfCnpjToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cpf_cnpj, :string
  end
end
