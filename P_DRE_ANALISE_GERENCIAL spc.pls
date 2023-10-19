create or replace PACKAGE       P_DRE_ANALISE_GERENCIAL AS
--criado em:25/09/2017
--criado por: HMIT       
-- Objetivo:
-- Par�metros:

  /* TODO enter package declarations (types, exceptions, methods etc) here */

  PROCEDURE P_LIMPA_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                         p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                         p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                         p_nr_registro in ca.dre_controle_execucao.nr_registro%type,
                         P_FL_ERRO OUT VARCHAR2,
                         P_DS_MENSAGEM_RETORNO OUT VARCHAR2);
-- criado em: 02/03/2018
-- criado por: HMIT
-- Objetivo: Limpar as tabelas para gerar DRE-G.

-- Par�metros: P_NR_ANO: Ano que esta sendo gerado a DRE-G
--             P_NR_MES: M�s que esta sendo gerado a DRE-G.
--             P_CD_ESTABELECIMENTO: C�digo do estabelecimento do us�rio respons�vel pelo processo.
--             P_NR_REGISTRO: Identifica��o do usu�rio respons�vel pelo processo.

  PROCEDURE P_EXECUTA_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 21/12/2017
-- criado por: HMIT
-- Objetivo: Executar as procedures para gerar DRE-G.

-- Par�metros: P_NR_ANO: Ano que esta sendo gerado a DRE-G
--             P_NR_MES: M�s que esta sendo gerado a DRE-G.
--             P_CD_ESTABELECIMENTO: C�digo do estabelecimento do us�rio respons�vel pelo processo.
--             P_NR_REGISTRO: Identifica��o do usu�rio respons�vel pelo processo.

  PROCEDURE P_INICIO_EXECUCAO_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                   p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                   p_id_plano_execucao in ca.dre_controle_execucao.id_plano_execucao%type,
                                   p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                   p_nr_registro in ca.dre_controle_execucao.nr_registro%type,
                                   p_id_controle_execucao out ca.dre_controle_execucao.id_controle_execucao%type);
-- criado em: 26/12/2017
-- criado por: HMIT
-- Objetivo: Setar o in�cio da execu��o das procedures para gerar DRE-G.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado a DRE-G
--             P_NR_MES: M�s que esta sendo gerado a DRE-G.
--             P_ID_PLANO_EXECUCAO: Identificador do plano de execu��o.
--             P_CD_ESTABELECIMENTO: C�digo do estabelecimento do us�rio respons�vel pelo processo.
--             P_NR_REGISTRO: Identifica��o do usu�rio respons�vel pelo processo.
--             P_MENSAGEM: Mensagem de retorno gerada pela execu��o da procedure.

  PROCEDURE P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao in ca.dre_controle_execucao.id_controle_execucao%type,
                                    p_status in ca.dre_controle_execucao.status%type);
-- criado em: 26/12/2017
-- criado por: HMIT
-- Objetivo: Setar o t�rmino da execu��o das procedures para gerar DRE-G.
-- Par�metros: P_ID_CONTROLE_EXECUCAO: Identificador do controle de execu��o.
--             P_STATUS: Status que identifica o resultado da execu��o.

  PROCEDURE P_LOG_EXECUCAO_DRE (p_id_controle_execucao in ca.dre_controle_execucao.id_controle_execucao%type,
                                p_ds_msg in ca.dre_log_execucao.ds_msg%type,
                                p_tp_mensagem in ca.dre_log_execucao.tp_msg%type);
-- criado em: 27/12/2017
-- criado por: HMIT
-- Objetivo: Mensagens da execu��o das procedures para gerar DRE-G.
-- Par�metros: P_ID_CONTROLE_EXECUCAO: Identificador do controle de execu��o.
--             P_DS_MSG: Mensagem na execu��o.
--             P_TP_MSG: Tipo Mensagem na execu��o: A - AVISO E E- ERRO.

  PROCEDURE P_CRIA_GRADE_ALUNO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 18/09/2017
-- criado por: HMIT
-- Objetivo: Obter quantidade de alunos da gradua��o e p�s-gradua�ao.
--           Converter centro de custo do curso para estrutura organizacional conforme tabela CA.DRE_ESTRUTURA_ORG_EX.
--           Totalizar por n�vel: 3, 2 e 1.
--           Calcular percentuais em cada n�vel, em rela��o ao total do n�vel superior.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerada a grade de alunos.
--             P_NR_MES: M�s que esta sendo gerada a grade de alunos.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_CRIA_GRADE_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 20/12/2017
-- criado por: HMIT
-- Objetivo: Carrega as disciplinas turma curso ministrados por docente e calcula percentual de horas de cada disciplina em rela��o
-- ao total.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_APURA_VERBA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 21/09/2017
-- criado por: HMIT
-- Objetivo: Apurar as verbas na folha sispro
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_APURA_VERBA_DOCENCIA_POS (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                        p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                        p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                        p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 22/09/2017
-- criado por: HMIT
-- Objetivo: Obt�m, a partir do m�dulo de memorandos do Sistema acad�mico os valores pagos para cada curso turma ministrado
--           na p�s-gradua��o.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_APURA_VERBA_ADM (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                               p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                               p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                               p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 22/09/2017
-- criado por: HMIT
-- Objetivo: Apura verba administrativa folha acad�mica.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_CRIA_GRADE_ALOCACAO_DOCENTE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 20/09/2017
-- alterada em: 20/12/2017
-- criado por: HMIT
-- Objetivo: Carrega as disciplinas turma curso ministrados por docente e calcula percentual de horas de cada disciplina em rela��o
-- ao total.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_ATU_GRADE_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                          p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                          p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                          p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 20/09/2017
-- criado por: HMIT
-- Objetivo: Cria grade por disciplina turma e calcula os percentuais em rela��o ao total da disciplina turma
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_PROPORCIONALIZA_VERBAS (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                      p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                      p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                      p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 23/10/2017
-- criado por: HMIT
-- Objetivo: Proporcionaliza o valor doc�ncia, doc�ncia p�s e administrativo atualizando CA.GRADE_VERBAS.
--           Proporcionaliza os cursos de p�s atualizando CA.GRADE_VERBAS_POS.
--           Proporcionaliza os cargos administrativos atualizando CA.GRADE_VERBAS_ADM.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_APURA_CUSTO_SISPRO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                  p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                  p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                  p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 23/10/2017
-- criado por: HMIT
-- Objetivo: Apura custo no Sispro e atualiza tabela de apropria��o indireta.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_VL_APROPRIACAO_DIRETA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                     p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                     p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                     p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 14/09/2017
-- criado por: HMIT
-- Objetivo: Gravar valores a apropriar na tabela de CA.DRE_VL_APROPRIACAO_DIRETA identificando a regra que foi aplicada que esta na
-- tabela CA.DRE_PAR_APROPRIACAO_DIRETA identificando conta contabil e centro de custo. Esses valores s�o trazidos do Balencete do EBS.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerada a apropria��o.
--             P_NR_MES: M�s que esta sendo gerada a apropria��o.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_RATEIO_APROPRIACAO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                  p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                  p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                  p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 06/10/2017
-- criado por: HMIT
-- Objetivo: Rateio dos valores da apropria��o direta e indireta para o menor n�vel de granularidade:
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_GRAVA_VALORES_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                 p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                 p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                 p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 10/10/2017
-- criado por: HMIT
-- Objetivo: Totalizar os valores da CA.DRE.VL_CALCULO de acordo com a conta do CA.PLANO_CONTAS gravando o resultado
-- em CA.DRE_VALOR.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_TOTALIZA_NIVEIS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                   p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                   p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                   p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 19/10/2017
-- criado por: HMIT
-- Objetivo: Totaliza n�veis da DRE
-- Par�metros: P_NR_ANO: Ano que esta sendo totalizado niveis da DRE.
--             P_NR_MES: M�s que esta sendo TOTALIZADO niveis da DRE.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

   PROCEDURE P_GERA_LINHAS_CALCULADAS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 27/10/2017
-- criado por: HMIT
-- Objetivo: Gerar as linhas calculadas da DRE-G.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o indireta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o indireta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

   PROCEDURE P_LANC_DIFERENCAS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                    p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                    p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                    p_nr_registro in ca.dre_controle_execucao.nr_registro%type);

-- criado em: 22/01/2018
-- criado por: HMIT
-- Objetivo: Calcula e grava lan�amento das diferen�as entre CTB EBS x Folha Sispro
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropria��o direta.
--             P_NR_MES: M�s que esta sendo gerada o rateio da apropria��o direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_RESULTADO_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                          p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                          p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                          p_nr_registro in ca.dre_controle_execucao.nr_registro%type);

-- criado em: 23/02/2018
-- criado por: HMIT
-- Objetivo: Avalia o resultado por disciplina turma.
-- Par�metros: P_NR_ANO: Ano que esta sendo gerado o superavit disciplina turma.
--             P_NR_MES: M�s que esta sendo gerado o superavit disciplina turma.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

  PROCEDURE P_OVERHEAD (p_dt_inicial in ca.dre_overhead.dt_inicial%type,
                        p_dt_final in ca.dre_overhead.dt_final%type,
                        p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                        p_nr_registro in ca.dre_controle_execucao.nr_registro%type);

-- criado em: 06/03/2018
-- criado por: HMIT
-- Objetivo: Calcular o percentual do overhead do ano / semestre.
-- Par�metros: P_DT_INICIAL: Data inicial que esta sendo considerado para o semestre para gerar o overhead.
--             P_DT_FINAL: Data final que esta sendo considerado para o semestre para gerar o overhead.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcion�rio que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcion�rio que esta executando a rotina.

   PROCEDURE P_INSERE_EST_ORG_EX (P_NR_ANO IN CA.DRE_ESTRUTURA_ORG_EX.NR_ANO%TYPE,
                                  P_NR_MES IN CA.DRE_ESTRUTURA_ORG_EX.NR_MES%TYPE,
                                  P_CD_ESTABELECIMENTO IN CA.DRE_PERIODO.CD_ESTABELECIMENTO%TYPE,
                                  P_NR_REGISTRO IN CA.DRE_PERIODO.NR_REGISTRO%TYPE);

   PROCEDURE P_INSERE_PERIODO (P_ID_PERIODO_DRE OUT CA.DRE_PERIODO.ID_PERIODO_DRE%TYPE,
                               P_NR_ANO IN CA.DRE_PERIODO.NR_ANO%TYPE,
                               P_NR_MES IN CA.DRE_PERIODO.NR_MES%TYPE,
                               P_CD_ESTABELECIMENTO IN CA.DRE_PERIODO.CD_ESTABELECIMENTO%TYPE,
                               P_NR_REGISTRO IN CA.DRE_PERIODO.NR_REGISTRO%TYPE,
                               P_FL_ERRO OUT VARCHAR2,
                               P_DS_MENSAGEM_RETORNO OUT VARCHAR2);

   PROCEDURE P_ALTERA_PERIODO (P_ID_PERIODO_DRE IN CA.DRE_PERIODO.ID_PERIODO_DRE%TYPE,
                               P_CD_ESTABELECIMENTO IN CA.DRE_PERIODO.CD_ESTABELECIMENTO%TYPE,
                               P_NR_REGISTRO IN CA.DRE_PERIODO.NR_REGISTRO%TYPE,
                               P_FL_ERRO OUT VARCHAR2,
                               P_DS_MENSAGEM_RETORNO OUT VARCHAR2);

  PROCEDURE P_PROCESSO_DRE (P_NR_ANO in CA.DRE_CONTROLE_EXECUCAO.nr_ano%type,
                            P_NR_MES in CA.DRE_CONTROLE_EXECUCAO.nr_mes%type,
                            P_ID_PLANO_EXECUCAO in CA.DRE_CONTROLE_EXECUCAO.id_plano_execucao%type,
                            P_CD_ESTABELECIMENTO in CA.DRE_CONTROLE_EXECUCAO.cd_estabelecimento%type,
                            P_NR_REGISTRO in CA.DRE_CONTROLE_EXECUCAO.nr_registro%type,
                            P_FL_ERRO OUT VARCHAR2,
                            P_DS_MENSAGEM_RETORNO OUT VARCHAR2);


END P_DRE_ANALISE_GERENCIAL;