class Curso < Autentication_sql_server
	self.table_name = "CURSOS"
  	self.primary_key = "COD_CURSO"
  	has_many :matricula, foreign_key: "COD_CURSO"
  	has_many :turma, foreign_key: "COD_TURMA"
  	has_many :transferencia, foreign_key: "COD_TURMA"
  	belongs_to :turno, foreign_key: "COD_TURNO"
end
