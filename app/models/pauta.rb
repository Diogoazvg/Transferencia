class Pauta < Autentication_sql_server
	self.table_name = "PAUTAS"
  	#self.primary_key = "COD_ALUNO"
  	belongs_to :disciplina, foreign_key: "COD_DISCIPLINA"
  	has_many :matricula_pauta, foreign_key: "COD_PAUTA"
end