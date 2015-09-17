class DisciplinaTransferencia < Autentication_sql_server
	self.table_name = "DISCIPLINAS_TRANSFERENCIAS"
  	#self.primary_key = "COD_MATRICULA"
  	belongs_to :disciplina, foreign_key: "COD_DISCIPLINA"
  	belongs_to :transferencia, foreign_key: "COD_TRANSFERENCIA"
end
