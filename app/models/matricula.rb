class Matricula < Autentication_sql_server
	self.table_name = "matriculas"
  	self.primary_key = "cod_matricula"
  	belongs_to :turma
  	belongs_to :aluno, foreign_key: "cod_aluno"
  	belongs_to :turno, foreign_key: "cod_turno"
  	belongs_to :curso, foreign_key: "cod_curso"
  	has_many :matricula_pauta, foreign_key: "cod_matricula"
  	has_many :transferencia, foreign_key: "cod_matricula"


  	scope :ano_letivo_atual, -> (n_pasta){ Matricula.find_by_sql ["select matriculas.ano_let_atual 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
            and  alunos.n_pasta = ?", n_pasta] 		
	}
  	
  	scope :periodo_atual, ->(n_pasta) { Matricula.find_by_sql ["select matriculas.periodo_atual 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
           and matriculas.periodo_atual >= 2
           and matriculas.ano_let_atual = DATEPART(YEAR, GETDATE())
            and  alunos.n_pasta = ?", n_pasta] 		
	}

	scope :codigo_do_curso, ->(n_pasta) { Matricula.find_by_sql ["select matriculas.cod_curso 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
           and  alunos.n_pasta = ?", n_pasta] 		
	}

	scope :codigo_do_turno, ->(n_pasta) { Matricula.find_by_sql ["select matriculas.cod_turno 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
           and  alunos.n_pasta = ?", n_pasta] 		
	}
end