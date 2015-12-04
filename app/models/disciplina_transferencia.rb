class DisciplinaTransferencia < Autentication_sql_server
	self.table_name = "disciplinas_transferencias"
  	#self.primary_key = "COD_MATRICULA"
  	belongs_to :disciplina, foreign_key: "cod_disciplina"
  	belongs_to :transferencia, foreign_key: "cod_transferencia"
end
