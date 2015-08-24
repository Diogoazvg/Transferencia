class Aluno < Autentication
	self.table_name = "ALUNOS"
  	#self.primary_key = "COD_ALUNO"
  	#has_many :matriculas

  	scope :teste, -> { Alunos.select("Alunos.N_PASTA",
  		"Matriculas.DT_MATRICULA")
  	    .from("Alunos","Matriculas")
  		.where("Alunos.N_PASTA = '43918'")
  		.joins("INNER JOIN Matriculas ON Matriculas.COD_ALUNO = Alunos.COD_ALUNO")
  		.first }
end
