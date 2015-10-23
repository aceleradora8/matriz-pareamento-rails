json.array!(@duplas) do |dupla|
  json.extract! dupla, :id, :aluno1_id, :aluno2_id, :num_pareamento
  json.url dupla_url(dupla, format: :json)
end
