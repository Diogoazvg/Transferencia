class Turno < Autentication_sql_server
	self.table_name = "TURNOS"
  	#self.primary_key = "COD_MATRICULA"
  	has_many :matricula, foreign_key: "COD_TURNO"
  	has_many :turma, foreign_key: "COD_TURNO"
  	has_many :curso, foreign_key: "COD_TURNO"
  	
end
