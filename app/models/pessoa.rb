class Pessoa < Autentication_sql_server
	self.table_name = "PESSOAS"
  	#self.primary_key = "COD_ALUNO"
  	has_many :aluno, foreign_key: "COD_PESSOA"

  	scope :encontrar_pessoa, -> (n_pasta) {Pessoa
  		.joins(:aluno)
  		.where("Alunos.N_PASTA = ?", n_pasta)
  	}

end