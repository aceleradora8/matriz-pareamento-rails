class Dupla < ActiveRecord::Base
  belongs_to :aluno1, class_name: "Aluno"
  belongs_to :aluno2, class_name: "Aluno"
end
