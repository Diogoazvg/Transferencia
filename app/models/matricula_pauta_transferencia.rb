class MatriculaPautaTransferencia < Autentication_sql_server
	self.table_name = "MATRICULAS_PAUTAS_TRANFERENCIAS"
  	#self.primary_key = "COD_MATRICULA"
  	belongs_to :transferencia, foreign_key: "COD_TRANSFERENCIA"
  	belongs_to :matricula_pauta, foreign_key: "COD_PAUTA"
  	belongs_to :matricula_pauta, foreign_key: "COD_MATRICULA"
end
