class CreateDuplas < ActiveRecord::Migration
  def change
    create_table :duplas do |t|
      t.integer :num_pareamento
      t.integer :aluno1_id
      t.integer :aluno2_id

      t.timestamps null: false
    end
  end
end
