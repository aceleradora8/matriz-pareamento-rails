class CreateDuplas < ActiveRecord::Migration
  def change
    create_table :duplas do |t|
      t.references :aluno1, index: true, foreign_key: true
      t.references :aluno2, index: true, foreign_key: true
      t.integer :num_pareamento

      t.timestamps null: false
    end
  end
end
