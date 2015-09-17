class Disciplina < Autentication_sql_server
	self.table_name = "DISCIPLINAS"
  	#self.primary_key = "COD_MATRICULA"
  	has_many :pauta, foreign_key: "COD_DISCIPLINA"
  	has_many :matricula_pauta, foreign_key: "COD_DISCIPLINA"
  	has_many :disciplina_transferencia, foreign_key: "COD_DISCIPLINA"	
end
