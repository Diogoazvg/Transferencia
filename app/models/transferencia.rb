class Transferencia < Autentication_sql_server
	self.table_name = "TRANSFERENCIAS"
  	#self.primary_key = "COD_MATRICULA"
    belongs_to :matricula, foreign_key: "COD_MATRICULA"
    belongs_to :curso, foreign_key: "COD_CURSO"
    has_many :matricula_pauta_transferencia, foreign_key: "COD_TRANSFERENCIA"
    has_many :disciplina_transferencia, foreign_key: "COD_TRANSFERENCIA"
end
