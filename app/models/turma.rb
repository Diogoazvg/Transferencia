class Turma < Autentication_sql_server
	self.table_name = "TURMAS"
  	#self.primary_key = "COD_MATRICULA"
  	belongs_to :turno, foreign_key: "COD_TURNO"
  	belongs_to :curso, foreign_key: "COD_CURSO"
  	has_many :pauta, foreign_key: "COD_TURMA"
  	has_many :matricula
end
