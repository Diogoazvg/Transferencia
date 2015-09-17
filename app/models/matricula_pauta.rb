class MatriculaPauta < Autentication_sql_server
	self.table_name = "MATRICULAS_PAUTAS"
  	#self.primary_key = "COD_MATRICULA"
  	belongs_to :pauta, foreign_key: "COD_PAUTA"
  	belongs_to :disciplina, foreign_key: "COD_DISCIPLINA"
  	has_many :matricula_pauta_transferencia, foreign_key: "COD_MATRICULA"
  	has_many :matricula_pauta_transferencia, foreign_key: "COD_PAUTA"
end
