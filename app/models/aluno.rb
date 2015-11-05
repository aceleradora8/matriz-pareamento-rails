class Aluno < ActiveRecord::Base
  has_many :duplas1, class_name: "Dupla", :foreign_key => 'aluno1_id'
  has_many :duplas2, class_name: "Dupla", :foreign_key => 'aluno2_id'
end
