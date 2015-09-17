class Aluno < Autentication_sql_server
	self.table_name = "alunos"
  	self.primary_key = "cod_aluno"
  	has_many :matricula, foreign_key: "cod_aluno"
  	belongs_to :pessoa, foreign_key: "cod_pessoa"


    #beginscope :turno_atual, ->(n_pasta) {Aluno.select("pessoas.nome_pessoa,turnos.desc_turno,
     #turmas.desc_turma, turmas.cod_turma, matriculas.periodo_atual, matriculas.ano_let_atual, matriculas.periodo_let_atual")
    #.from("pessoas")
    #.where("Alunos.n_pasta = ?", n_pasta)
    #.joins(" INNER JOIN alunos ON alunos.cod_pessoa = pessoas.cod_pessoa INNER JOIN alunos ON alunos.cod_aluno = matriculas.cod_aluno INNER JOIN matriculas ON matriculas.cod_turno = turnos.cod_turno INNER JOIN turnos ON turnos.cod_turno = turmas.cod_turno")
    #}
    

	scope :turno_atual, ->(n_pasta) {Aluno.find_by_sql ["select pessoas.nome_pessoa,turnos.desc_turno, turmas.desc_turma, 
		matriculas.periodo_atual
		from pessoas, turmas, alunos, matriculas, turnos 
		where matriculas.cod_turma_ATUAL = turmas.cod_turma 
		and pessoas.cod_pessoa = alunos.cod_pessoa 
		and alunos.cod_aluno = matriculas.cod_aluno 
		and matriculas.cod_turno = turnos.cod_turno 
		and turnos.cod_turno = turmas.cod_turno
		and turmas.ano_let = DATEPART(YEAR, GETDATE()) 
		and alunos.n_pasta = ?", n_pasta]
	}


	scope :turma_disponivel, ->(periodo_atual, codigo_do_curso, codigo_do_turno) {Aluno.find_by_sql ["select turmas.desc_turma,turnos.desc_turno, 
		turmas.cod_turma, cursos.desc_curso
		from turmas, turnos, cursos
		where  turnos.cod_turno = turmas.cod_turno
		and cursos.cod_curso = turmas.cod_curso
		and turmas.ano_let = DATEPART(YEAR, GETDATE())
		and turmas.periodo = ? and turmas.cod_curso =? and turmas.cod_turno != ?", periodo_atual, codigo_do_curso, codigo_do_turno]
	}  	
end

