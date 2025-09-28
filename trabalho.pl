
:- dynamic resposta/2.

trilha(inteligencia_artificial, 'Construção de sistemas inteligentes capazes de aprender e tomar decisões.').
trilha(desenvolvimento_web, 'Criação de sites e aplicações web interativas.').
trilha(seguranca_da_informacao, 'Proteção de dados, sistemas e redes contra ataques.').
trilha(ciencia_de_dados, 'Análise e interpretação de grandes volumes de dados para extrair conhecimento.').
trilha(redes_e_infraestrutura, 'Gerenciamento e manutenção de redes de computadores e servidores.').

perfil(inteligencia_artificial, logica_programacao, 5).
perfil(inteligencia_artificial, matematica_estatistica, 4).
perfil(inteligencia_artificial, pensamento_critico, 4).
perfil(desenvolvimento_web, design_visual, 4).
perfil(desenvolvimento_web, programacao_frontend, 5).
perfil(desenvolvimento_web, logica_programacao, 3).
perfil(seguranca_da_informacao, redes_computadores, 4).
perfil(seguranca_da_informacao, pensamento_critico, 5).
perfil(seguranca_da_informacao, logica_programacao, 3).
perfil(ciencia_de_dados, matematica_estatistica, 5).
perfil(ciencia_de_dados, logica_programacao, 4).
perfil(ciencia_de_dados, pensamento_critico, 3).
perfil(redes_e_infraestrutura, redes_computadores, 5).
perfil(redes_e_infraestrutura, hardware, 4).
perfil(redes_e_infraestrutura, pensamento_critico, 3).

pergunta(1, 'Você tem afinidade com lógica de programação?', logica_programacao).
pergunta(2, 'Você tem afinidade com matemática e estatística?', matematica_estatistica).
pergunta(3, 'Você tem interesse em design visual e interfaces?', design_visual).
pergunta(4, 'Você gosta de programação frontend (HTML, CSS, JavaScript)?', programacao_frontend).
pergunta(5, 'Você tem interesse em redes de computadores?', redes_computadores).
pergunta(6, 'Você tem afinidade com hardware e componentes físicos?', hardware).
pergunta(7, 'Você considera ter bom pensamento crítico e analítico?', pensamento_critico).


calcula_pontuacao(Trilha, Pontuacao) :-
    findall(Peso, (
        perfil(Trilha, Caracteristica, Peso),
        resposta(Caracteristica, s)
    ), Pesos),
    sum_list(Pesos, Pontuacao).

recomenda(Trilha, Pontuacao) :-
    trilha(Trilha, _),
    calcula_pontuacao(Trilha, Pontuacao),
    Pontuacao > 0.

gera_ranking(Ranking) :-
    findall(Pontos-Trilha, (
        trilha(Trilha, _),
        calcula_pontuacao(Trilha, Pontos)
    ), Lista),
    sort(0, @>=, Lista, Ranking).

exibe_resultado([]) :-
    writeln('Nenhuma trilha recomendada. Tente responder mais perguntas positivamente.'), !.

exibe_resultado(Ranking) :-
    nl, writeln('========================================='),
    writeln('           RESULTADO FINAL'),
    writeln('========================================='),
    exibe_trilhas(Ranking, 1),
    nl, writeln('========================================='),
    writeln('         JUSTIFICATIVA DETALHADA'),
    writeln('========================================='),
    justifica_recomendacao(Ranking).

exibe_trilhas([], _).
exibe_trilhas([Pontos-Trilha|Resto], Num) :-
    trilha(Trilha, Desc),
    format('~w°. ~w (~w pontos)~n', [Num, Trilha, Pontos]),
    format('   -> ~w~n~n', [Desc]),
    Num1 is Num + 1,
    exibe_trilhas(Resto, Num1).

justifica_recomendacao([]).
justifica_recomendacao([Pontos-Trilha|Resto]) :-
    Pontos > 0,
    format('~n📋 TRILHA: ~w (~w pontos)~n', [Trilha, Pontos]),
    writeln('   Recomendada devido às seguintes respostas:'),
    findall(Caracteristica-Peso, (
        perfil(Trilha, Caracteristica, Peso),
        resposta(Caracteristica, s)
    ), Matches),
    exibe_matches(Matches),
    justifica_recomendacao(Resto).

exibe_matches([]).
exibe_matches([Caracteristica-Peso|Resto]) :-
    format('   ✓ ~w (peso: ~w)~n', [Caracteristica, Peso]),
    exibe_matches(Resto).


iniciar :-
    writeln('========================================='),
    writeln('  SISTEMA DE RECOMENDAÇÃO DE TRILHAS'),
    writeln('   Especializações em Tecnologia'),
    writeln('========================================='),
    nl,
    writeln('Responda as perguntas com "s" para SIM ou "n" para NÃO.'),
    writeln('Pressione ENTER após cada resposta.'),
    nl,
    retractall(resposta(_, _)),
    faz_perguntas,
    nl, writeln('Calculando recomendações...'), nl,
    gera_ranking(Ranking),
    exibe_resultado(Ranking).

faz_perguntas :-
    pergunta(1, Texto1, Caract1),
    format('1. ~w~n', [Texto1]),
    write('Resposta (s/n): '),
    read(Resp1),
    valida_resposta(Resp1, Caract1),
    
    pergunta(2, Texto2, Caract2),
    format('2. ~w~n', [Texto2]),
    write('Resposta (s/n): '),
    read(Resp2),
    valida_resposta(Resp2, Caract2),
    
    pergunta(3, Texto3, Caract3),
    format('3. ~w~n', [Texto3]),
    write('Resposta (s/n): '),
    read(Resp3),
    valida_resposta(Resp3, Caract3),
    
    pergunta(4, Texto4, Caract4),
    format('4. ~w~n', [Texto4]),
    write('Resposta (s/n): '),
    read(Resp4),
    valida_resposta(Resp4, Caract4),
    
    pergunta(5, Texto5, Caract5),
    format('5. ~w~n', [Texto5]),
    write('Resposta (s/n): '),
    read(Resp5),
    valida_resposta(Resp5, Caract5),
    
    pergunta(6, Texto6, Caract6),
    format('6. ~w~n', [Texto6]),
    write('Resposta (s/n): '),
    read(Resp6),
    valida_resposta(Resp6, Caract6),
    
    pergunta(7, Texto7, Caract7),
    format('7. ~w~n', [Texto7]),
    write('Resposta (s/n): '),
    read(Resp7),
    valida_resposta(Resp7, Caract7).

valida_resposta(s, Caracteristica) :-
    assertz(resposta(Caracteristica, s)), !.
valida_resposta(n, Caracteristica) :-
    assertz(resposta(Caracteristica, n)), !.
valida_resposta(sim, Caracteristica) :-
    assertz(resposta(Caracteristica, s)), !.
valida_resposta('não', Caracteristica) :-
    assertz(resposta(Caracteristica, n)), !.
valida_resposta(nao, Caracteristica) :-
    assertz(resposta(Caracteristica, n)), !.
valida_resposta(_, Caracteristica) :-
    writeln('Resposta inválida! Considerando como NÃO.'),
    assertz(resposta(Caracteristica, n)).

perfil_teste1 :-
    writeln('===== EXECUTANDO PERFIL DE TESTE 1 ====='),
    writeln('Perfil: Aluno com forte inclinação para lógica e dados'),
    retractall(resposta(_, _)),
    assertz(resposta(logica_programacao, s)),
    assertz(resposta(matematica_estatistica, s)),
    assertz(resposta(design_visual, n)),
    assertz(resposta(programacao_frontend, n)),
    assertz(resposta(redes_computadores, n)),
    assertz(resposta(hardware, n)),
    assertz(resposta(pensamento_critico, s)),
    gera_ranking(Ranking),
    exibe_resultado(Ranking).

perfil_teste2 :-
    writeln('===== EXECUTANDO PERFIL DE TESTE 2 ====='),
    writeln('Perfil: Aluno interessado em desenvolvimento web'),
    retractall(resposta(_, _)),
    assertz(resposta(logica_programacao, s)),
    assertz(resposta(matematica_estatistica, n)),
    assertz(resposta(design_visual, s)),
    assertz(resposta(programacao_frontend, s)),
    assertz(resposta(redes_computadores, n)),
    assertz(resposta(hardware, n)),
    assertz(resposta(pensamento_critico, s)),
    gera_ranking(Ranking),
    exibe_resultado(Ranking).

perfil_teste3 :-
    writeln('===== EXECUTANDO PERFIL DE TESTE 3 ====='),
    writeln('Perfil: Aluno interessado em redes e segurança'),
    retractall(resposta(_, _)),
    assertz(resposta(logica_programacao, n)),
    assertz(resposta(matematica_estatistica, n)),
    assertz(resposta(design_visual, n)),
    assertz(resposta(programacao_frontend, n)),
    assertz(resposta(redes_computadores, s)),
    assertz(resposta(hardware, s)),
    assertz(resposta(pensamento_critico, s)),
    gera_ranking(Ranking),
    exibe_resultado(Ranking).

executar_todos_testes :-
    perfil_teste1, nl, nl,
    perfil_teste2, nl, nl,
    perfil_teste3.



% Instruções de Uso

% Para usar o sistema:
% 1. Modo Interativo: ?- iniciar.
% 2. Teste Automático: ?- perfil_teste1. (ou perfil_teste2, perfil_teste3)
% 3. Todos os testes: ?- executar_todos_testes.
