CREATE OR REPLACE PACKAGE P_DRE_ANALISE_GERENCIAL AS
--criado em:25/09/2017
--criado por: HMIT       
-- Objetivo: 
-- Parâmetros:
-- aterações para calcular a qtd de alunos;  
-- modificacao


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

-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado a DRE-G
--             P_NR_MES: Mês que esta sendo gerado a DRE-G.
--             P_CD_ESTABELECIMENTO: Código do estabelecimento do usário responsável pelo processo.
--             P_NR_REGISTRO: Identificação do usuário responsável pelo processo.

  PROCEDURE P_EXECUTA_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 21/12/2017
-- criado por: HMIT
-- Objetivo: Executar as procedures para gerar DRE-G.

-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado a DRE-G
--             P_NR_MES: Mês que esta sendo gerado a DRE-G.
--             P_CD_ESTABELECIMENTO: Código do estabelecimento do usário responsável pelo processo.
--             P_NR_REGISTRO: Identificação do usuário responsável pelo processo.

  PROCEDURE P_INICIO_EXECUCAO_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                   p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                   p_id_plano_execucao in ca.dre_controle_execucao.id_plano_execucao%type,
                                   p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                   p_nr_registro in ca.dre_controle_execucao.nr_registro%type,
                                   p_id_controle_execucao out ca.dre_controle_execucao.id_controle_execucao%type);
-- criado em: 26/12/2017
-- criado por: HMIT
-- Objetivo: Setar o início da execução das procedures para gerar DRE-G.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado a DRE-G
--             P_NR_MES: Mês que esta sendo gerado a DRE-G.
--             P_ID_PLANO_EXECUCAO: Identificador do plano de execução.
--             P_CD_ESTABELECIMENTO: Código do estabelecimento do usário responsável pelo processo.
--             P_NR_REGISTRO: Identificação do usuário responsável pelo processo.
--             P_MENSAGEM: Mensagem de retorno gerada pela execução da procedure.

  PROCEDURE P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao in ca.dre_controle_execucao.id_controle_execucao%type,
                                    p_status in ca.dre_controle_execucao.status%type);
-- criado em: 26/12/2017
-- criado por: HMIT
-- Objetivo: Setar o término da execução das procedures para gerar DRE-G.
-- Parâmetros: P_ID_CONTROLE_EXECUCAO: Identificador do controle de execução.
--             P_STATUS: Status que identifica o resultado da execução.

  PROCEDURE P_LOG_EXECUCAO_DRE (p_id_controle_execucao in ca.dre_controle_execucao.id_controle_execucao%type,
                                p_ds_msg in ca.dre_log_execucao.ds_msg%type,
                                p_tp_mensagem in ca.dre_log_execucao.tp_msg%type);
-- criado em: 27/12/2017
-- criado por: HMIT
-- Objetivo: Mensagens da execução das procedures para gerar DRE-G.
-- Parâmetros: P_ID_CONTROLE_EXECUCAO: Identificador do controle de execução.
--             P_DS_MSG: Mensagem na execução.
--             P_TP_MSG: Tipo Mensagem na execução: A - AVISO E E- ERRO.

  PROCEDURE P_CRIA_GRADE_ALUNO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 18/09/2017
-- criado por: HMIT
-- Objetivo: Obter quantidade de alunos da graduação e pós-graduaçao.
--           Converter centro de custo do curso para estrutura organizacional conforme tabela CA.DRE_ESTRUTURA_ORG_EX.
--           Totalizar por nível: 3, 2 e 1.
--           Calcular percentuais em cada nível, em relação ao total do nível superior.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerada a grade de alunos.
--             P_NR_MES: Mês que esta sendo gerada a grade de alunos.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_CRIA_GRADE_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 20/12/2017
-- criado por: HMIT
-- Objetivo: Carrega as disciplinas turma curso ministrados por docente e calcula percentual de horas de cada disciplina em relação
-- ao total.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_APURA_VERBA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 21/09/2017
-- criado por: HMIT
-- Objetivo: Apurar as verbas na folha sispro
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_APURA_VERBA_DOCENCIA_POS (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                        p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                        p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                        p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 22/09/2017
-- criado por: HMIT
-- Objetivo: Obtém, a partir do módulo de memorandos do Sistema acadêmico os valores pagos para cada curso turma ministrado
--           na pós-graduação.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_APURA_VERBA_ADM (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                               p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                               p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                               p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 22/09/2017
-- criado por: HMIT
-- Objetivo: Apura verba administrativa folha acadêmica.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_CRIA_GRADE_ALOCACAO_DOCENTE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 20/09/2017
-- alterada em: 20/12/2017
-- criado por: HMIT
-- Objetivo: Carrega as disciplinas turma curso ministrados por docente e calcula percentual de horas de cada disciplina em relação
-- ao total.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_ATU_GRADE_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                          p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                          p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                          p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 20/09/2017
-- criado por: HMIT
-- Objetivo: Cria grade por disciplina turma e calcula os percentuais em relação ao total da disciplina turma
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_PROPORCIONALIZA_VERBAS (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                      p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                      p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                      p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 23/10/2017
-- criado por: HMIT
-- Objetivo: Proporcionaliza o valor docência, docência pós e administrativo atualizando CA.GRADE_VERBAS.
--           Proporcionaliza os cursos de pós atualizando CA.GRADE_VERBAS_POS.
--           Proporcionaliza os cargos administrativos atualizando CA.GRADE_VERBAS_ADM.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_APURA_CUSTO_SISPRO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                  p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                  p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                  p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 23/10/2017
-- criado por: HMIT
-- Objetivo: Apura custo no Sispro e atualiza tabela de apropriação indireta.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_VL_APROPRIACAO_DIRETA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                     p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                     p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                     p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 14/09/2017
-- criado por: HMIT
-- Objetivo: Gravar valores a apropriar na tabela de CA.DRE_VL_APROPRIACAO_DIRETA identificando a regra que foi aplicada que esta na
-- tabela CA.DRE_PAR_APROPRIACAO_DIRETA identificando conta contabil e centro de custo. Esses valores são trazidos do Balencete do EBS.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerada a apropriação.
--             P_NR_MES: Mês que esta sendo gerada a apropriação.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_RATEIO_APROPRIACAO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                  p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                  p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                  p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 06/10/2017
-- criado por: HMIT
-- Objetivo: Rateio dos valores da apropriação direta e indireta para o menor nível de granularidade:
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_GRAVA_VALORES_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                 p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                 p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                 p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 10/10/2017
-- criado por: HMIT
-- Objetivo: Totalizar os valores da CA.DRE.VL_CALCULO de acordo com a conta do CA.PLANO_CONTAS gravando o resultado
-- em CA.DRE_VALOR.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_TOTALIZA_NIVEIS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                   p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                   p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                   p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 19/10/2017
-- criado por: HMIT
-- Objetivo: Totaliza níveis da DRE
-- Parâmetros: P_NR_ANO: Ano que esta sendo totalizado niveis da DRE.
--             P_NR_MES: Mês que esta sendo TOTALIZADO niveis da DRE.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

   PROCEDURE P_GERA_LINHAS_CALCULADAS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                           p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                           p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                           p_nr_registro in ca.dre_controle_execucao.nr_registro%type);
-- criado em: 27/10/2017
-- criado por: HMIT
-- Objetivo: Gerar as linhas calculadas da DRE-G.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação indireta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação indireta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

   PROCEDURE P_LANC_DIFERENCAS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                    p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                    p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                    p_nr_registro in ca.dre_controle_execucao.nr_registro%type);

-- criado em: 22/01/2018
-- criado por: HMIT
-- Objetivo: Calcula e grava lançamento das diferenças entre CTB EBS x Folha Sispro
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o rateio da apropriação direta.
--             P_NR_MES: Mês que esta sendo gerada o rateio da apropriação direta.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_RESULTADO_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                          p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                          p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                          p_nr_registro in ca.dre_controle_execucao.nr_registro%type);

-- criado em: 23/02/2018
-- criado por: HMIT
-- Objetivo: Avalia o resultado por disciplina turma.
-- Parâmetros: P_NR_ANO: Ano que esta sendo gerado o superavit disciplina turma.
--             P_NR_MES: Mês que esta sendo gerado o superavit disciplina turma.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

  PROCEDURE P_OVERHEAD (p_dt_inicial in ca.dre_overhead.dt_inicial%type,
                        p_dt_final in ca.dre_overhead.dt_final%type,
                        p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                        p_nr_registro in ca.dre_controle_execucao.nr_registro%type);

-- criado em: 06/03/2018
-- criado por: HMIT
-- Objetivo: Calcular o percentual do overhead do ano / semestre.
-- Parâmetros: P_DT_INICIAL: Data inicial que esta sendo considerado para o semestre para gerar o overhead.
--             P_DT_FINAL: Data final que esta sendo considerado para o semestre para gerar o overhead.
--             P_CD_ESTABELECIEMNTO: Estabelecimento do funcionário que esta executando a rotina.
--             P_NR_REGISTRO: Matricula do funcionário que esta executando a rotina.

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
/
CREATE OR REPLACE PACKAGE BODY P_DRE_ANALISE_GERENCIAL AS
--modificacao
PROCEDURE P_LIMPA_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                       p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                       p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                       p_nr_registro in ca.dre_controle_execucao.nr_registro%type,
                       P_FL_ERRO OUT VARCHAR2,
                       P_DS_MENSAGEM_RETORNO OUT VARCHAR2) IS

    v_dt_folha                       DATE;
    v_nr_ano                         VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                     VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                     VARCHAR2 (2)    := NULL;


    CURSOR CR_CONTROLE_EXECUCAO (P_NR_ANO in CA.DRE_CONTROLE_EXECUCAO.nr_ano%type,
                                 P_NR_MES in CA.DRE_CONTROLE_EXECUCAO.nr_mes%type) IS
    SELECT *
    FROM CA.DRE_CONTROLE_EXECUCAO
    WHERE NR_ANO = P_NR_ANO
    AND NR_MES = P_NR_MES;
    ST_CONTROLE_EXECUCAO CR_CONTROLE_EXECUCAO%ROWTYPE;
BEGIN

  P_FL_ERRO := 'S';
  P_DS_MENSAGEM_RETORNO := 'Procedimento de apagar DRE iniciado e não terminado.';


   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
   v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy');


   delete from ca.dre_valor where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--1
      commit;
   delete from ca.dre_vl_calculo where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--2
      commit;
   delete from ca.dre_vl_apropriacao_indireta where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--3
      commit;
   delete from ca.dre_vl_apropriacao_direta where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--4
   commit;
   P_DS_MENSAGEM_RETORNO := 'Procedimento de apagar DRE iniciado e não terminado (4 de 16 concluído).';

   delete from ca.dre_grade_alunos where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--5
      commit;
   delete from ca.dre_grade_disciplina_turma where dt_folha = v_dt_folha;--6
      commit;
   delete from ca.dre_grade_verbas_adm a where exists(select 1
                                                        from ca.dre_grade_verbas v
                                                       where v.dt_folha = v_dt_folha
                                                         and v.id_grade_verbas = a.id_grade_verbas);--7
   commit;                                                         
   delete from ca.dre_grade_verbas_pos p where exists(select 1
                                                        from ca.dre_grade_verbas v
                                                       where v.dt_folha = v_dt_folha
                                                         and v.id_grade_verbas = p.id_grade_verbas);--8
   commit;
   P_DS_MENSAGEM_RETORNO := 'Procedimento de apagar DRE iniciado e não terminado (8 de 16 concluído).';


   delete from ca.dre_resultado_disciplina where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--9
   commit;
   delete from ca.dre_valor_rateio where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--13
   commit;   
   delete from CA.DRE_PERCENTUAL_RATEIO where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--13
      commit;   

   delete from ca.dre_estrutura_org_itens_ex
    where ID_ESTRUTURA_ORG_EX in (select ID_ESTRUTURA_ORG_EX
                                  from ca.dre_estrutura_org_ex
                                  where nr_ano = p_nr_ano and nr_mes = p_nr_mes);--10
   delete from ca.dre_estrutura_org_ex where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--11
      commit;
   delete from ca.DRE_GRADE_EXCECAO where nr_ano = p_nr_ano and nr_mes = p_nr_mes;--12
   commit;
   P_DS_MENSAGEM_RETORNO := 'Procedimento de apagar DRE iniciado e não terminado (12 de 16 concluído).';

  --delete from ca.DRE_OVERHEAD;

   delete from ca.dre_grade_alocacao_docente where dt_folha = v_dt_folha;--14
   commit;

   delete from ca.dre_grade_verbas where dt_folha = v_dt_folha;--15


   commit;
   P_DS_MENSAGEM_RETORNO := 'Procedimento de apagar DRE iniciado e não terminado (15 de 16 concluído).';


  OPEN CR_CONTROLE_EXECUCAO(P_NR_ANO, P_NR_MES);
  LOOP
    FETCH CR_CONTROLE_EXECUCAO INTO ST_CONTROLE_EXECUCAO;
    EXIT WHEN CR_CONTROLE_EXECUCAO%NOTFOUND;


    UPDATE CA.DRE_CONTROLE_EXECUCAO
      SET STATUS = '3'
    WHERE ID_CONTROLE_EXECUCAO = ST_CONTROLE_EXECUCAO.ID_CONTROLE_EXECUCAO;


    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (ST_CONTROLE_EXECUCAO.ID_CONTROLE_EXECUCAO, 'Exclusão dos dados da DRE','A');
  END LOOP;
  CLOSE CR_CONTROLE_EXECUCAO;--16
  commit;


  P_FL_ERRO := 'N';
  P_DS_MENSAGEM_RETORNO := 'Procedimento de apagar DRE finalizado com sucesso (16 de 16 concluído).';


END P_LIMPA_DRE;

PROCEDURE P_EXECUTA_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                         p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                         p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                         p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_mensagem                       VARCHAR2 (1000) := NULL;
    v_qtd_linhas                     NUMBER   (6)    := 0;
    v_dt_folha                       DATE;
    v_nr_ano                         VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                     VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                     VARCHAR2 (2)    := NULL;

BEGIN

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
   v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy');

   DBMS_OUTPUT.PUT_LINE('Inicio da prodedure P_EXECUTA_DRE.');


   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_grade_excecao.');

   delete from ca.dre_grade_excecao where nr_ano = p_nr_ano and nr_mes = p_nr_mes;


   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_resultado_disciplina.');

   delete from ca.dre_resultado_disciplina where nr_ano = p_nr_ano and nr_mes = p_nr_mes;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_valor.');

   delete from ca.dre_valor where nr_ano = p_nr_ano and nr_mes = p_nr_mes;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_vl_calculo.');

   delete from ca.dre_vl_calculo where nr_ano = p_nr_ano and nr_mes = p_nr_mes;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_vl_apropriacao_indireta.');

   delete from ca.dre_vl_apropriacao_indireta where nr_ano = p_nr_ano and nr_mes = p_nr_mes;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_vl_apropriacao_direta.');

   delete from ca.dre_vl_apropriacao_direta where nr_ano = p_nr_ano and nr_mes = p_nr_mes;

   commit;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_grade_alunos.');

   delete from ca.dre_grade_alunos where nr_ano = p_nr_ano and nr_mes = p_nr_mes;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_grade_disciplina_turma.');

   delete from ca.dre_grade_disciplina_turma where dt_folha = v_dt_folha;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_grade_alocacao_docente.');

   delete from ca.dre_grade_alocacao_docente where dt_folha = v_dt_folha;

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_grade_verbas_adm.');

   delete from ca.dre_grade_verbas_adm a where exists(select 1
                                                        from ca.dre_grade_verbas v
                                                       where v.dt_folha = v_dt_folha
                                                         and v.id_grade_verbas = a.id_grade_verbas);

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_grade_verbas_pos.');

   delete from ca.dre_grade_verbas_pos p where exists(select 1
                                                        from ca.dre_grade_verbas v
                                                       where v.dt_folha = v_dt_folha
                                                         and v.id_grade_verbas = p.id_grade_verbas);

   DBMS_OUTPUT.PUT_LINE('Deleção dos dados da tabela ca.dre_vl_apropriacao_diretaca.dre_grade_verbas.');

   delete from ca.dre_grade_verbas where dt_folha = v_dt_folha;

   commit;

   v_qtd_linhas := 0;

   DBMS_OUTPUT.PUT_LINE('Executa as procedures da DRE-G.');

   s_DRE_ANALISE_GERENCIAL.P_CRIA_GRADE_ALUNO (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_CRIA_GRADE_DISCIPLINA_TURMA (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_APURA_VERBA (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_APURA_VERBA_DOCENCIA_POS (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_APURA_VERBA_ADM (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_CRIA_GRADE_ALOCACAO_DOCENTE (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_ATU_GRADE_DISCIPLINA_TURMA (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_PROPORCIONALIZA_VERBAS (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_APURA_CUSTO_SISPRO (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_VL_APROPRIACAO_DIRETA (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_RATEIO_APROPRIACAO (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_GRAVA_VALORES_DRE (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_TOTALIZA_NIVEIS_DRE (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_GERA_LINHAS_CALCULADAS_DRE (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_LANC_DIFERENCAS_DRE (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;

   s_DRE_ANALISE_GERENCIAL.P_RESULTADO_DISCIPLINA_TURMA (p_nr_ano,p_nr_mes,p_cd_estabelecimento,p_nr_registro);

   v_qtd_linhas := v_qtd_linhas + 1;
   commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       DBMS_OUTPUT.PUT_LINE('Não foram executadas procedures da DRE-G do ano ' || p_nr_ano || ' mês ' ||
                             p_nr_mes || '. Mensagem: ' || v_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       DBMS_OUTPUT.PUT_LINE('Total de procedures executadas na DRE-G ' || v_mensagem);
    END IF;

    DBMS_OUTPUT.PUT_LINE('Fim da prodedure P_EXECUTA_DRE.');

END P_EXECUTA_DRE;

PROCEDURE P_INICIO_EXECUCAO_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                 p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                 p_id_plano_execucao in ca.dre_controle_execucao.id_plano_execucao%type,
                                 p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                 p_nr_registro in ca.dre_controle_execucao.nr_registro%type,
                                 p_id_controle_execucao out ca.dre_controle_execucao.id_controle_execucao%type) IS

    v_qtd_linhas                     NUMBER   (6)    := 0;
    v_id_controle_execucao           NUMBER   (8)    := 0;
    v_id_controle_execucao_tab       NUMBER   (8)    := 0;
    v_nr_ano                         NUMBER   (4)    := 0;
    v_nr_mes                         NUMBER   (2)    := 0;
    v_id_plano_execucao              NUMBER   (8)    := 0;
    v_status                         VARCHAR2 (1)    := NULL;
    p_ds_msg                         VARCHAR2 (500)  := NULL;
    p_tp_mensagem                    VARCHAR2 (1)    := NULL;

BEGIN

   v_id_controle_execucao := 0;
   v_id_controle_execucao_tab := 0;
   p_id_controle_execucao := 0;
   v_nr_ano := 0;
   v_nr_mes := 0;
   v_id_plano_execucao := 0;
   v_status := null;


   BEGIN
      -- consulta o ultimo procedimento executado
       select ce.nr_ano, ce.nr_mes, ce.id_plano_execucao, ce.status, ce.id_controle_execucao
         into v_nr_ano, v_nr_mes, v_id_plano_execucao, v_status, v_id_controle_execucao_tab
         from ca.dre_log_execucao lg, ca.dre_controle_execucao ce, ca.dre_plano_execucao pl
        where lg.id_controle_execucao = ce.id_controle_execucao
          and pl.id_plano_execucao = ce.id_plano_execucao
          and lg.id_log_execucao = (select max(logex.id_log_execucao) from ca.dre_log_execucao logex);
   EXCEPTION
        WHEN OTHERS THEN
            v_nr_ano := 0;

            v_nr_mes := 0;
            v_id_plano_execucao := 0;
            v_status := null;
            v_id_controle_execucao_tab := 0;
   END;


   -- verifica se o procedimento solicitado ja foi executado
   IF (p_nr_ano = v_nr_ano and p_nr_mes = v_nr_mes and p_id_plano_execucao = v_id_plano_execucao and v_status in (1,2)) THEN
          p_id_controle_execucao := v_id_controle_execucao_tab;
          p_ds_msg := 'Não é permitido executar rotina, pois já foi executada.';
          p_tp_mensagem := 'E';
          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
       BEGIN
          -- verifica se existe algum procedimento em execucao
           select id_controle_execucao
             into v_id_controle_execucao
             from ca.dre_controle_execucao
            where status = 0;
       EXCEPTION
             when no_data_found then
                  BEGIN
                      -- validar se vai ser executado novamente ou se nunca foi executado
                      select ID_CONTROLE_EXECUCAO
                        into p_id_controle_execucao
                        from ca.DRE_CONTROLE_EXECUCAO
                       where STATUS = '3'
                         and NR_ANO = p_nr_ano
                         and NR_MES = p_nr_mes
                         and ID_PLANO_EXECUCAO = p_id_plano_execucao;


                     UPDATE ca.dre_controle_execucao
                        SET STATUS = '0'
                     WHERE ID_CONTROLE_EXECUCAO = p_id_controle_execucao;


                  EXCEPTION
                      when no_data_found then
                           BEGIN
                                p_id_controle_execucao := ca.sq_dre_controle_execucao.nextval;
                                INSERT INTO ca.dre_controle_execucao
                                            (ID_CONTROLE_EXECUCAO,
                                             NR_ANO,
                                             NR_MES,
                                             ID_PLANO_EXECUCAO,
                                             DT_EXECUCAO,
                                             STATUS,
                                             CD_ESTABELECIMENTO,
                                             NR_REGISTRO
                                            )
                                     VALUES (p_id_controle_execucao,
                                             p_nr_ano,
                                             p_nr_mes,
                                             p_id_plano_execucao,
                                             sysdate,
                                             0,
                                             p_cd_estabelecimento,
                                             p_nr_registro
                                           );
                           EXCEPTION
                                  WHEN OTHERS THEN
                                       p_ds_msg := sqlerrm;
                                       p_tp_mensagem := 'E';
                                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END;

                  END;
       END;


       IF (v_id_controle_execucao <> 0) THEN
           p_id_controle_execucao := v_id_controle_execucao;
           p_ds_msg := 'Não é permitido iniciar a execução da rotina, pois existe uma execução em andamento.';
           p_tp_mensagem := 'E';
           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
       END IF;
   END IF;
   commit;
END P_INICIO_EXECUCAO_DRE;

PROCEDURE P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao in ca.dre_controle_execucao.id_controle_execucao%type,
                                  p_status in ca.dre_controle_execucao.status%type) IS

    p_ds_msg                         VARCHAR2 (500)  := NULL;
    p_tp_mensagem                    VARCHAR2 (1)    := NULL;

BEGIN

  BEGIN
    update ca.dre_controle_execucao
       set status = p_status
     where id_controle_execucao = p_id_controle_execucao;
  EXCEPTION
        WHEN OTHERS THEN
             p_ds_msg:= sqlerrm;
             p_tp_mensagem := 'E';
             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
  END;

END P_TERMINO_EXECUCAO_DRE;

PROCEDURE P_LOG_EXECUCAO_DRE (p_id_controle_execucao in ca.dre_controle_execucao.id_controle_execucao%type,
                              p_ds_msg in ca.dre_log_execucao.ds_msg%type,
                              p_tp_mensagem in ca.dre_log_execucao.tp_msg%type) IS

    p_mengagem                       VARCHAR2 (500)  := NULL;
    p_tipo_mensagem                  VARCHAR2 (1)    := NULL;

BEGIN
    BEGIN
        INSERT INTO ca.dre_log_execucao
                    (ID_LOG_EXECUCAO,
                     ID_CONTROLE_EXECUCAO,
                     DS_MSG,
                     TP_MSG,
                     DT_LOG
                    )
             VALUES (ca.sq_dre_log_execucao.nextval,
                     p_id_controle_execucao,
                     p_ds_msg,
                     p_tp_mensagem,
                     sysdate
                   );
    EXCEPTION
          WHEN OTHERS THEN
               p_mengagem := sqlerrm;
               p_tipo_mensagem := 'E';
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_mengagem,p_tipo_mensagem);
    END;
END P_LOG_EXECUCAO_DRE;

PROCEDURE P_CRIA_GRADE_ALUNO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                              p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                              p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                              p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS
--Ponto de alteração
-- pre condição: criar tabela para registrar qtd de aluno
--Incluir apuração de quantidade de alunos   
--registrar quantidade de aluno
--verificar se existe qtd de aluno em tabela auxiliar
--apurar grade de aluno com base na tbela auxiliar
-- incluir trativa do chamado 2023080808000601
--
    v_nr_ano_par                 NUMBER   (4)    := 0;
    v_nr_mes_par                 NUMBER   (2)    := 0;
    v_nr_ano                     VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                 VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                 VARCHAR2 (2)    := NULL;
    v_tamanho                    NUMBER   (2)    := 0;
    v_dt_inicio_semestre         VARCHAR2 (8)    := NULL;
    v_dt_fim_semestre            VARCHAR2 (8)    := NULL;
    v_vl_total                   NUMBER   (15,2) := 0;
    v_qtd_linhas_cursor          NUMBER   (6)    := 0;
    v_semestre                   NUMBER   (3)    := 0;
    v_dt_folha                   DATE;
    v_dt_folha_fre               DATE;
    v_nr_mes_fre                 NUMBER   (4)    := NULL;
    v_nr_mes_atu                 VARCHAR2 (2)    := NULL;
    v_nr_ano_atu                 VARCHAR2 (2)    := NULL;
    v_mensagem                   VARCHAR2 (1000) := NULL;

    cursor c_qtd_alunos_gra is
           select CC.CD_CENTRO_CUSTO_EBS, CC.DS_CENTRO_CUSTO,COUNT(*) as v_qtd_alunos_gra
             from   CA.ALUNO A
                  , CA.CURSO C
                  , AL.CENTRO_CUSTO CC
           where C.CD_CURSO = A.CURSO_ATUAL
             and A.ST_ACADEMICA IN ('C','T')
             and CC.CD_CENTRO_CUSTO=C.CD_CENTRO_CUSTO
        group by CC.CD_CENTRO_CUSTO_EBS, CC.DS_CENTRO_CUSTO;

    cursor c_frequencia is
      select cc.cd_centro_custo_ebs, cc.ds_centro_custo, count(*) v_qtd_alunos_gra
        from  (  select distinct nr_matricula from ca.frequencia where nr_mes = v_nr_mes_fre
                 union
                 select distinct nr_matricula from ca.FREQUENCIA_ESPECIAL e where e.nr_mes = v_nr_mes_fre
                 union
                 (
                  select h.nr_matricula from ca.historico h
                   where h.periodo       =  ca.f_calcula_periodo(p_dt_desejada => v_dt_folha_fre,p_tipo => 4)    
                     and h.cd_disciplina = 'H999'
                     and h.NR_MATRICULA  IN (select P.NR_MATRICULA from sa.processo P 
                                              WHERE P.CD_PROX_PERIODO          =  h.periodo 
                                                and to_char(P.DT_FINAL,'MM')   <=  v_nr_mes_fre 
                                                and ca.f_calcula_periodo(
                                                    p_dt_desejada =>  
                                                    P.DT_FINAL,p_tipo => 4)    =  h.periodo
                                                AND P.CD_REQUERIMENTO          IN (162,163,165)
                                                AND P.ST_REQUERIMENTO          =  2 --PROCESSO DEFERIDO
                                            ) 
                 )      
              ) f
              join ca.aluno a         on a.nr_matricula=f.nr_matricula 
              join ca.curso c         on c.cd_curso = a.curso_atual
              join al.centro_custo cc on cc.cd_centro_custo = c.cd_centro_custo
        where 1=1
          and ca.f_calcula_periodo(p_dt_desejada => v_dt_folha_fre,p_tipo => 4) = ca.f_calcula_periodo(p_dt_desejada => sysdate,p_tipo => 4)                     
      group by cc.cd_centro_custo_ebs, cc.ds_centro_custo;

    cursor c_historico_frequencia is
           select cc.cd_centro_custo_ebs, cc.ds_centro_custo, count(*) v_qtd_alunos_gra
             from (select distinct nr_matricula 
                   from (
                          select nr_matricula from ca.hist_frequencia where cd_periodo = v_semestre and nr_mes = v_nr_mes_fre
                           union 
                          select nr_matricula from CA.HIST_FREQUENCIA_ESPECIAL fe  
                            inner join ca.periodo_especial pe on pe.CD_PERIODO = fe.CD_PERIODO
                            where pe.CD_PERIODO_HISTORICO=v_semestre 
                            --and tp_periodo = 'I' 
                            and fe.NR_MES=v_nr_mes_fre
                           union
                           --ainda estão cursando, não estão em históricos
                          select distinct f.nr_matricula --, c.CD_CURSO, f.cd_periodo, pe.dt_fim_periodo
                            from (select e.* from ca.FREQUENCIA_ESPECIAL  e where e.nr_mes = v_nr_mes_fre) f
                            join ca.aluno a on a.nr_matricula=f.nr_matricula --and a.st_academica in ('C','T')
                            join ca.curso c on c.cd_curso = a.curso_atual
                            join al.centro_custo cc on cc.cd_centro_custo = c.cd_centro_custo
                            join CA.PERIODO_ESPECIAL pe on pe.CD_PERIODO = f.cd_periodo
                           where cd_curso = 70 and pe.dt_fim_periodo >= sysdate
                           union
                           (                     
                              select h.nr_matricula from ca.historico h
                               where h.periodo       =  ca.f_calcula_periodo(p_dt_desejada => v_dt_folha_fre,p_tipo => 4)    
                                 and h.cd_disciplina = 'H999'
                                 and h.NR_MATRICULA  IN (select P.NR_MATRICULA from sa.processo P 
                                                          WHERE P.CD_PROX_PERIODO          =  h.periodo 
                                                            and to_char(P.DT_FINAL,'MM')   <=  v_nr_mes_fre 
                                                            and ca.f_calcula_periodo(
                                                                p_dt_desejada =>  
                                                                P.DT_FINAL,p_tipo => 4)    =  h.periodo
                                                            AND P.CD_REQUERIMENTO          IN (162,163,165)
                                                            AND P.ST_REQUERIMENTO          =  2
                                                        ) --PROCESSO DEFERIDO 
                           )                     
                        )
                  ) hf
             join ca.aluno a on a.nr_matricula=hf.nr_matricula --and a.st_academica in ('C','T')
             join ca.curso c on c.cd_curso = a.curso_atual
             join al.centro_custo cc on cc.cd_centro_custo = c.cd_centro_custo
         group by cc.cd_centro_custo_ebs, cc.ds_centro_custo;

    cursor c_qtd_alunos_pos is
           select cc.cd_centro_custo_ebs as cd_centro_custo_ebs, cc.ds_centro_custo,count(*) as v_qtd_alunos_pos
             from pg.aluno a,
                  --pg.d_st_academica sta,
                  pg.curso c,
                  al.centro_custo cc,
                  pg.turma t
            where a.st_academica in (0,4)
              --and a.st_academica = sta.st_academica
              and a.nr_curso = c.nr_curso
              and c.nr_custo = cc.cd_centro_custo
              and t.nr_turma = a.nr_turma
              and t.nr_curso = a.nr_curso
              and ((t.dt_inicio_curso <= v_dt_fim_semestre and t.dt_termino_curso >= v_dt_inicio_semestre and c.TP_CURSO <> '2') or
                   (c.TP_CURSO = '2'))
          group by cc.cd_centro_custo_ebs,cc.ds_centro_custo;

    cursor c_his_alunos_pos is
           select cc.cd_centro_custo_ebs, cc.ds_centro_custo, sum(a.qtd)  as v_qtd_alunos_pos
             from  (select z.curso tp_curso,
                       z.nr_curso,
                       substr(z.anomes,1,4) ano,
                       substr(z.anomes,5,2) mes,
                       sum(z.qtd_aluno) qtd
                from (select distinct b.tp_curso Curso, a.nr_curso, a.nr_matricula,
                             to_char(c.dt_carnet,'YYYYMM') ANOMES,
                             1 qtd_aluno
                      from   pg.aluno a, pg.curso b, fi.vencimento c, fi.parcela d
                      where  b.nr_curso = a.nr_curso
                        and  b.tp_curso in(1,2,3,4,5,6)
                        and  c.nr_curso     = d.nr_curso
                        and  c.nr_turma     = d.nr_turma
                        and  d.nr_matricula = a.nr_matricula
                        and  d.nr_ano       = c.nr_ano
                        and  d.nr_semestre  = c.nr_semestre
                        and  d.nr_parcela   = c.nr_parcela
                        and to_char(c.dt_carnet,'mm') = v_nr_mes_ebs
                        and to_char(c.dt_carnet,'yy') = v_nr_ano_ebs
                       group by b.tp_curso, a.nr_curso, a.nr_matricula, to_char(c.dt_carnet,'YYYYMM')
                       order by b.tp_curso, a.nr_curso, to_char(c.dt_carnet,'YYYYMM')) z
                       group by z.curso, z.nr_curso, substr(z.anomes,1,4), substr(z.anomes,5,2)) a,
                       pg.curso b,
                       ca.d_pg_tipo_curso c,
                       al.centro_custo cc

            where b.nr_curso         = a.nr_curso
              and a.tp_curso         = c.tp_curso
              and cc.cd_centro_custo = b.nr_custo

         group by cc.cd_centro_custo_ebs, cc.ds_centro_custo
         order by cc.cd_centro_custo_ebs, cc.ds_centro_custo;

    cursor c_ler_estrutura is
           select eoe.cd_indicador_un_negocio,eoe.nr_nivel,eoe.id_estrutura_org_pai_ex,eoe.id_estrutura_org_ex
             from ca.dre_estrutura_org_ex eoe
            where eoe.cd_indicador_un_negocio in ('1','2')
              and eoe.nr_ano = p_nr_ano
              and eoe.nr_mes = p_nr_mes
         order by eoe.cd_indicador_un_negocio,eoe.nr_nivel desc,eoe.id_estrutura_org_pai_ex,eoe.id_estrutura_org_ex;

    cursor c_ler_grade_aluno_gra is
           select eoe.cd_indicador_un_negocio,eoe.nr_nivel,eoe.id_estrutura_org_ex,eoe.id_estrutura_org_pai_ex,
                  ga.qt_alunos,ga.id_grade_alunos
             from ca.dre_estrutura_org_ex eoe, ca.dre_grade_alunos ga
            where (eoe.cd_indicador_un_negocio in ('1','2') or eoe.cd_indicador_un_negocio is null)
              and eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex
              and eoe.nr_ano = ga.nr_ano
              and eoe.nr_mes = ga.nr_mes
         order by eoe.cd_indicador_un_negocio,eoe.nr_nivel,eoe.id_estrutura_org_ex;

    cursor c_ler_grade_aluno_pos is
           select eoe.id_estrutura_org_ex,eoe.nr_nivel,ga.qt_alunos,ga.id_grade_alunos
             from ca.dre_estrutura_org_ex eoe, ca.dre_grade_alunos ga
            where eoe.cd_indicador_un_negocio = '2'
              and eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex
              and eoe.nr_ano = ga.nr_ano
              and eoe.nr_mes = ga.nr_mes
         order by eoe.id_estrutura_org_ex;

    cursor c_copia_grade_aluno is
           select *
             from ca.dre_grade_alunos
            where nr_mes = v_nr_mes_par
              and nr_ano = v_nr_ano_par;

    cursor c_percentual_org_pai is
           select eoe.id_estrutura_org_pai_ex,sum(ga.vl_percentual) vl_percentual
             from ca.dre_estrutura_org_ex eoe, ca.dre_grade_alunos ga
            where eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex
              and eoe.nr_ano = ga.nr_ano
              and eoe.nr_mes = ga.nr_mes
         group by eoe.id_estrutura_org_pai_ex
         order by eoe.id_estrutura_org_pai_ex;

    qag             c_qtd_alunos_gra%ROWTYPE;
    gag             c_ler_grade_aluno_gra%ROWTYPE;
    qap             c_qtd_alunos_pos%ROWTYPE;
    gap             c_ler_grade_aluno_pos%ROWTYPE;
    cga             c_copia_grade_aluno%ROWTYPE;
    cle             c_ler_estrutura%ROWTYPE;
    pop             c_percentual_org_pai%ROWTYPE;
    cf              c_frequencia%ROWTYPE;
    chf             c_historico_frequencia%ROWTYPE;
    hap             c_his_alunos_pos%ROWTYPE;

    v_id_estrutura_org_ex        NUMBER   (8)    := 0;
    v_qtd_alunos_gra             NUMBER   (8)    := 0;
    v_qtd_alunos_pos             NUMBER   (8)    := 0;
    v_vl_percentual              NUMBER   (15,2) := 0;
    v_qtd_alunos_pai             NUMBER   (8)    := 0;
    v_qtd_alunos_est             NUMBER   (8)    := 0;
    v_qtd_alunos_pos_nivel       NUMBER   (8)    := 0;
    v_cd_ccusto_ebs              VARCHAR2 (30)   := NULL;
    v_tam_ccusto_ebs             NUMBER   (2)    := 0;
    v_qtd_linhas                 NUMBER   (6)    := 0;
    v_id_grade_alunos            NUMBER   (8)    := 0;
    v_id_grade_alunos_ex         NUMBER   (8)    := 0;
    v_sinal                      VARCHAR2 (1)    := NULL;
    p_id_plano_execucao          NUMBER   (8)    := 0;
    p_id_controle_execucao       NUMBER   (8)    := 0;
    p_ds_msg                     VARCHAR2 (500)  := NULL;
    p_tp_mensagem                VARCHAR2 (1)    := NULL;
    p_status                     VARCHAR2 (1)    := NULL;

BEGIN

   BEGIN
      -- Busca código do plano de execução --
      select id_plano_execucao
        into p_id_plano_execucao
        from ca.dre_plano_execucao
       where nm_procedure = 'P_CRIA_GRADE_ALUNO';


      s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                     p_nr_mes,
                                                     p_id_plano_execucao,
                                                     p_cd_estabelecimento,
                                                     p_nr_registro,
                                                     p_id_controle_execucao);

      p_status := 1;

   -- Verificar se é o mês de janeiro e julho, período de matrículas, não há como elaborar uma grade
   --IF (p_nr_mes <> 1 and p_nr_mes <> 7) THEN
      v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
      v_nr_ano_ebs := substr(v_nr_ano,3,2);
      v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
      v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;
      IF (p_nr_mes >= 1 and p_nr_mes <= 6) THEN
          v_dt_inicio_semestre := '01/01/' || substr(extract(year from sysdate),3,2);
          v_dt_fim_semestre := '30/06/' || substr(extract(year from sysdate),3,2);
      END IF;
      IF (p_nr_mes >= 7 and p_nr_mes <= 12) THEN
          v_dt_inicio_semestre := '01/07/' || substr(extract(year from sysdate),3,2);
          v_dt_fim_semestre := '31/12/' || substr(extract(year from sysdate),3,2);
      END IF;

      v_nr_mes_atu := to_char(substr(sysdate,4,2));
      v_nr_ano_atu := to_char(substr(sysdate,7,2));

      v_dt_folha_fre := v_dt_folha;
      v_nr_mes_fre := p_nr_mes;
      IF (p_nr_mes = 1) THEN
          v_dt_folha_fre := To_Date( '01/12/' || substr(trim(to_char(p_nr_ano - 1,'9999')),3,2),'dd/mm/yy');
          v_nr_mes_fre := 12;
      END IF;

      IF (p_nr_mes = 7) THEN
          v_dt_folha_fre := To_Date( '01/' ||trim(to_char(p_nr_mes - 1,'00'))||'/'||substr(trim(to_char(p_nr_ano,'9999')),3,2),'dd/mm/yy');
          v_nr_mes_fre := p_nr_mes - 1;
      END IF;
      --Devido a paralização das aulas Covd-19
      IF (p_nr_mes IN (3,4,5,6) AND p_nr_ano = 2020 ) THEN
          v_dt_folha_fre := To_Date( '01/' ||trim(to_char(2,'00'))||'/'||substr(trim(to_char(2020,'9999')),3,2),'dd/mm/yy');
          v_nr_mes_fre := 2;
      END IF;

      v_qtd_linhas := 0;
      p_ds_msg := 'Obter quantidade de alunos de graduação por curso.';
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

      IF (v_nr_mes_ebs = v_nr_mes_atu and v_nr_ano_ebs = v_nr_ano_atu and v_nr_mes_ebs <> '07' and v_nr_mes_ebs <> '01') THEN
          -- Obter quantidade de alunos de graduação por curso
          OPEN c_qtd_alunos_gra;

          LOOP
             FETCH c_qtd_alunos_gra INTO qag;

             EXIT WHEN c_qtd_alunos_gra%NOTFOUND;

             IF  c_qtd_alunos_gra%FOUND THEN
                 --Identificar estrutura organizacional da DRE que corresponde ao centro de custo do EBS
                 v_cd_ccusto_ebs  := qag.cd_centro_custo_ebs;
                 v_id_estrutura_org_ex := 0;
                 v_vl_percentual := 0;

                 BEGIN
                     select eo.id_estrutura_org_ex
                       into v_id_estrutura_org_ex
                       from ca.dre_estrutura_org_ex eo,
                            ca.dre_estrutura_org_itens_ex eoi
                      where eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                        and eoi.cd_centro_custo_ebs = v_cd_ccusto_ebs
                        and eo.nr_ano = p_nr_ano
                        and eo.nr_mes = p_nr_mes;
                 EXCEPTION
                      when no_data_found then
                          p_ds_msg:= 'Centro de Custo não esta cadastrado no organograma: ' || qag.cd_centro_custo_ebs;
                          p_tp_mensagem := 'A';
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                 END;

                 IF ( v_id_estrutura_org_ex <> 0) THEN
                    -- Verifica se existe estrutura na grade
                    v_id_grade_alunos_ex := 0;
                    BEGIN
                        select id_grade_alunos
                           into v_id_grade_alunos_ex
                           from ca.dre_grade_alunos ga
                          where ga.id_estrutura_org_ex = v_id_estrutura_org_ex
                            and ga.nr_mes = p_nr_mes
                            and ga.nr_ano = p_nr_ano;
                    EXCEPTION
                         when no_data_found then
                              BEGIN
                                  v_qtd_linhas := v_qtd_linhas + 1;
                                  INSERT INTO ca.dre_grade_alunos
                                              (ID_GRADE_ALUNOS,
                                               ID_ESTRUTURA_ORG_EX,
                                               QT_ALUNOS,
                                               VL_PERCENTUAL,
                                               NR_MES,
                                               NR_ANO
                                              )
                                       VALUES (ca.sq_dre_grade_alunos.nextval,
                                               v_id_estrutura_org_ex,
                                               nvl(qag.v_qtd_alunos_gra,0),
                                               v_vl_percentual,
                                               p_nr_mes,
                                               p_nr_ano
                                             );
                              EXCEPTION
                                    WHEN OTHERS THEN
                                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                                         p_tp_mensagem := 'A';
                                         --p_status := 2;
                                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                              END;
                    END;
                    IF (v_id_grade_alunos_ex <> 0) THEN
                        update ca.dre_grade_alunos
                           set qt_alunos = qt_alunos + qag.v_qtd_alunos_gra
                          where id_grade_alunos = v_id_grade_alunos_ex
                            and nr_mes = p_nr_mes
                            and nr_ano = p_nr_ano;
                        v_qtd_linhas := v_qtd_linhas + 1;
                    END IF;
                 END IF;
             END IF;
          END LOOP;

          CLOSE c_qtd_alunos_gra;
          commit;
      ELSE
          -- Busca semestre --
          BEGIN
              select ca.f_calcula_periodo(p_dt_desejada => v_dt_folha_fre,p_tipo => 4)
                into v_semestre
                from dual;
          EXCEPTION
              WHEN OTHERS THEN
                   p_ds_msg := 'Mensagem: ' || sqlerrm;
                   p_tp_mensagem := 'A';
                   --p_status := 2;
                   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
          END;

          -- Obter quantidade de alunos de graduação por curso da tabela de frequencia

          OPEN c_frequencia;

          LOOP
             FETCH c_frequencia INTO cf;

             EXIT WHEN c_frequencia%NOTFOUND;

             IF  c_frequencia%FOUND THEN
                 --Identificar estrutura organizacional da DRE que corresponde ao centro de custo do EBS
                 v_cd_ccusto_ebs  := cf.cd_centro_custo_ebs;
                 v_id_estrutura_org_ex := 0;
                 v_vl_percentual := 0;

                 BEGIN
                     select eo.id_estrutura_org_ex
                       into v_id_estrutura_org_ex
                       from ca.dre_estrutura_org_ex eo,
                            ca.dre_estrutura_org_itens_ex eoi
                      where eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                        and eoi.cd_centro_custo_ebs = v_cd_ccusto_ebs
                        and eo.nr_ano = p_nr_ano
                        and eo.nr_mes = p_nr_mes;
                 EXCEPTION
                      when no_data_found then
                          p_ds_msg:= 'Centro de Custo não esta cadastrado no organograma: ' || qag.cd_centro_custo_ebs;
                          p_tp_mensagem := 'A';
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                 END;

                 IF ( v_id_estrutura_org_ex <> 0) THEN
                    -- Verifica se existe estrutura na grade
                    v_id_grade_alunos_ex := 0;
                    BEGIN
                        select id_grade_alunos
                           into v_id_grade_alunos_ex
                           from ca.dre_grade_alunos ga
                          where ga.id_estrutura_org_ex = v_id_estrutura_org_ex
                            and ga.nr_mes = p_nr_mes
                            and ga.nr_ano = p_nr_ano;
                    EXCEPTION
                         when no_data_found then
                              BEGIN
                                  v_qtd_linhas := v_qtd_linhas + 1;
                                  INSERT INTO ca.dre_grade_alunos
                                              (ID_GRADE_ALUNOS,
                                               ID_ESTRUTURA_ORG_EX,
                                               QT_ALUNOS,
                                               VL_PERCENTUAL,
                                               NR_MES,
                                               NR_ANO
                                              )
                                       VALUES (ca.sq_dre_grade_alunos.nextval,
                                               v_id_estrutura_org_ex,
                                               nvl(cf.v_qtd_alunos_gra,0),
                                               v_vl_percentual,
                                               p_nr_mes,
                                               p_nr_ano
                                             );
                              EXCEPTION
                                    WHEN OTHERS THEN
                                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                                         p_tp_mensagem := 'A';
                                         --p_status := 2;
                                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                              END;
                    END;
                    IF (v_id_grade_alunos_ex <> 0) THEN
                        update ca.dre_grade_alunos
                           set qt_alunos = qt_alunos + cf.v_qtd_alunos_gra
                          where id_grade_alunos = v_id_grade_alunos_ex
                            and nr_mes = p_nr_mes
                            and nr_ano = p_nr_ano;
                        v_qtd_linhas := v_qtd_linhas + 1;
                    END IF;
                 END IF;
             END IF;
          END LOOP;

          CLOSE c_frequencia;
          commit;

          IF (v_qtd_linhas = 0) THEN
              -- Obter quantidade de alunos de graduação por curso da tabela de frequencia
              OPEN c_historico_frequencia;

              LOOP
                 FETCH c_historico_frequencia INTO chf;

                 EXIT WHEN c_historico_frequencia%NOTFOUND;

                 IF  c_historico_frequencia%FOUND THEN
                     --Identificar estrutura organizacional da DRE que corresponde ao centro de custo do EBS
                     v_cd_ccusto_ebs  := chf.cd_centro_custo_ebs;
                     v_id_estrutura_org_ex := 0;
                     v_vl_percentual := 0;

                     BEGIN
                         select eo.id_estrutura_org_ex
                           into v_id_estrutura_org_ex
                           from ca.dre_estrutura_org_ex eo,
                                ca.dre_estrutura_org_itens_ex eoi
                          where eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                            and eoi.cd_centro_custo_ebs = v_cd_ccusto_ebs
                            and eo.nr_ano = p_nr_ano
                            and eo.nr_mes = p_nr_mes;
                     EXCEPTION
                          when no_data_found then
                              p_ds_msg:= 'Centro de Custo não esta cadastrado no organograma: ' || qag.cd_centro_custo_ebs;
                              p_tp_mensagem := 'A';
                              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     IF ( v_id_estrutura_org_ex <> 0) THEN
                        -- Verifica se existe estrutura na grade
                        v_id_grade_alunos_ex := 0;
                        BEGIN
                            select id_grade_alunos
                               into v_id_grade_alunos_ex
                               from ca.dre_grade_alunos ga
                              where ga.id_estrutura_org_ex = v_id_estrutura_org_ex
                                and ga.nr_mes = p_nr_mes
                                and ga.nr_ano = p_nr_ano;
                        EXCEPTION
                             when no_data_found then
                                  BEGIN
                                      v_qtd_linhas := v_qtd_linhas + 1;
                                      INSERT INTO ca.dre_grade_alunos
                                                  (ID_GRADE_ALUNOS,
                                                   ID_ESTRUTURA_ORG_EX,
                                                   QT_ALUNOS,
                                                   VL_PERCENTUAL,
                                                   NR_MES,
                                                   NR_ANO
                                                  )
                                           VALUES (ca.sq_dre_grade_alunos.nextval,
                                                   v_id_estrutura_org_ex,
                                                   nvl(chf.v_qtd_alunos_gra,0),
                                                   v_vl_percentual,
                                                   p_nr_mes,
                                                   p_nr_ano
                                                 );
                                  EXCEPTION
                                        WHEN OTHERS THEN
                                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                                             p_tp_mensagem := 'A';
                                             --p_status := 2;
                                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                                  END;
                        END;
                        IF (v_id_grade_alunos_ex <> 0) THEN
                            update ca.dre_grade_alunos
                               set qt_alunos = qt_alunos + chf.v_qtd_alunos_gra
                              where id_grade_alunos = v_id_grade_alunos_ex
                                and nr_mes = p_nr_mes
                                and nr_ano = p_nr_ano;
                            v_qtd_linhas := v_qtd_linhas + 1;
                        END IF;
                     END IF;
                 END IF;
              END LOOP;

              CLOSE c_historico_frequencia;
              commit;
          END IF;
      END IF;

      IF v_qtd_linhas = 0 THEN
         p_ds_msg:= 'Não foi incluída quantidades de alunos de graduação por curso do ano ' || p_nr_ano || ' mês ' ||
                    p_nr_mes || '. Mensagem: ' || sqlerrm;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      ELSE
         p_ds_msg:= 'Total de linhas incluídas de quantidades de alunos de graduação por curso ' || v_qtd_linhas;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      END IF;


      v_qtd_linhas := 0;
      -- Obter quantidade de alunos de pós-graduação por curso
      p_ds_msg := 'Obter quantidade de alunos de pós-graduação por curso.';
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

    /*
      IF (v_nr_mes_ebs = v_nr_mes_atu and v_nr_ano_ebs = v_nr_ano_atu and v_nr_mes_ebs <> '07' and v_nr_mes_ebs <> '01') THEN

          OPEN c_qtd_alunos_pos;

          LOOP
             FETCH c_qtd_alunos_pos INTO qap;

             EXIT WHEN c_qtd_alunos_pos%NOTFOUND;

             IF  c_qtd_alunos_pos%FOUND THEN
                 -- Identificar estrutura organizacional da DRE que corresponde ao centro de custo do EBS
                 v_cd_ccusto_ebs  := qap.cd_centro_custo_ebs;
                 v_id_estrutura_org_ex := 0;
                 v_vl_percentual := 0;
                 BEGIN
                     select eo.id_estrutura_org_ex
                       into v_id_estrutura_org_ex
                       from ca.dre_estrutura_org_ex eo,
                            ca.dre_estrutura_org_itens_ex eoi
                      where eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                        and eoi.cd_centro_custo_ebs = v_cd_ccusto_ebs
                        and eo.nr_ano = p_nr_ano
                        and eo.nr_mes = p_nr_mes;
                 EXCEPTION
                        when no_data_found then
                            p_ds_msg:= 'Centro de Custo não esta cadastrado no organograma: ' || qap.cd_centro_custo_ebs;
                            p_tp_mensagem := 'A';
                            s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                 END;

                 IF ( v_id_estrutura_org_ex <> 0) THEN
                    -- Verifica se existe estrutura na grade
                    v_id_grade_alunos_ex := 0;
                    BEGIN
                        select id_grade_alunos
                           into v_id_grade_alunos_ex
                           from ca.dre_grade_alunos ga
                          where ga.id_estrutura_org_ex = v_id_estrutura_org_ex
                            and ga.nr_mes = p_nr_mes
                            and ga.nr_ano = p_nr_ano;
                    EXCEPTION
                         when no_data_found then
                              BEGIN
                                  v_qtd_linhas := v_qtd_linhas + 1;
                                  INSERT INTO ca.dre_grade_alunos
                                              (ID_GRADE_ALUNOS,
                                               ID_ESTRUTURA_ORG_EX,
                                               QT_ALUNOS,
                                               VL_PERCENTUAL,
                                               NR_MES,
                                               NR_ANO
                                              )
                                       VALUES (ca.sq_dre_grade_alunos.nextval,
                                               v_id_estrutura_org_ex,
                                               qap.v_qtd_alunos_pos,
                                               v_vl_percentual,
                                               p_nr_mes,
                                               p_nr_ano
                                             );

                              EXCEPTION
                                    WHEN OTHERS THEN
                                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                                         p_tp_mensagem := 'E';
                                         p_status := 2;
                                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                              END;
                    END;
                    IF (v_id_grade_alunos_ex <> 0) THEN
                        update ca.dre_grade_alunos
                           set qt_alunos = qt_alunos + qap.v_qtd_alunos_pos
                          where id_grade_alunos = v_id_grade_alunos_ex
                            and nr_mes = p_nr_mes
                            and nr_ano = p_nr_ano;
                        v_qtd_linhas := v_qtd_linhas + 1;
                    END IF;
                 END IF;
             END IF;
           END LOOP;

           CLOSE c_qtd_alunos_pos;
           commit;

      ELSE
      */
          OPEN c_his_alunos_pos;

          LOOP
             FETCH c_his_alunos_pos INTO hap;

             EXIT WHEN c_his_alunos_pos%NOTFOUND;

             IF  c_his_alunos_pos%FOUND THEN
                 -- Identificar estrutura organizacional da DRE que corresponde ao centro de custo do EBS
                 v_cd_ccusto_ebs  := hap.cd_centro_custo_ebs;
                 v_id_estrutura_org_ex := 0;
                 v_vl_percentual := 0;
                 BEGIN
                     select eo.id_estrutura_org_ex
                       into v_id_estrutura_org_ex
                       from ca.dre_estrutura_org_ex eo,
                            ca.dre_estrutura_org_itens_ex eoi
                      where eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                        and eoi.cd_centro_custo_ebs = v_cd_ccusto_ebs
                        and eo.nr_ano = p_nr_ano
                        and eo.nr_mes = p_nr_mes;
                 EXCEPTION
                        when no_data_found then
                            p_ds_msg:= 'Centro de Custo não esta cadastrado no organograma: ' || qap.cd_centro_custo_ebs;
                            p_tp_mensagem := 'A';
                            s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                 END;

                 IF ( v_id_estrutura_org_ex <> 0) THEN
                    -- Verifica se existe estrutura na grade
                    v_id_grade_alunos_ex := 0;
                    BEGIN
                        select id_grade_alunos
                           into v_id_grade_alunos_ex
                           from ca.dre_grade_alunos ga
                          where ga.id_estrutura_org_ex = v_id_estrutura_org_ex
                            and ga.nr_mes = p_nr_mes
                            and ga.nr_ano = p_nr_ano;
                    EXCEPTION
                         when no_data_found then
                              BEGIN
                                  v_qtd_linhas := v_qtd_linhas + 1;
                                  INSERT INTO ca.dre_grade_alunos
                                              (ID_GRADE_ALUNOS,
                                               ID_ESTRUTURA_ORG_EX,
                                               QT_ALUNOS,
                                               VL_PERCENTUAL,
                                               NR_MES,
                                               NR_ANO
                                              )
                                       VALUES (ca.sq_dre_grade_alunos.nextval,
                                               v_id_estrutura_org_ex,
                                               nvl(hap.v_qtd_alunos_pos,0),
                                               v_vl_percentual,
                                               p_nr_mes,
                                               p_nr_ano
                                             );

                              EXCEPTION
                                    WHEN OTHERS THEN
                                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                                         p_tp_mensagem := 'A';
                                         --p_status := 2;
                                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                              END;
                    END;
                    IF (v_id_grade_alunos_ex <> 0) THEN
                        update ca.dre_grade_alunos
                           set qt_alunos = qt_alunos + hap.v_qtd_alunos_pos
                          where id_grade_alunos = v_id_grade_alunos_ex
                            and nr_mes = p_nr_mes
                            and nr_ano = p_nr_ano;
                        v_qtd_linhas := v_qtd_linhas + 1;
                    END IF;
                 END IF;
             END IF;
           END LOOP;

           CLOSE c_his_alunos_pos;
           commit;
      /*
      END IF; */

       IF v_qtd_linhas = 0 THEN
          p_ds_msg:= 'Não foi incluída as quantidades de alunos de pós-graduação por curso do ano ' || p_nr_ano || ' mês ' ||
                      p_nr_mes || '. Mensagem: ' || sqlerrm;
          p_tp_mensagem := 'A';
          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
       ELSE
          p_ds_msg:= 'Total de linhas incluídas de quantidades de alunos de pós-graduação por curso ' || v_qtd_linhas;
          p_tp_mensagem := 'A';
          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
       END IF;

      v_qtd_linhas := 0;
      -- Totalizar por nível da gradução e pós-gradução.
      p_ds_msg := 'Totalizar por nível da gradução e pós-gradução.';
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

      OPEN c_ler_estrutura;

      LOOP
         FETCH c_ler_estrutura INTO cle;

         EXIT WHEN c_ler_estrutura%NOTFOUND;

         IF  c_ler_estrutura%FOUND THEN
             v_qtd_alunos_est := 0;
             v_vl_percentual := 0;

             BEGIN
                 select sum(ga.qt_alunos)
                   into v_qtd_alunos_est
                   from ca.dre_grade_alunos ga
                  where ga.id_estrutura_org_ex = cle.id_estrutura_org_ex
                    and ga.nr_mes = p_nr_mes
                    and ga.nr_ano = p_nr_ano;
             EXCEPTION
                 when no_data_found then
                      p_ds_msg:= 'Estrutura do organograma não encontrada ' || cle.id_estrutura_org_ex;
                      p_tp_mensagem := 'A';
                      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

             END;

             IF (v_qtd_alunos_est <> 0) THEN
                 v_id_grade_alunos := 0;
                 BEGIN
                     select ga.id_grade_alunos
                       into v_id_grade_alunos
                       from ca.dre_grade_alunos ga
                      where id_estrutura_org_ex = cle.id_estrutura_org_pai_ex
                        and ga.nr_mes = p_nr_mes
                        and ga.nr_ano = p_nr_ano;
                 EXCEPTION
                     when no_data_found then
                     BEGIN
                        v_qtd_linhas := v_qtd_linhas + 1;
                        INSERT INTO ca.dre_grade_alunos
                                    (ID_GRADE_ALUNOS,
                                     ID_ESTRUTURA_ORG_EX,
                                     QT_ALUNOS,
                                     VL_PERCENTUAL,
                                     NR_MES,
                                     NR_ANO
                                    )
                             VALUES (ca.sq_dre_grade_alunos.nextval,
                                     cle.id_estrutura_org_pai_ex,
                                     nvl(v_qtd_alunos_est,0),
                                     v_vl_percentual,
                                     p_nr_mes,
                                     p_nr_ano
                                   );

                     EXCEPTION
                             WHEN OTHERS THEN
                                p_ds_msg := 'Mensagem: ' || sqlerrm;
                                p_tp_mensagem := 'A';
                                --p_status := 2;
                                s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;
                 END;

                 IF (v_id_grade_alunos <> 0) THEN
                     update ca.dre_grade_alunos
                       set qt_alunos = qt_alunos + v_qtd_alunos_est
                      where id_grade_alunos = v_id_grade_alunos
                        and nr_mes = p_nr_mes
                        and nr_ano = p_nr_ano;
                     v_qtd_linhas := v_qtd_linhas + 1;
                 END IF;
                 commit;
             END IF;
         END IF;
      END LOOP;

      CLOSE c_ler_estrutura;
      --commit;

      IF v_qtd_linhas = 0 THEN
         p_ds_msg:= 'Não houve totalização por nível no ano ' || p_nr_ano || ' mês ' ||
                               p_nr_mes || '. Mensagem: ' || sqlerrm;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      ELSE
         p_ds_msg:= 'Total de linhas por nível ' || v_qtd_linhas;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      END IF;

      v_qtd_linhas := 0;
      -- Calcular percentuais da grade de alunos, em relação ao total do pai
      p_ds_msg := 'Calcular percentuais da grade de alunos, em relação ao total do pai.';
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

      OPEN c_ler_grade_aluno_gra;

      LOOP
         FETCH c_ler_grade_aluno_gra INTO gag;

         EXIT WHEN c_ler_grade_aluno_gra%NOTFOUND;

         IF  c_ler_grade_aluno_gra%FOUND THEN
             v_qtd_alunos_pai := 0;

             IF gag.id_estrutura_org_pai_ex is not null THEN
                 BEGIN
                     select sum(ga.qt_alunos) --,count(*)
                       into v_qtd_alunos_pai --, v_qtd_linhas_cursor
                       from ca.dre_estrutura_org_ex eoe, ca.dre_grade_alunos ga
                      where eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex
                        and eoe.id_estrutura_org_ex = gag.id_estrutura_org_pai_ex
                        and eoe.nr_ano = p_nr_ano
                        and eoe.nr_mes = p_nr_mes;
                 EXCEPTION
                     when no_data_found then
                     p_ds_msg:= 'Quantidade de alunos do pai para a estrutura ' || gag.id_estrutura_org_ex || ' não encontrado.';
                     p_tp_mensagem := 'A';
                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

                 END;
             ELSE
                v_qtd_alunos_pai := gag.qt_alunos;
             END IF;

             IF (v_qtd_alunos_pai <> 0) THEN
                 v_vl_percentual := gag.qt_alunos / v_qtd_alunos_pai * 100;
                 BEGIN
                     update ca.dre_grade_alunos
                        set vl_percentual = v_vl_percentual
                      where id_grade_alunos = gag.id_grade_alunos
                        and nr_mes = p_nr_mes
                        and nr_ano = p_nr_ano;
                      v_qtd_linhas := v_qtd_linhas + 1;
                 EXCEPTION
                    WHEN OTHERS THEN
                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                         p_tp_mensagem := 'A';
                         --p_status := 2;
                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                 END;
             END IF;
          END IF;
      END LOOP;

      CLOSE c_ler_grade_aluno_gra;
      commit;

      IF v_qtd_linhas = 0 THEN
         p_ds_msg:= 'Percentuais da grade de alunos não calculados no ano ' || p_nr_ano || ' mês ' ||
                               p_nr_mes || '. Mensagem: ' || sqlerrm;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      ELSE
         p_ds_msg:= 'Total de linhas calculadas dos percentuais da grade de alunos' || v_qtd_linhas;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      END IF;

      v_qtd_linhas := 0;
      -- Atualizar percentuais da grade de alunos, em relação ao total do pai
      p_ds_msg := 'Atualizar percentuais da grade de alunos, em relação ao total do pai.';
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

      OPEN c_percentual_org_pai;

      LOOP
         FETCH c_percentual_org_pai INTO pop;

         EXIT WHEN c_percentual_org_pai%NOTFOUND;

         IF  c_percentual_org_pai%FOUND THEN
             IF (pop.vl_percentual <> 100 and pop.vl_percentual <> 0) THEN
                 BEGIN
                     select max(id_grade_alunos)
                       into v_id_grade_alunos
                       from ca.dre_estrutura_org_ex eoe, ca.dre_grade_alunos ga
                      where eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex
                        and eoe.nr_ano = ga.nr_ano
                        and eoe.nr_mes = ga.nr_mes
                        and eoe.id_estrutura_org_pai_ex = pop.id_estrutura_org_pai_ex;
                 EXCEPTION
                     when no_data_found then
                     p_ds_msg:= 'Não encontrado organograma do pai na estrutura ' || pop.id_estrutura_org_pai_ex || ' não encontrado.';
                     p_tp_mensagem := 'A';
                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                 END;

                 IF (v_id_grade_alunos <> 0) THEN
                    v_vl_percentual := 0;
                    v_sinal := '';
                    IF (pop.vl_percentual < 100) THEN
                        v_vl_percentual := 100 - pop.vl_percentual;
                        v_sinal := '+';
                    END IF;
                    IF (pop.vl_percentual > 100) THEN
                        v_vl_percentual := pop.vl_percentual - 100;
                        v_sinal := '-';
                    END IF;

                    BEGIN
                         IF (v_sinal = '+') THEN
                             update ca.dre_grade_alunos
                                set vl_percentual = vl_percentual + v_vl_percentual
                              where id_grade_alunos = v_id_grade_alunos
                                and nr_mes = p_nr_mes
                                and nr_ano = p_nr_ano;
                         ELSE
                             IF (v_sinal = '-') THEN
                                  update ca.dre_grade_alunos
                                      set vl_percentual = vl_percentual - v_vl_percentual
                                    where id_grade_alunos = v_id_grade_alunos
                                      and nr_mes = p_nr_mes
                                      and nr_ano = p_nr_ano;
                             END IF;
                         END IF;
                          v_qtd_linhas := v_qtd_linhas + 1;
                    EXCEPTION
                        WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                 END IF;
             END IF;
          END IF;
      END LOOP;

      CLOSE c_percentual_org_pai;
      commit;

      IF v_qtd_linhas = 0 THEN
         p_ds_msg:= 'Atualização dos percentuais da grade de alunos não realizados no ano ' || p_nr_ano || ' mês ' ||
                               p_nr_mes || '. Mensagem: ' || sqlerrm;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      ELSE
         p_ds_msg:= 'Total de linhas atualizadas dos percentuais da grade de alunos' || v_qtd_linhas;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      END IF;
   /*
   ELSE
      v_qtd_linhas := 0;
      -- Carrega variaveis de mês e ano para os meses de janeiro e julho
      IF (p_nr_mes = 1) THEN
          v_nr_ano_par := p_nr_ano - 1;
          v_nr_mes_par := 12;
      ELSE
          v_nr_ano_par := p_nr_ano;
          v_nr_mes_par := p_nr_mes - 1;
      END IF;

      OPEN c_copia_grade_aluno;

      LOOP
          FETCH c_copia_grade_aluno INTO cga;

          EXIT WHEN c_copia_grade_aluno%NOTFOUND;

          IF  c_copia_grade_aluno%FOUND THEN
              BEGIN
                  v_qtd_linhas := v_qtd_linhas + 1;
                  INSERT INTO ca.dre_grade_alunos
                              (ID_GRADE_ALUNOS,
                               ID_ESTRUTURA_ORG_EX,
                               QT_ALUNOS,
                               VL_PERCENTUAL,
                               NR_MES,
                               NR_ANO
                              )
                       VALUES (ca.sq_dre_grade_alunos.nextval,
                               cga.id_estrutura_org_ex,
                               cga.qt_alunos,
                               cga.vl_percentual,
                               v_nr_mes_par,
                               v_nr_ano_par
                             );

                  EXCEPTION
                    WHEN OTHERS THEN
                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                         p_tp_mensagem := 'E';
                         p_status := 2;
                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;
          END IF;

      END LOOP;
      CLOSE c_copia_grade_aluno;
      commit;

      IF v_qtd_linhas = 0 THEN
         p_ds_msg:= 'Nenhum registro incluído na grade de alunos do ano ' || p_nr_ano || ' mês ' ||
                               p_nr_mes || '. Mensagem: ' || sqlerrm;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      ELSE
         p_ds_msg:= 'Total de linhas incluídas na grade de alunos ' || v_qtd_linhas;
         p_tp_mensagem := 'A';
         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
      END IF;

   */
   --END IF;

   EXCEPTION
       WHEN NO_DATA_FOUND THEN
           p_ds_msg := 'Procedure não encontarda no plano de execução.';
           p_tp_mensagem := 'E';
           p_status := 2;
           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END;

   s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_CRIA_GRADE_ALUNO;


PROCEDURE P_CRIA_GRADE_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                         p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                         p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                         p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_dt_folha                       DATE;
    v_dt_folha_fre                   DATE;
    v_nr_mes_fre                     NUMBER   (4)    := NULL;
    v_nr_mes_atu                     VARCHAR2 (2)    := NULL;
    v_nr_ano_atu                     VARCHAR2 (2)    := NULL;
    v_nr_ano                         VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                     VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                     VARCHAR2 (2)    := NULL;
    v_semestre                       NUMBER   (3)    := 0;
    v_qtd_aluno                      NUMBER   (6)    := 0;
    v_qtd_aluno_cursando             NUMBER   (6)    := 0;
    v_qtd_aluno_trancado             NUMBER   (6)    := 0;
    v_qtd_alunos_disciplina_turma    NUMBER   (6)    := 0;
    v_vl_percentual                  NUMBER   (15,2) := 0;
    v_mensagem                       VARCHAR2 (1000) := NULL;
    v_id_grade_alocacao_docente      NUMBER   (8)    := NULL;
    v_qtd_linhas                     NUMBER   (6)    := 0;
    v_id_grade_disciplina_turma      NUMBER   (8)    := NULL;
    v_vl_total                       NUMBER   (15,2) := 0;
    v_qtd_linhas_cursor              NUMBER   (6)    := 0;
    v_cd_disciplina                  VARCHAR2 (4)    := NULL;
    v_cd_turma                       NUMBER   (2)    := 0;
    v_sinal                          VARCHAR2 (1)    := NULL;
    p_id_plano_execucao              NUMBER   (8)    := 0;
    p_id_controle_execucao           NUMBER   (8)    := 0;
    p_ds_msg                         VARCHAR2 (500)  := NULL;
    p_tp_mensagem                    VARCHAR2 (1)    := NULL;
    p_status                         VARCHAR2 (1)    := NULL;

    cursor c_grade_disciplina_turma is
           select cla.cd_disciplina, cla.cd_turma, cur.cd_curso,
                  count(*) v_qtd_aluno,
                  sum(decode(cla.st_aluno,4,1,0)) v_qtd_aluno_cursando,
                  sum(decode(cla.st_aluno,7,1,0)) v_qtd_aluno_trancado
             from ca.classe cla,
                  ca.aluno alu,
                  ca.curso cur
            where alu.nr_matricula = cla.nr_matricula
              and cur.cd_curso     = alu.curso_atual
              and cla.st_aluno IN (4, 7)
              --and cla.cd_disciplina = v_cd_disciplina
              --and cla.cd_turma = v_cd_turma
         group by cla.cd_disciplina, cla.cd_turma, cur.cd_curso;

    cursor c_historico_frequencia is
           select hf.cd_disciplina, hf.cd_turma,a.curso_atual,
                  count(*) v_qtd_aluno
             from ca.hist_frequencia hf
             join ca.aluno a on a.nr_matricula=hf.nr_matricula
            where 1=1
              and hf.cd_periodo = v_semestre
              and nr_mes = v_nr_mes_fre
            group by hf.cd_disciplina, hf.cd_turma,a.curso_atual;

    cursor c_frequencia is
           select f.cd_disciplina, f.cd_turma,a.curso_atual,
                  count(*) v_qtd_aluno
             from ca.frequencia f
             join ca.aluno a on a.nr_matricula=f.nr_matricula
            where f.nr_mes = v_nr_mes_fre
              and ca.f_calcula_periodo(p_dt_desejada => v_dt_folha_fre,p_tipo => 4) = ca.f_calcula_periodo(p_dt_desejada => sysdate,p_tipo => 4)
         group by f.cd_disciplina, f.cd_turma,a.curso_atual;

    gdt             c_grade_disciplina_turma%ROWTYPE;
    chf             c_historico_frequencia%ROWTYPE;
    cf              c_frequencia%ROWTYPE;

BEGIN

   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_CRIA_GRADE_DISCIPLINA_TURMA';

   s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                  p_nr_mes,
                                                  p_id_plano_execucao,
                                                  p_cd_estabelecimento,
                                                  p_nr_registro,
                                                  p_id_controle_execucao);

   p_status := 1;

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
   v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;
   v_nr_mes_atu := to_char(substr(sysdate,4,2));
   v_nr_ano_atu := to_char(substr(sysdate,7,2));

   v_dt_folha_fre := v_dt_folha;
   v_nr_mes_fre := p_nr_mes;
   IF (p_nr_mes = 1) THEN
       v_dt_folha_fre := To_Date( '01/12/' || substr(trim(to_char(p_nr_ano - 1,'9999')),3,2),'dd/mm/yy');
       v_nr_mes_fre := 12;
   END IF;

   IF (p_nr_mes = 7) THEN
       v_dt_folha_fre := To_Date( '01/' ||trim(to_char(p_nr_mes - 1,'00'))||'/'||substr(trim(to_char(p_nr_ano,'9999')),3,2),'dd/mm/yy');
       v_nr_mes_fre := p_nr_mes - 1;
   END IF;

    --Devido a paralização das aulas Covd-19
    IF (p_nr_mes IN (3,4,5,6) AND p_nr_ano = 2020 ) THEN
        v_dt_folha_fre := To_Date( '01/' ||trim(to_char(2,'00'))||'/'||substr(trim(to_char(2020,'9999')),3,2),'dd/mm/yy');
        v_nr_mes_fre := 2;
    END IF;

   v_qtd_linhas := 0;

   p_ds_msg := 'Cria grade por disciplina turma.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

   -- Cria grade por disciplina turma e calcula os percentuais em relação ao total da disciplina turma

   IF (v_nr_mes_ebs = v_nr_mes_atu and v_nr_ano_ebs = v_nr_ano_atu and v_nr_mes_ebs <> '07' and v_nr_mes_ebs <> '01') THEN

        OPEN c_grade_disciplina_turma;

        LOOP
            FETCH c_grade_disciplina_turma INTO gdt;

            EXIT WHEN c_grade_disciplina_turma%NOTFOUND;

            IF  c_grade_disciplina_turma%FOUND THEN

                BEGIN
                    v_qtd_linhas := v_qtd_linhas + 1;
                    INSERT INTO ca.dre_grade_disciplina_turma
                                (ID_GRADE_DISCIPLINA_TURMA,
                                 DT_FOLHA,
                                 CD_DISCIPLINA,
                                 CD_TURMA,
                                 CD_CURSO,
                                 QTD_ALUNO_CURSANDO,
                                 QTD_ALUNO_TRANCADO,
                                 QTD_ALUNO,
                                 VL_PERCENTUAL,
                                 ID_GRADE_ALOCACAO_DOCENTE
                                )
                         VALUES (ca.sq_dre_grade_disciplina_turma.nextval,
                                 v_dt_folha,
                                 gdt.cd_disciplina,
                                 gdt.cd_turma,
                                 gdt.cd_curso,
                                 gdt.v_qtd_aluno_cursando,
                                 gdt.v_qtd_aluno_trancado,
                                 gdt.v_qtd_aluno,
                                 v_vl_percentual,
                                 v_id_grade_alocacao_docente
                               );
                EXCEPTION
                      WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;
                commit;
            END IF;
        END LOOP;
        CLOSE c_grade_disciplina_turma;
        commit;
   ELSE
        -- Busca semestre --
        BEGIN
            select ca.f_calcula_periodo(p_dt_desejada => v_dt_folha_fre,p_tipo => 4)
              into v_semestre
              from dual;
        EXCEPTION
            WHEN OTHERS THEN
                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                 p_tp_mensagem := 'A';
                 --p_status := 2;
                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
        END;

        OPEN c_frequencia;

          LOOP
              FETCH c_frequencia INTO cf;

              EXIT WHEN c_frequencia%NOTFOUND;

              IF  c_frequencia%FOUND THEN

                  BEGIN
                      v_qtd_linhas := v_qtd_linhas + 1;
                      INSERT INTO ca.dre_grade_disciplina_turma
                                  (ID_GRADE_DISCIPLINA_TURMA,
                                   DT_FOLHA,
                                   CD_DISCIPLINA,
                                   CD_TURMA,
                                   CD_CURSO,
                                   QTD_ALUNO_CURSANDO,
                                   QTD_ALUNO_TRANCADO,
                                   QTD_ALUNO,
                                   VL_PERCENTUAL,
                                   ID_GRADE_ALOCACAO_DOCENTE
                                  )
                           VALUES (ca.sq_dre_grade_disciplina_turma.nextval,
                                   v_dt_folha,
                                   cf.cd_disciplina,
                                   cf.cd_turma,
                                   cf.curso_atual,
                                   v_qtd_aluno_cursando,
                                   v_qtd_aluno_trancado,
                                   cf.v_qtd_aluno,
                                   v_vl_percentual,
                                   v_id_grade_alocacao_docente
                                 );
                  EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                  END;
                  commit;
              END IF;
          END LOOP;
          CLOSE c_frequencia;
          commit;

          IF (v_qtd_linhas = 0) THEN

              OPEN c_historico_frequencia;

              LOOP
                  FETCH c_historico_frequencia INTO chf;

                  EXIT WHEN c_historico_frequencia%NOTFOUND;

                  IF  c_historico_frequencia%FOUND THEN

                      BEGIN
                          v_qtd_linhas := v_qtd_linhas + 1;
                          INSERT INTO ca.dre_grade_disciplina_turma
                                      (ID_GRADE_DISCIPLINA_TURMA,
                                       DT_FOLHA,
                                       CD_DISCIPLINA,
                                       CD_TURMA,
                                       CD_CURSO,
                                       QTD_ALUNO_CURSANDO,
                                       QTD_ALUNO_TRANCADO,
                                       QTD_ALUNO,
                                       VL_PERCENTUAL,
                                       ID_GRADE_ALOCACAO_DOCENTE
                                      )
                               VALUES (ca.sq_dre_grade_disciplina_turma.nextval,
                                       v_dt_folha,
                                       chf.cd_disciplina,
                                       chf.cd_turma,
                                       chf.curso_atual,
                                       v_qtd_aluno_cursando,
                                       v_qtd_aluno_trancado,
                                       chf.v_qtd_aluno,
                                       v_vl_percentual,
                                       v_id_grade_alocacao_docente
                                     );
                      EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                      END;
                      commit;
                  END IF;
              END LOOP;
              CLOSE c_historico_frequencia;
              commit;
          END IF;
   END IF;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizada inclusão na tabela DRE_GRADE_DISCIPLINA_TURMA do ano ' || p_nr_ano || ' mês ' ||
                  p_nr_mes || '. Total de linhas: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_GRADE_DISCIPLINA_TURMA ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_CRIA_GRADE_DISCIPLINA_TURMA;

PROCEDURE P_APURA_VERBA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                         p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                         p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                         p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS
    v_dt_folha                    DATE;
    vl_docencia_mes               NUMBER   (15,2)  := 0;
    v_mensagem                    VARCHAR2 (1000)  := NULL;
    v_id_grade_verbas             NUMBER   (8)     := 0;
    v_id_grade_verbas_aux         NUMBER   (8)     := 0;
    v_id_grade_verbas_adm         NUMBER   (8)     := 0;
    v_nr_ano                      VARCHAR2 (4)     := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)     := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)     := NULL;
    v_qtd_linhas                  NUMBER   (6)     := 0;
    v_vl_docencia                 NUMBER   (15,2)  := 0;
    v_vl_adm                      NUMBER   (15,2)  := 0;
    v_vl_pos                      NUMBER   (15,2)  := 0;
    v_cd_verba                    VARCHAR2 (30)    := NULL;
    v_cd_centro_custo_ebs         VARCHAR2 (30)    := NULL;
    v_cd_centro_custo             VARCHAR2 (30)    := NULL;
    v_vl_percentual_adm           NUMBER   (15,2)  := 0;
    p_id_plano_execucao           NUMBER   (8)     := 0;
    p_id_controle_execucao        NUMBER   (8)     := 0;
    p_ds_msg                      VARCHAR2 (500)  := NULL;
    p_tp_mensagem                 VARCHAR2 (1)    := NULL;
    p_status                      VARCHAR2 (1)    := NULL;

    cursor c_grade_verba is
           select nvl((select p.cd_professor
                         from ca.professor p
                        where to_number(trim(vf.estb)) = p.cd_estabelecimento
                          and to_number(trim(vf.matricula)) = p.nr_registro),to_char('0000000')) cd_professor,
                  to_number(trim(vf.estb)) estb,
                  to_number(trim(vf.matricula)) matricula,
                  vd.cd_verba,
                  vd.tp_destino,
                  vf.valor,
                  --vf.tipo_lancto,
                  vf.centro_custo
             from ca.ebs_fp_verbas_funcionarios vf,
                  ca.dre_par_verba_destino vd
            where vf.competencia = v_dt_folha
              and ((vf.cta_contabil like '5201%') or (vf.cta_contabil like '6201%') or (vf.cta_contabil like '6401%'))
              and vf.tipo_lancto = 'DB' --and vf.tipo_lancto = 'DB'
              and trim(vd.cd_verba) = trim(vf.verba)
              and vd.tp_destino <> 0
         order by cd_professor, vf.estb,vf.matricula,vd.cd_verba,vd.tp_destino;

    cursor c_folha_verba is
           select a.*,
                  nvl((select p.cd_professor
                        from ca.professor p
                       where to_number(trim(a.estb)) = p.cd_estabelecimento
                         and to_number(trim(a.matricula)) = p.nr_registro),to_char('0000000')) cd_professor
             from (select vf.estb, vf.matricula, vf.situacao sit, vf.centro_custo,
                  sum(decode(vf.tipo_lancto,'DB', valor, -1*vf.valor)) custo  
                     from ca.ebs_fp_verbas_funcionarios vf
                    where 1=1
                      and vf.competencia = v_dt_folha
                      and ((vf.cta_contabil  like '5201%') or (vf.cta_contabil  like '6201%') or (vf.cta_contabil like '6401%'))
                 group by vf.estb, vf.matricula, vf.situacao, vf.centro_custo) a,
                  (select gv.cd_estabelecimento estb, gv.nr_registro matricula, gv.cd_professor,  gv.vl_custo custo 
                     from ca.dre_grade_verbas gv
                    where gv.dt_folha = v_dt_folha) b
            where b.estb(+)=a.estb 
              and b.matricula(+)=a.matricula
              and (nvl(a.custo,0) - nvl(b.custo,0))!=0;

    cgv             c_grade_verba%ROWTYPE;
    cfv             c_folha_verba%ROWTYPE;

BEGIN

   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_APURA_VERBA';


   s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                  p_nr_mes,
                                                  p_id_plano_execucao,
                                                  p_cd_estabelecimento,
                                                  p_nr_registro,
                                                  p_id_controle_execucao);


   p_status := 1;

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
   v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;
--    v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yyyy') ;

   v_qtd_linhas := 0;
   p_ds_msg := 'Apura as verbas folha sispro.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

   -- Apura as verbas folha sispro.

    OPEN c_grade_verba;

    LOOP
        FETCH c_grade_verba INTO cgv;

        EXIT WHEN c_grade_verba%NOTFOUND;

        IF  c_grade_verba%FOUND THEN
            v_vl_docencia := 0;
            v_vl_adm := 0;
            v_vl_pos := 0;

            -- Verifica se é uma verba de exceção --
            v_cd_verba := trim(cgv.cd_verba);
            v_cd_centro_custo_ebs := null;
            BEGIN
                select cd_centro_custo_ebs
                  into v_cd_centro_custo_ebs
                  from ca.dre_verbas_excecao
                 where cd_verba = v_cd_verba;
            EXCEPTION
                  WHEN OTHERS THEN
                       v_cd_centro_custo_ebs := null;
            END;

            IF (v_cd_centro_custo_ebs is not null) THEN
                v_vl_adm := cgv.valor;
            ELSE
                IF (cgv.cd_professor = '0000000') THEN
                    v_vl_adm := cgv.valor;
                ELSE
                    -- Graduação --
                    IF (cgv.tp_destino = 1) THEN
                        v_vl_docencia := cgv.valor;
                    END IF;
                    -- Administrativo --
                    IF (cgv.tp_destino = 2) THEN
                        v_vl_adm := cgv.valor;
                    END IF;
                    -- Pós-Graduação --
                    IF (cgv.tp_destino = 3) THEN
                        v_vl_pos := cgv.valor;
                    END IF;
                END IF;
            END IF;

            BEGIN
               v_id_grade_verbas := 0;
               v_id_grade_verbas_aux := 0;
               -- Verifica se professor ou administrativo tem verba para esse período --
               select id_grade_verbas
                 into v_id_grade_verbas
                 from ca.dre_grade_verbas
                where dt_folha = v_dt_folha
                  and cd_estabelecimento = cgv.estb
                  and nr_registro = cgv.matricula;
            EXCEPTION
                 when no_data_found then
                      BEGIN
                          v_qtd_linhas := v_qtd_linhas + 1;
                          v_id_grade_verbas_aux := ca.sq_dre_grade_verbas.nextval;
                          INSERT INTO ca.dre_grade_verbas
                                      (ID_GRADE_VERBAS,
                                       DT_FOLHA,
                                       CD_PROFESSOR,
                                       VL_DOCENCIA,
                                       VL_PERCENTUAL_DOCENCIA,
                                       VL_ADM,
                                       VL_PERCENTUAL_ADM,
                                       VL_POS,
                                       VL_PERCENTUAL_POS,
                                       VL_CUSTO,
                                       CD_ESTABELECIMENTO,
                                       NR_REGISTRO,
                                       CD_CENTRO_CUSTO_EBS
                                      )
                               VALUES (v_id_grade_verbas_aux,
                                       v_dt_folha,
                                       cgv.cd_professor,
                                       v_vl_docencia,
                                       0,
                                       v_vl_adm,
                                       0,
                                       v_vl_pos,
                                       0,
                                       0,
                                       cgv.estb,
                                       cgv.matricula,
                                       cgv.centro_custo
                                      );

                      EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                      END;
            END;

            IF (v_id_grade_verbas <> 0) THEN
                BEGIN
                    update ca.dre_grade_verbas
                       set vl_docencia = vl_docencia + v_vl_docencia,
                           vl_adm = vl_adm + v_vl_adm,
                           vl_pos = vl_pos + v_vl_pos
                     where dt_folha = v_dt_folha
                       and cd_estabelecimento = cgv.estb
                       and nr_registro = cgv.matricula;
                       v_qtd_linhas := v_qtd_linhas + 1;
                EXCEPTION
                     when others then
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;
            END IF;

            -- Grava grade de verbas adm para funcionário tecnico administrativo ou para execeção de verbas
            IF ((cgv.cd_professor = '0000000') or (v_cd_centro_custo_ebs is not null)) THEN
                IF (v_id_grade_verbas = 0 AND v_id_grade_verbas_aux <> 0) THEN
                    v_id_grade_verbas := v_id_grade_verbas_aux;
                END IF;

                v_cd_centro_custo := NULL;
                v_vl_percentual_adm := 0;
                IF (cgv.cd_professor = '0000000') THEN
                    v_cd_centro_custo := cgv.centro_custo;
                    v_vl_percentual_adm := 100;
                END IF;

                IF (v_cd_centro_custo_ebs is not null) THEN
                    v_cd_centro_custo := v_cd_centro_custo_ebs;
                END IF;

                BEGIN
                   v_id_grade_verbas_adm := 0;
                   select id_grade_verbas_adm
                     into v_id_grade_verbas_adm
                     from ca.dre_grade_verbas_adm
                    where id_grade_verbas = v_id_grade_verbas;
                EXCEPTION
                     when no_data_found then
                          BEGIN
                              v_qtd_linhas := v_qtd_linhas + 1;
                              INSERT INTO ca.dre_grade_verbas_adm
                                          (ID_GRADE_VERBAS_ADM,
                                           ID_GRADE_VERBAS,
                                           CD_CENTRO_CUSTO_EBS,
                                           VL_CENTRO_CUSTO,
                                           VL_PERCENTUAL_ADM,
                                           QT_HORAS
                                          )
                                   VALUES (ca.sq_dre_grade_verbas_adm.nextval,
                                           v_id_grade_verbas,
                                           v_cd_centro_custo,
                                           v_vl_adm,
                                           v_vl_percentual_adm,
                                           null
                                          );

                          EXCEPTION
                                WHEN OTHERS THEN
                                     p_ds_msg := 'Mensagem: ' || sqlerrm;
                                     p_tp_mensagem := 'A';
                                     --p_status := 2;
                                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                          END;
                END;

                IF (v_id_grade_verbas_adm <> 0) THEN
                    BEGIN
                        update ca.dre_grade_verbas_adm
                           set vl_centro_custo = vl_centro_custo + v_vl_adm
                         where id_grade_verbas_adm = v_id_grade_verbas_adm;
                           v_qtd_linhas := v_qtd_linhas + 1;
                    EXCEPTION
                         when others then
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                END IF;
            END IF;

        END IF;
    END LOOP;
    CLOSE c_grade_verba;
    commit;

    -- Apura as verbas que estão na folha sispro, mas não estão ca.dre_par_verba_destino .

    OPEN c_folha_verba;

    LOOP
        FETCH c_folha_verba INTO cfv;

        EXIT WHEN c_folha_verba%NOTFOUND;

        IF  c_folha_verba%FOUND THEN
            v_vl_docencia := 0;
            v_vl_adm := 0;
            v_vl_pos := 0;

            BEGIN
               v_id_grade_verbas := 0;
               v_id_grade_verbas_aux := 0;
               -- Verifica se professor ou administrativo tem verba para esse período --
               select id_grade_verbas
                 into v_id_grade_verbas
                 from ca.dre_grade_verbas
                where dt_folha = v_dt_folha
                  and cd_estabelecimento = cfv.estb
                  and nr_registro = cfv.matricula;
            EXCEPTION
                 when no_data_found then
                      BEGIN
                          v_qtd_linhas := v_qtd_linhas + 1;
                          v_id_grade_verbas_aux := ca.sq_dre_grade_verbas.nextval;
                          INSERT INTO ca.dre_grade_verbas
                                      (ID_GRADE_VERBAS,
                                       DT_FOLHA,
                                       CD_PROFESSOR,
                                       VL_DOCENCIA,
                                       VL_PERCENTUAL_DOCENCIA,
                                       VL_ADM,
                                       VL_PERCENTUAL_ADM,
                                       VL_POS,
                                       VL_PERCENTUAL_POS,
                                       VL_CUSTO,
                                       CD_ESTABELECIMENTO,
                                       NR_REGISTRO,
                                       CD_CENTRO_CUSTO_EBS
                                      )
                               VALUES (v_id_grade_verbas_aux,
                                       v_dt_folha,
                                       cfv.cd_professor,
                                       v_vl_docencia,
                                       0,
                                       v_vl_adm,
                                       0,
                                       v_vl_pos,
                                       0,
                                       0,
                                       cfv.estb,
                                       cfv.matricula,
                                       cfv.centro_custo
                                      );

                      EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                      END;
            END;

            IF (v_id_grade_verbas <> 0) THEN
                BEGIN
                    update ca.dre_grade_verbas
                       set vl_adm = vl_adm + v_vl_adm
                     where dt_folha = v_dt_folha
                       and cd_estabelecimento = cfv.estb
                       and nr_registro = cfv.matricula;
                       v_qtd_linhas := v_qtd_linhas + 1;
                EXCEPTION
                     when others then
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_folha_verba;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão na tabela DRE_GRADE_VERBAS do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'E';
       p_status := 2;
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas na tabela DRE_GRADE_VERBAS ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_APURA_VERBA;

PROCEDURE P_APURA_VERBA_DOCENCIA_POS (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                      p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                      p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                      p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_dt_folha                    DATE;
    vl_docencia_pos_cc            NUMBER   (15,2)     := 0;
    vl_docencia_pos               NUMBER   (15,2)     := 0;
    v_mensagem                    VARCHAR2 (1000)     := NULL;
    v_id_grade_verbas             NUMBER   (8)        := 0;
    v_sq_dre_grade_verbas         NUMBER   (8)        := 0;
    v_nr_ano                      VARCHAR2 (4)        := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)        := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)        := NULL;
    v_qtd_linhas                  NUMBER   (6)        := 0;
    p_id_plano_execucao           NUMBER   (8)        := 0;
    p_id_controle_execucao        NUMBER   (8)        := 0;
    p_ds_msg                      VARCHAR2 (500)      := NULL;
    p_tp_mensagem                 VARCHAR2 (1)        := NULL;
    p_status                      VARCHAR2 (1)        := NULL;

    cursor c_grade_verba_docencia_pos is
           select ps.cd_professor,ps.cd_estabelecimento,ps.nr_registro,cc.cd_centro_custo_ebs,
                  sum(ps.vl_solicitado) as vl_docencia_pos_cc
             from pg.v_pagamentos_solicitados ps, pg.curso c,al.centro_custo cc
            where ps.st_situacao = 'A'
              and ps.nr_registro is not null
              and trim(to_char(substr(to_char(ps.dt_pagamento,'dd/mm/yyyy'),4,2),'00')) = v_nr_mes_ebs
              and trim(to_char(substr(to_char(ps.dt_pagamento,'dd/mm/yyyy'),9,2),'00')) = v_nr_ano_ebs
              and ps.nr_curso = c.nr_curso
              and c.nr_custo = cc.cd_centro_custo
         group by ps.cd_professor,ps.cd_estabelecimento,ps.nr_registro,cc.cd_centro_custo_ebs
         order by ps.cd_professor,ps.cd_estabelecimento,ps.nr_registro,cc.cd_centro_custo_ebs;

    vdp             c_grade_verba_docencia_pos%ROWTYPE;

BEGIN

    -- Busca código do plano de execução --
    select id_plano_execucao
      into p_id_plano_execucao
      from ca.dre_plano_execucao
    where nm_procedure = 'P_APURA_VERBA_DOCENCIA_POS';


    s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                   p_nr_mes,
                                                   p_id_plano_execucao,
                                                   p_cd_estabelecimento,
                                                   p_nr_registro,
                                                   p_id_controle_execucao);


    p_status := 1;

    v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
    v_nr_ano_ebs := substr(v_nr_ano,3,2);
    v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
    v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

    v_qtd_linhas := 0;


    p_ds_msg := 'Apura as verbas da docência pós nos memorandos.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

    -- Apura as verbas da docência pós nos memorandos.

    OPEN c_grade_verba_docencia_pos;

    LOOP
        FETCH c_grade_verba_docencia_pos INTO vdp;

        EXIT WHEN c_grade_verba_docencia_pos%NOTFOUND;

        IF  c_grade_verba_docencia_pos%FOUND THEN
            v_id_grade_verbas := 0;
            v_sq_dre_grade_verbas := 0;
            -- Verifica se professor tem verba para esse período --
            BEGIN
                select id_grade_verbas
                  into v_id_grade_verbas
                  from ca.dre_grade_verbas
                 where dt_folha = v_dt_folha
                   and cd_professor = vdp.cd_professor;
            EXCEPTION
                when no_data_found then
                     BEGIN
                       v_sq_dre_grade_verbas := ca.sq_dre_grade_verbas.nextval;
                       vl_docencia_pos := 0;
                       --vl_docencia_pos := vdp.vl_docencia_pos_cc;
                       INSERT INTO ca.dre_grade_verbas
                                   (ID_GRADE_VERBAS,
                                    DT_FOLHA,
                                    CD_PROFESSOR,
                                    VL_DOCENCIA,
                                    VL_PERCENTUAL_DOCENCIA,
                                    VL_ADM,
                                    VL_PERCENTUAL_ADM,
                                    VL_POS,
                                    VL_PERCENTUAL_POS,
                                    VL_CUSTO
                                   )
                            VALUES (v_sq_dre_grade_verbas,
                                    v_dt_folha,
                                    vdp.cd_professor,
                                    0,
                                    0,
                                    0,
                                    0,
                                    vl_docencia_pos,
                                    0,
                                    0
                                  );
                       v_qtd_linhas := v_qtd_linhas + 1;
                     EXCEPTION
                         WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;
             END;

             BEGIN
                 IF (v_sq_dre_grade_verbas = 0 and v_id_grade_verbas <> 0) THEN
                    v_sq_dre_grade_verbas := v_id_grade_verbas;
                 END IF;
                 INSERT INTO ca.dre_grade_verbas_pos
                              (ID_GRADE_VERBAS_POS,
                               ID_GRADE_VERBAS,
                               CD_CENTRO_CUSTO_EBS,
                               VL_CENTRO_CUSTO,
                               VL_PERCENTUAL_POS
                              )
                       VALUES (ca.sq_dre_grade_verbas_pos.nextval,
                               v_sq_dre_grade_verbas,
                               vdp.cd_centro_custo_ebs,
                               vdp.vl_docencia_pos_cc,
                               0
                             );

             EXCEPTION
                 WHEN OTHERS THEN
                      p_ds_msg := 'Mensagem: ' || sqlerrm;
                      p_tp_mensagem := 'A';
                      --p_status := 2;
                      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
             END;
        END IF;
    END LOOP;
    CLOSE c_grade_verba_docencia_pos;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão na tabela DRE_GRADE_VERBAS e DRE_GRADE_VERBAS_POS do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas na tabela DRE_GRADE_VERBAS e DRE_GRADE_VERBAS_POS ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_APURA_VERBA_DOCENCIA_POS;

PROCEDURE P_APURA_VERBA_ADM (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                             p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                             p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                             p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_dt_folha                    DATE;
    v_vl_adm_cc                   NUMBER   (15,2) := 0;
    v_vl_adm                      NUMBER   (15,2) := 0;
    v_id_grade_verbas             NUMBER   (8)    := 0;
    v_cd_professor                VARCHAR2 (7)    := NULL;
    v_qt_horas                    NUMBER   (6,0)  := 0;
    v_mensagem                    VARCHAR2 (1000) := NULL;
    v_cd_centro_custo             VARCHAR2 (30)   := NULL;
    v_qt_horas_professor          NUMBER   (6)    := 0;
    v_vl_percentual_adm           NUMBER   (15,2) := 0;
    v_vl_centro_custo             NUMBER   (15,2) := 0;
    v_nr_ano                      VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)    := NULL;
    v_qtd_linhas                  NUMBER   (6)    := 0;
    p_id_plano_execucao           NUMBER   (8)    := 0;
    p_id_controle_execucao        NUMBER   (8)    := 0;
    p_ds_msg                      VARCHAR2 (500)  := NULL;
    p_tp_mensagem                 VARCHAR2 (1)    := NULL;
    p_status                      VARCHAR2 (1)    := NULL;
    v_vl_docencia                 NUMBER   (15,2) := 0;
    v_vl_percentual_docencia      NUMBER   (15,2) := 0;
    v_vl_pos                      NUMBER   (15,2) := 0;
    v_vl_percentual_pos           NUMBER   (15,2) := 0;


    cursor c_grade_verba_adm is
           select nvl(p.vl_docencia,0) + nvl(p.vl_qualificacao,0) + nvl(p.vl_cargo_adm,0) + nvl(p.VL_HORA_EXCEDENTE,0) -
                  nvl(v.vl_docencia,0) v_vl_adm,
                  v.id_grade_verbas,
                  v.cd_professor,
                  p.vl_cargo_adm_doc,
                  p.vl_cargo_adm,
                  v.cd_estabelecimento,
                  v.nr_registro,
                  v.vl_docencia,
                  v.vl_percentual_docencia,
                  v.vl_adm,
                  v.vl_percentual_adm,
                  v.vl_pos,
                  v.vl_percentual_pos
             from fp.folha_prof p,
                  ca.dre_grade_verbas v
            where p.dt_folha = v_dt_folha
              and p.dt_folha = v.dt_folha
              and p.st_folha = 'F'
              and (p.vl_cargo_adm > 0 or p.vl_cargo_adm_doc > 0)
              and p.cd_professor = v.cd_professor
         order by v.cd_professor;

    cursor c_verba_adm_doc is
           select *
             from fp.folha_prof p
            where p.dt_folha = v_dt_folha
              and p.st_folha = 'F'
              and (p.vl_cargo_adm > 0 or p.vl_cargo_adm_doc > 0) -- p.vl_cargo_adm_doc > 0
         order by p.cd_professor;


    cursor c_grade_verba_adm_cc is
           select a.cd_professor,cc.cd_centro_custo_ebs,sum(nr_creditos_teoricos + nr_creditos_praticos) v_qt_horas
             from ca.cargo_administrativo_folha a,
                  al.centro_custo cc
            where a.dt_folha = v_dt_folha
              and a.cd_professor = v_cd_professor
              and a.cd_centro_custo = cc.cd_centro_custo
           group by a.cd_professor,cc.cd_centro_custo_ebs
           order by a.cd_professor,cc.cd_centro_custo_ebs;

    cursor c_grade_verba_adm_per is
           select v.id_grade_verbas,a.id_grade_verbas_adm,a.qt_horas,v.vl_adm
             from ca.dre_grade_verbas v,
                  ca.dre_grade_verbas_adm a
            where v.dt_folha = v_dt_folha
              and v.id_grade_verbas = a.id_grade_verbas
         order by v.cd_professor, v.id_grade_verbas;

    gva             c_grade_verba_adm%ROWTYPE;
    vad             c_verba_adm_doc%ROWTYPE;
    vac             c_grade_verba_adm_cc%ROWTYPE;
    vap             c_grade_verba_adm_per%ROWTYPE;

BEGIN

    -- Busca código do plano de execução --
    select id_plano_execucao
      into p_id_plano_execucao
      from ca.dre_plano_execucao
     where nm_procedure = 'P_APURA_VERBA_ADM';


    s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                   p_nr_mes,
                                                   p_id_plano_execucao,
                                                   p_cd_estabelecimento,
                                                   p_nr_registro,
                                                   p_id_controle_execucao);


    p_status := 1;

    v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
    v_nr_ano_ebs := substr(v_nr_ano,3,2);
    v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
    v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

    v_qtd_linhas := 0;
    p_ds_msg := 'Apura verba administrativa folha acadêmica.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);



    -- Apura verba administrativa folha acadêmica.

    OPEN c_grade_verba_adm;

    LOOP
        FETCH c_grade_verba_adm INTO gva;

        EXIT WHEN c_grade_verba_adm%NOTFOUND;

        IF  c_grade_verba_adm%FOUND THEN
           -- IF ((gva.vl_adm !=0 ) or (gva.vl_cargo_adm_doc > 0)) THEN
            IF ((gva.v_vl_adm > 2) or (gva.vl_cargo_adm_doc > 0 or gva.vl_cargo_adm >0)) THEN
                -- Atualiza valor administrativo --
                v_id_grade_verbas := gva.id_grade_verbas;
                v_cd_professor := gva.cd_professor;

                OPEN c_grade_verba_adm_cc;

                LOOP

                    FETCH c_grade_verba_adm_cc INTO vac;

                    EXIT WHEN c_grade_verba_adm_cc%NOTFOUND;

                    IF  c_grade_verba_adm_cc%FOUND THEN
                        BEGIN
                            v_qtd_linhas := v_qtd_linhas + 1;
                            INSERT INTO ca.dre_grade_verbas_adm
                                        (ID_GRADE_VERBAS_ADM,
                                         ID_GRADE_VERBAS,
                                         CD_CENTRO_CUSTO_EBS,
                                         VL_CENTRO_CUSTO,
                                         VL_PERCENTUAL_ADM,
                                         QT_HORAS
                                        )
                                 VALUES (ca.sq_dre_grade_verbas_adm.nextval,
                                         v_id_grade_verbas,
                                         vac.cd_centro_custo_ebs,
                                         0, --nvl(gva.vl_cargo_adm,0),
                                         0,
                                         vac.v_qt_horas
                                       );
                        EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                        END;
                    END IF;
                END LOOP;
                CLOSE c_grade_verba_adm_cc;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_grade_verba_adm;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão na DRE_GRADE_VERBAS_ADM do ano ' || p_nr_ano ||
                   ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas na tabela DRE_GRADE_VERBAS_ADM ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

    END IF;

    v_qtd_linhas := 0;
    p_ds_msg := 'Apura verba administrativa folha acadêmica.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);



    -- Apura verba administrativa folha acadêmica.

    OPEN c_verba_adm_doc;

    LOOP
        FETCH c_verba_adm_doc INTO vad;

        EXIT WHEN c_verba_adm_doc%NOTFOUND;

        IF  c_verba_adm_doc%FOUND THEN
            IF (vad.vl_cargo_adm_doc > 0) THEN


               v_id_grade_verbas := 0;
               v_vl_docencia := 0;
               v_vl_percentual_docencia := 0;
               v_vl_adm := 0;
               v_vl_percentual_adm := 0;
               v_vl_pos := 0;
               v_vl_percentual_pos := 0;
               v_cd_professor := vad.cd_professor;
               BEGIN
                     -- Verificar código do professor na grade de verbas
                    select id_grade_verbas, vl_docencia, vl_percentual_docencia, vl_adm,vl_percentual_adm, vl_pos, vl_percentual_pos
                      into v_id_grade_verbas, v_vl_docencia, v_vl_percentual_docencia, v_vl_adm, v_vl_percentual_adm, v_vl_pos, v_vl_percentual_pos
                      from ca.dre_grade_verbas
                     where cd_professor  = v_cd_professor
                       and dt_folha = v_dt_folha;
               EXCEPTION
                     WHEN OTHERS THEN
                          p_ds_msg := 'Mensagem: ' || sqlerrm;
                          p_tp_mensagem := 'A';
                          --p_status := 2;
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;


               -- Grava tabela auxiliar para guardar os valores originais gravados a partir da folha sispro --
               BEGIN
                  v_qtd_linhas := v_qtd_linhas + 1;
                  INSERT INTO ca.dre_grade_excecao
                              (ID_GRADE_EXCECAO,
                               CD_ESTABELECIMENTO,
                               NR_REGISTRO,
                               NR_ANO,
                               NR_MES,
                               VL_DOCENCIA_ORIGINAL,
                               VL_PERC_DOCENCIA_ORIGINAL,
                               VL_ADM_ORIGINAL,
                               VL_PERC_ADM_ORIGINAL,
                               VL_POS_ORIGINAL,
                               VL_PERC_POS_ORIGINAL,
                               VL_DOC_ADM_EXCECAO,
                               ID_GRADE_VERBAS
                              )
                       VALUES (ca.sq_dre_grade_excecao.nextval,
                               vad.cd_estabelecimento,




                               vad.nr_registro,
                               p_nr_ano,
                               p_nr_mes,
                               v_vl_docencia,
                               v_vl_percentual_docencia,

                               v_vl_adm,
                               v_vl_percentual_adm,

                               v_vl_pos,
                               v_vl_percentual_pos,
                               vad.vl_cargo_adm_doc,
                               v_id_grade_verbas
                              );
               EXCEPTION
                    WHEN OTHERS THEN
                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                         p_tp_mensagem := 'A';
                         --p_status := 2;
                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;


               BEGIN
                   IF (v_vl_docencia >= vad.vl_cargo_adm_doc and ( (vad.VL_DOCENCIA  - vad.VL_CARGO_ADM_DOC) + (vad.VL_DOCENCIA - vad.VL_CARGO_ADM_DOC)*(vad.PC_QUALIFICACAO/100) >=0)) THEN
                       update ca.dre_grade_verbas
                          --set vl_docencia = vl_docencia - vad.vl_cargo_adm_doc, vl_adm = vl_adm + vad.vl_cargo_adm_doc
                          -- vl_docencia = vad.vl_docencia - vad.vl_cargo_adm_doc
                          set vl_docencia = (vad.VL_DOCENCIA  - vad.VL_CARGO_ADM_DOC) + (vad.VL_DOCENCIA - vad.VL_CARGO_ADM_DOC)*(vad.PC_QUALIFICACAO/100)   
                            -- , vl_adm = vl_adm +  vad.vl_cargo_adm_doc  
                            , vl_adm = vl_adm + (vad.VL_CARGO_ADM_DOC + vad.VL_CARGO_ADM_DOC * (vad.PC_QUALIFICACAO/100))
                        where id_grade_verbas  = v_id_grade_verbas;
                        v_qtd_linhas := v_qtd_linhas + 1;
                   ELSE
                      update ca.dre_grade_verbas
                          set vl_docencia = 0, vl_adm = vl_adm + vad.vl_cargo_adm_doc
                        where id_grade_verbas  = v_id_grade_verbas;
                        v_qtd_linhas := v_qtd_linhas + 1;

                   END IF;
               EXCEPTION
                  WHEN OTHERS THEN
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;
            END IF; ----

           IF (nvl(vad.vl_cargo_adm,0) > 0 and vad.vl_cargo_adm_doc = 0) THEN


               v_id_grade_verbas := 0;
               v_vl_docencia := 0;
               v_vl_percentual_docencia := 0;
               v_vl_adm := 0;
               v_vl_percentual_adm := 0;
               v_vl_pos := 0;
               v_vl_percentual_pos := 0;
               v_cd_professor := vad.cd_professor;
               BEGIN
                     -- Verificar código do professor na grade de verbas
                    select id_grade_verbas, vl_docencia, vl_percentual_docencia, vl_adm,vl_percentual_adm, vl_pos, vl_percentual_pos
                      into v_id_grade_verbas, v_vl_docencia, v_vl_percentual_docencia, v_vl_adm, v_vl_percentual_adm, v_vl_pos, v_vl_percentual_pos
                      from ca.dre_grade_verbas
                     where cd_professor  = v_cd_professor
                       and dt_folha = v_dt_folha;
               EXCEPTION
                     WHEN OTHERS THEN
                          p_ds_msg := 'Mensagem: ' || sqlerrm;
                          p_tp_mensagem := 'A';
                          --p_status := 2;
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;


               -- Grava tabela auxiliar para guardar os valores originais gravados a partir da folha sispro --
               BEGIN
                  v_qtd_linhas := v_qtd_linhas + 1;
                  INSERT INTO ca.dre_grade_excecao
                              (ID_GRADE_EXCECAO,
                               CD_ESTABELECIMENTO,
                               NR_REGISTRO,
                               NR_ANO,
                               NR_MES,
                               VL_DOCENCIA_ORIGINAL,
                               VL_PERC_DOCENCIA_ORIGINAL,
                               VL_ADM_ORIGINAL,
                               VL_PERC_ADM_ORIGINAL,
                               VL_POS_ORIGINAL,
                               VL_PERC_POS_ORIGINAL,
                               VL_DOC_ADM_EXCECAO,
                               ID_GRADE_VERBAS
                              )
                       VALUES (ca.sq_dre_grade_excecao.nextval,
                               vad.cd_estabelecimento,




                               vad.nr_registro,
                               p_nr_ano,
                               p_nr_mes,
                               v_vl_docencia,
                               v_vl_percentual_docencia,

                               v_vl_adm,
                               v_vl_percentual_adm,

                               v_vl_pos,
                               v_vl_percentual_pos,
                               vad.vl_cargo_adm,
                               v_id_grade_verbas
                              );
               EXCEPTION
                    WHEN OTHERS THEN
                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                         p_tp_mensagem := 'A';
                         --p_status := 2;
                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;


               BEGIN
                   IF 1=1 then -- (v_vl_docencia >= vad.vl_cargo_adm) THEN --** mantido para historico
                       update ca.dre_grade_verbas
                          set vl_docencia = (vad.VL_DOCENCIA ) + ((vad.VL_DOCENCIA)  * (vad.PC_QUALIFICACAO/100)) --vl_docencia - vad.vl_cargo_adm
                            , vl_adm      = (vad.VL_CARGO_ADM) + ((vad.VL_CARGO_ADM) * (vad.PC_QUALIFICACAO/100)) --, vl_adm = vl_adm + vad.vl_cargo_adm
                        where id_grade_verbas  = v_id_grade_verbas;
                        v_qtd_linhas := v_qtd_linhas + 1;
                   ELSE
                      update ca.dre_grade_verbas
                          set vl_docencia = 0, vl_adm = vl_adm + vad.vl_cargo_adm
                        where id_grade_verbas  = v_id_grade_verbas;
                        v_qtd_linhas := v_qtd_linhas + 1;

                   END IF;
               EXCEPTION
                  WHEN OTHERS THEN
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;
            END IF; -- vl adm

        END IF;-----
    END LOOP;
    CLOSE c_verba_adm_doc;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada alteração na DRE_GRADE_VERBAS do ano ' || p_nr_ano ||
                   ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_VERBAS ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

    END IF;


    v_qtd_linhas := 0;
    p_ds_msg := 'Proporcionalizar o valor administrativo por lotação de acordo com as horas teóricas e práticas
                 e gravar na tabela DRE_GRADE_VERBA_ADM.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

    -- Proporcionalizar o valor administrativo por lotação de acordo com as horas teóricas e práticas
    -- e gravar na tabela DRE_GRADE_VERBA_ADM.
    OPEN c_grade_verba_adm_per;

    LOOP
        FETCH c_grade_verba_adm_per INTO vap;

        EXIT WHEN c_grade_verba_adm_per%NOTFOUND;

        IF  c_grade_verba_adm_per%FOUND THEN
            -- Proporcionalizar o valor administrativo por lotação (CD_CENTRO_CUSTO_EBS) de acordo com a quantidade de horas teóricas e
            -- práticas que carregamos a partir da tabela CA.CARGO_ADMINISTRATIVO_FOLHA.
            v_qt_horas_professor := 0;
            BEGIN
                select sum(qt_horas)
                  into v_qt_horas_professor
                  from ca.dre_grade_verbas_adm
                 where id_grade_verbas = vap.id_grade_verbas;
            EXCEPTION
                 when no_data_found then
                      v_mensagem := v_qt_horas_professor;
                      p_ds_msg := 'Não existe horas para professor ' || v_mensagem || '.';
                      p_tp_mensagem := 'A';
                      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;

            IF (v_qt_horas_professor <> 0) THEN
                v_vl_percentual_adm := vap.qt_horas / v_qt_horas_professor * 100;
                v_vl_centro_custo := vap.vl_adm * v_vl_percentual_adm / 100;
                BEGIN
                    update ca.dre_grade_verbas_adm
                       set vl_percentual_adm = v_vl_percentual_adm, vl_centro_custo = v_vl_centro_custo
                     where id_grade_verbas_adm = vap.id_grade_verbas_adm;
                     v_qtd_linhas := v_qtd_linhas +1;
                EXCEPTION
                     when others then
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_grade_verba_adm_per;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização dos percentuais na tabela DRE_GRADE_VERBA_ADM do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_VERBA_ADM ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_APURA_VERBA_ADM;

PROCEDURE P_CRIA_GRADE_ALOCACAO_DOCENTE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                         p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                         p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                         p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_dt_folha                    DATE;
    v_qt_horas                    NUMBER   (6)     := 0;
    v_nr_ano                      VARCHAR2 (4)     := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)     := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)     := NULL;
    v_qt_horas_professor          NUMBER   (6)     := 0;
    v_vl_percentual               NUMBER   (15,2)  := NULL;
    v_mensagem                    VARCHAR2 (1000)  := NULL;
    v_id_grade_verbas             NUMBER   (8)     := NULL;
    v_cd_curso                    NUMBER   (4)     := 0;
    v_qtd_linhas                  NUMBER   (6)     := 0;
    v_vl_total                    NUMBER   (15,2)  := 0;
    v_qtd_linhas_cursor           NUMBER   (6)     := 0;
    v_id_grade_alocacao_docente   NUMBER   (8)     := NULL;
    v_sinal                       VARCHAR2 (1)     := NULL;
    p_id_plano_execucao           NUMBER   (8)     := 0;
    p_id_controle_execucao        NUMBER   (8)     := 0;
    p_ds_msg                      VARCHAR2 (500)   := NULL;
    p_tp_mensagem                 VARCHAR2 (1)     := NULL;
    p_status                      VARCHAR2 (1)     := NULL;


    cursor c_grade_alocacao_docente is
           select fpd.cd_professor,fpd.cd_estabelecimento,fpd.nr_registro,
                  fpd.cd_disciplina,fpd.cd_turma,tur.cd_curso,sum(fpd.carga_horaria_doc) v_qt_horas
             from fp.folha_prof_disciplina fpd, ca.turma tur
            where fpd.dt_folha = v_dt_folha
              --and fpd.cd_professor  = tur.cd_professor
              and fpd.cd_disciplina = tur.cd_disciplina
              and fpd.cd_turma = tur.cd_turma
              and fpd.st_folha = 'F'
         group by fpd.cd_professor,fpd.cd_estabelecimento,fpd.nr_registro,fpd.cd_disciplina,fpd.cd_turma,tur.cd_curso;

    cursor c_grade_alocacao_docente_his is
           select fpd.cd_professor,fpd.cd_estabelecimento,fpd.nr_registro,
                  fpd.cd_disciplina,fpd.cd_turma,tur.cd_curso,sum(fpd.carga_horaria_doc) v_qt_horas
             from fp.folha_prof_disciplina fpd, ca.hist_turma tur
            where fpd.dt_folha = v_dt_folha
              and tur.cd_periodo = s_calcula_periodo(fpd.dt_folha,4)
              --and fpd.cd_professor  = tur.cd_professor
              and fpd.cd_disciplina = tur.cd_disciplina
              and fpd.cd_turma = tur.cd_turma
              and fpd.st_folha = 'F'
         group by fpd.cd_professor,fpd.cd_estabelecimento,fpd.nr_registro,fpd.cd_disciplina,fpd.cd_turma,tur.cd_curso;

    cursor c_ler_grade_alocacao_docente is
           select *
             from ca.dre_grade_alocacao_docente
            where dt_folha = v_dt_folha
         order by dt_folha,cd_professor,cd_disciplina,cd_turma,cd_curso;

    cursor c_total_docente is
           select cd_professor,sum(vl_percentual) vl_percentual
             from ca.dre_grade_alocacao_docente
            where dt_folha = v_dt_folha
         group by cd_professor
         order by cd_professor;

    gad             c_grade_alocacao_docente%ROWTYPE;
    lgad            c_ler_grade_alocacao_docente%ROWTYPE;
    ctd             c_total_docente%ROWTYPE;

BEGIN

   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_CRIA_GRADE_ALOCACAO_DOCENTE';


   s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                  p_nr_mes,
                                                  p_id_plano_execucao,
                                                  p_cd_estabelecimento,
                                                  p_nr_registro,
                                                  p_id_controle_execucao);


   p_status := 1;

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));

   v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

   v_qtd_linhas := 0;

   p_ds_msg := 'Carrega as disciplinas turma ministradas e o curso correspondente aquela disciplina turma.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

   -- Carrega as disciplinas turma ministradas e o curso correspondente aquela disciplina turma.

   if s_calcula_periodo(sysdate,4) = s_calcula_periodo(v_dt_folha,4) then

     OPEN c_grade_alocacao_docente;

     LOOP
          FETCH c_grade_alocacao_docente INTO gad;

          EXIT WHEN c_grade_alocacao_docente%NOTFOUND;

          IF  c_grade_alocacao_docente%FOUND THEN

              v_id_grade_verbas := 0;
              BEGIN
                   -- Verificar código do professor na grade de verbas
                  select id_grade_verbas
                    into v_id_grade_verbas
                    from ca.dre_grade_verbas
                   where cd_estabelecimento  = gad.cd_estabelecimento
                     and nr_registro = gad.nr_registro
                     and dt_folha = v_dt_folha;
              EXCEPTION
                   when no_data_found then
                        BEGIN
                            v_id_grade_verbas := ca.sq_dre_grade_verbas.nextval;
                            INSERT INTO ca.dre_grade_verbas
                                       (ID_GRADE_VERBAS,
                                        DT_FOLHA,
                                        CD_PROFESSOR,
                                        VL_DOCENCIA,
                                        VL_PERCENTUAL_DOCENCIA,
                                        VL_ADM,
                                        VL_PERCENTUAL_ADM,
                                        VL_POS,
                                        VL_PERCENTUAL_POS,
                                        VL_CUSTO,
                                        CD_ESTABELECIMENTO,
                                        NR_REGISTRO
                                      )
                                  VALUES (v_id_grade_verbas,
                                          v_dt_folha,
                                          gad.cd_professor,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          gad.cd_estabelecimento,
                                          gad.nr_registro
                                        );
                            v_qtd_linhas := v_qtd_linhas + 1;
                        EXCEPTION
                             WHEN OTHERS THEN
                                  p_ds_msg := 'Mensagem: ' || sqlerrm;
                                  p_tp_mensagem := 'A';
                                  --p_status := 2;
                                  s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                        END;
              END;

              BEGIN
                   v_qtd_linhas := v_qtd_linhas + 1;
                   INSERT INTO ca.dre_grade_alocacao_docente
                               (ID_GRADE_ALOCACAO_DOCENTE,
                                DT_FOLHA,
                                CD_PROFESSOR,
                                CD_DISCIPLINA,
                                CD_TURMA,
                                CD_CURSO,
                                QT_HORAS,
                                VL_PERCENTUAL,
                                ID_GRADE_VERBAS
                               )
                        VALUES (ca.sq_dre_grade_alocacao_docente.nextval,
                                v_dt_folha,
                                gad.cd_professor,
                                gad.cd_disciplina,
                                gad.cd_turma,
                                gad.cd_curso,
                                gad.v_qt_horas,
                                v_vl_percentual,
                                v_id_grade_verbas
                              );

              EXCEPTION
                  WHEN OTHERS THEN
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
              END;
          END IF;
     END LOOP;
     CLOSE c_grade_alocacao_docente;
     commit;
  else
     OPEN c_grade_alocacao_docente_his;

     LOOP
          FETCH c_grade_alocacao_docente_his INTO gad;

          EXIT WHEN c_grade_alocacao_docente_his%NOTFOUND;

          IF  c_grade_alocacao_docente_his%FOUND THEN

              v_id_grade_verbas := 0;
              BEGIN
                   -- Verificar código do professor na grade de verbas
                  select id_grade_verbas
                    into v_id_grade_verbas
                    from ca.dre_grade_verbas
                   where cd_estabelecimento  = gad.cd_estabelecimento
                     and nr_registro = gad.nr_registro
                     and dt_folha = v_dt_folha;
              EXCEPTION
                   when no_data_found then
                        BEGIN
                            v_id_grade_verbas := ca.sq_dre_grade_verbas.nextval;
                            INSERT INTO ca.dre_grade_verbas
                                       (ID_GRADE_VERBAS,
                                        DT_FOLHA,
                                        CD_PROFESSOR,
                                        VL_DOCENCIA,
                                        VL_PERCENTUAL_DOCENCIA,
                                        VL_ADM,
                                        VL_PERCENTUAL_ADM,
                                        VL_POS,
                                        VL_PERCENTUAL_POS,
                                        VL_CUSTO,
                                        CD_ESTABELECIMENTO,
                                        NR_REGISTRO
                                      )
                                  VALUES (v_id_grade_verbas,
                                          v_dt_folha,
                                          gad.cd_professor,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          gad.cd_estabelecimento,
                                          gad.nr_registro
                                        );
                            v_qtd_linhas := v_qtd_linhas + 1;
                        EXCEPTION
                             WHEN OTHERS THEN
                                  p_ds_msg := 'Mensagem: ' || sqlerrm;
                                  p_tp_mensagem := 'A';
                                  --p_status := 2;
                                  s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                        END;
              END;

              BEGIN
                   v_qtd_linhas := v_qtd_linhas + 1;
                   INSERT INTO ca.dre_grade_alocacao_docente
                               (ID_GRADE_ALOCACAO_DOCENTE,
                                DT_FOLHA,
                                CD_PROFESSOR,
                                CD_DISCIPLINA,
                                CD_TURMA,
                                CD_CURSO,
                                QT_HORAS,
                                VL_PERCENTUAL,
                                ID_GRADE_VERBAS
                               )
                        VALUES (ca.sq_dre_grade_alocacao_docente.nextval,
                                v_dt_folha,
                                gad.cd_professor,
                                gad.cd_disciplina,
                                gad.cd_turma,
                                gad.cd_curso,
                                gad.v_qt_horas,
                                v_vl_percentual,
                                v_id_grade_verbas
                              );

              EXCEPTION
                  WHEN OTHERS THEN
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
              END;
          END IF;
     END LOOP;
     CLOSE c_grade_alocacao_docente_his;
     commit;
   end if;

   IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão na tabela DRE_GRADE_ALOCACAO_DOCENTE do ano ' || p_nr_ano || ' mês ' ||
                             p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluídas na tabela DRE_GRADE_ALOCACAO_DOCENTE ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;

    p_ds_msg := 'Calcula percentual de horas de cada disciplina em relação ao total e grava na tabela DRE_GRADE_ALOCACAO_DOCENTE.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


    -- Calcula percentual de horas de cada disciplina em relação ao total e grava na tabela DRE_GRADE_ALOCACAO_DOCENTE.

    -- Calcular os percentuais em relação ao total da disciplina turma
    OPEN c_ler_grade_alocacao_docente;

    LOOP
        FETCH c_ler_grade_alocacao_docente INTO lgad;

        EXIT WHEN c_ler_grade_alocacao_docente%NOTFOUND;

        IF  c_ler_grade_alocacao_docente%FOUND THEN
            -- Totalizar por professor
            v_qt_horas_professor := 0;
            BEGIN
                select sum(qt_horas)
                  into v_qt_horas_professor
                  from ca.dre_grade_alocacao_docente
                 where cd_professor = lgad.cd_professor
                   and dt_folha = v_dt_folha;
            EXCEPTION
                 when no_data_found then
                      v_mensagem := v_qt_horas_professor;
                      p_ds_msg := 'Não existe horas para professor ' || v_mensagem || '.';
                      p_tp_mensagem := 'A';
                      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;

            IF (v_qt_horas_professor <> 0) THEN
                v_vl_percentual := lgad.qt_horas / v_qt_horas_professor * 100;

                BEGIN
                    update ca.dre_grade_alocacao_docente
                       set vl_percentual = v_vl_percentual
                     where id_grade_alocacao_docente = lgad.id_grade_alocacao_docente;
                     v_qtd_linhas := v_qtd_linhas +1;
                EXCEPTION
                     when others then
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_ler_grade_alocacao_docente;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização dos percentuais na tabela DRE_GRADE_ALOCACAO_DOCENTE do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_ALOCACAO_DOCENTE ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;
    p_ds_msg := 'Atualiza percentual do docente na tabela DRE_GRADE_ALOCACAO_DOCENTE.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    -- Atualiza percentual do docente na tabela DRE_GRADE_ALOCACAO_DOCENTE.

    -- Atualiza percentual do docente -  A J U S T E   P E R C E N T U A L (99.99 E 100.01)
    OPEN c_total_docente;

    LOOP
        FETCH c_total_docente INTO ctd;

        EXIT WHEN c_total_docente%NOTFOUND;

        IF  c_total_docente%FOUND THEN
            IF (ctd.vl_percentual <> 100) THEN
                v_id_grade_alocacao_docente := 0;
                BEGIN
                    select max(id_grade_alocacao_docente)
                      into v_id_grade_alocacao_docente
                      from ca.dre_grade_alocacao_docente
                     where cd_professor = ctd.cd_professor
                       and dt_folha = v_dt_folha;
                EXCEPTION
                     when no_data_found then
                          v_mensagem := ctd.cd_professor;
                          p_ds_msg := 'Não existe horas para professor ' || v_mensagem || '.';
                          p_tp_mensagem := 'A';
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;

                IF (v_id_grade_alocacao_docente <> 0) THEN
                    v_vl_percentual := 0;
                    v_sinal := '';
                    IF (ctd.vl_percentual < 100) THEN
                        v_vl_percentual := 100 - ctd.vl_percentual;
                        v_sinal := '+';
                    END IF;
                    IF (ctd.vl_percentual > 100) THEN
                        v_vl_percentual := ctd.vl_percentual - 100;
                        v_sinal := '-';
                    END IF;

                    BEGIN
                         IF (v_sinal = '+') THEN
                            update ca.dre_grade_alocacao_docente
                               set vl_percentual = vl_percentual + v_vl_percentual
                             where id_grade_alocacao_docente = v_id_grade_alocacao_docente;
                         END IF;
                         IF (v_sinal = '-') THEN
                            update ca.dre_grade_alocacao_docente
                               set vl_percentual = vl_percentual - v_vl_percentual
                             where id_grade_alocacao_docente = v_id_grade_alocacao_docente;
                         END IF;
                         v_qtd_linhas := v_qtd_linhas +1;
                    EXCEPTION
                         when others then
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                END IF;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_total_docente;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização dos percentuais na tabela DRE_GRADE_ALOCACAO_DOCENTE do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_ALOCACAO_DOCENTE ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_CRIA_GRADE_ALOCACAO_DOCENTE;

PROCEDURE P_ATU_GRADE_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                        p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                        p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                        p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_dt_folha                       DATE;
    v_nr_ano                         VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                     VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                     VARCHAR2 (2)    := NULL;
    v_qtd_aluno                      NUMBER   (6)    := 0;
    v_qtd_aluno_cursando             NUMBER   (6)    := 0;
    v_qtd_aluno_trancado             NUMBER   (6)    := 0;
    v_qtd_alunos_disciplina_turma    NUMBER   (6)    := 0;
    v_vl_percentual                  NUMBER   (15,2) := 0;
    v_mensagem                       VARCHAR2 (1000) := NULL;
    v_id_grade_alocacao_docente      NUMBER   (8)    := NULL;
    v_qtd_linhas                     NUMBER   (6)    := 0;
    v_id_grade_disciplina_turma      NUMBER   (8)    := NULL;
    v_vl_total                       NUMBER   (15,2) := 0;
    v_qtd_linhas_cursor              NUMBER   (6)    := 0;
    v_cd_disciplina                  VARCHAR2 (4)    := NULL;
    v_cd_turma                       NUMBER   (2)    := 0;
    v_sinal                          VARCHAR2 (1)    := NULL;
    v_cd_curso                       NUMBER   (4)    := NULL;
    p_id_plano_execucao              NUMBER   (8)    := 0;
    p_id_controle_execucao           NUMBER   (8)    := 0;
    p_ds_msg                         VARCHAR2 (500)  := NULL;
    p_tp_mensagem                    VARCHAR2 (1)    := NULL;
    p_status                         VARCHAR2 (1)    := NULL;

    cursor c_ler_prof_disciplina is
           select fpd.*,gad.id_grade_alocacao_docente
             from fp.folha_prof_disciplina fpd,
                  ca.dre_grade_alocacao_docente gad
            where fpd.cd_disciplina = gad.cd_disciplina
              and fpd.cd_turma = gad.cd_turma
              and fpd.dt_folha = v_dt_folha
              and gad.dt_folha = fpd.dt_folha
              and gad.cd_professor = fpd.cd_professor
              and fpd.st_folha = 'F';

    cursor c_ler_grade_disciplina_turma is
           select cd_disciplina,cd_turma,qtd_aluno,id_grade_disciplina_turma,id_grade_alocacao_docente
             from ca.dre_grade_disciplina_turma
            where dt_folha = v_dt_folha
              and id_grade_alocacao_docente is not null
         order by dt_folha,cd_disciplina,cd_turma,cd_curso;

    cursor c_atu_grade_disciplina_turma is
           select *
             from ca.dre_grade_disciplina_turma gdt
            where gdt.cd_disciplina = v_cd_disciplina
              and gdt.cd_turma = v_cd_turma
              and gdt.dt_folha = v_dt_folha;

    cursor c_alocacao_docente is
           select gad.id_grade_alocacao_docente,gdt.dt_folha,gdt.cd_disciplina,gdt.cd_turma,gdt.cd_curso,
                  gdt.qtd_aluno_cursando,gdt.qtd_aluno_trancado,gdt.qtd_aluno,gdt.vl_percentual
             from fp.folha_prof_disciplina fpd,
                  ca.dre_grade_alocacao_docente gad,
                  ca.dre_grade_disciplina_turma gdt
            where fpd.cd_disciplina = gad.cd_disciplina
              and fpd.cd_turma = gad.cd_turma
              and fpd.dt_folha = v_dt_folha
              and gad.dt_folha = fpd.dt_folha
              and gad.cd_professor = fpd.cd_professor
              and fpd.st_folha = 'F'
              and gdt.cd_disciplina = gad.cd_disciplina
              and gdt.cd_turma = gad.cd_turma
              and gdt.dt_folha = fpd.dt_folha
              and gad.id_grade_alocacao_docente <> gdt.id_grade_alocacao_docente
          order by fpd.cd_disciplina,fpd.cd_turma,fpd.cd_professor;

    cursor c_ajuste_percentual is
           select cd_disciplina,cd_turma,id_grade_alocacao_docente,sum(vl_percentual)
             from ca.dre_grade_disciplina_turma
            where dt_folha = v_dt_folha
              and id_grade_alocacao_docente is not null
         group by dt_folha,cd_disciplina,cd_turma,id_grade_alocacao_docente
         order by dt_folha,cd_disciplina,cd_turma,id_grade_alocacao_docente;

    cursor c_total_disciplina_turma is
           select cd_disciplina,cd_turma,id_grade_alocacao_docente,sum(vl_percentual) vl_percentual
             from ca.dre_grade_disciplina_turma
            where dt_folha = v_dt_folha
              and id_grade_alocacao_docente is not null
         group by cd_disciplina,cd_turma,id_grade_alocacao_docente
         order by cd_disciplina,cd_turma,id_grade_alocacao_docente;

    lgdt            c_ler_grade_disciplina_turma%ROWTYPE;
    tdt             c_total_disciplina_turma%ROWTYPE;
    lpd             c_ler_prof_disciplina%ROWTYPE;
    agdt            c_atu_grade_disciplina_turma%ROWTYPE;
    cad             c_alocacao_docente%ROWTYPE;

BEGIN

   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_ATU_GRADE_DISCIPLINA_TURMA';


    s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                   p_nr_mes,
                                                   p_id_plano_execucao,
                                                   p_cd_estabelecimento,
                                                   p_nr_registro,
                                                   p_id_controle_execucao);


    p_status := 1;

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
   v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

   v_qtd_linhas := 0;
   p_ds_msg := 'Atualiza grade disciplina turma.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Atualiza grade por disciplina turma e calcula os percentuais em relação ao total da disciplina turma

   OPEN c_ler_prof_disciplina;

    LOOP
        FETCH c_ler_prof_disciplina INTO lpd;

        EXIT WHEN c_ler_prof_disciplina%NOTFOUND;

        IF  c_ler_prof_disciplina%FOUND THEN
            v_id_grade_alocacao_docente := lpd.id_grade_alocacao_docente;
            v_cd_disciplina := lpd.cd_disciplina;
            v_cd_turma := lpd.cd_turma;

            OPEN c_atu_grade_disciplina_turma;

            LOOP
                FETCH c_atu_grade_disciplina_turma INTO agdt;

                EXIT WHEN c_atu_grade_disciplina_turma%NOTFOUND;

                IF  c_atu_grade_disciplina_turma%FOUND THEN
                    v_id_grade_disciplina_turma := agdt.id_grade_disciplina_turma;
                    BEGIN
                        update ca.dre_grade_disciplina_turma
                           set id_grade_alocacao_docente = v_id_grade_alocacao_docente
                         where id_grade_disciplina_turma = v_id_grade_disciplina_turma;
                           --and id_grade_alocacao_docente is null;
                         v_qtd_linhas := v_qtd_linhas +1;
                    EXCEPTION
                         when others then
                              p_ds_msg := 'Mensagem: ' || sqlerrm;
                              p_tp_mensagem := 'A';
                              --p_status := 2;
                              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                    commit;
                END IF;
            END LOOP;
            CLOSE c_atu_grade_disciplina_turma;
            commit;
        END IF;
    END LOOP;
    CLOSE c_ler_prof_disciplina;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização na tabela DRE_GRADE_DISCIPLINA_TURMA do ano ' || p_nr_ano || ' mês ' ||
                             p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas atualizadas na tabela DRE_GRADE_DISCIPLINA_TURMA ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;

    p_ds_msg := 'Cria registro para disciplinas com mais de um docente na tabela DRE_GRADE_DISCIPLINA_TURMA.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

    OPEN c_alocacao_docente;

    LOOP
        FETCH c_alocacao_docente INTO cad;

        EXIT WHEN c_alocacao_docente%NOTFOUND;

        IF c_alocacao_docente%FOUND THEN
            v_id_grade_alocacao_docente := cad.id_grade_alocacao_docente;
            v_cd_disciplina := cad.cd_disciplina;
            v_cd_turma  := cad.cd_turma;
            v_qtd_aluno := cad.qtd_aluno;
            v_qtd_aluno_cursando := cad.qtd_aluno_cursando;
            v_qtd_aluno_trancado := cad.qtd_aluno_trancado;
            v_vl_percentual := cad.vl_percentual;
            v_cd_curso := cad.cd_curso;

            BEGIN
                v_qtd_linhas := v_qtd_linhas + 1;
                INSERT INTO ca.dre_grade_disciplina_turma
                            (ID_GRADE_DISCIPLINA_TURMA,
                             ID_GRADE_ALOCACAO_DOCENTE,
                             DT_FOLHA,
                             CD_DISCIPLINA,
                             CD_TURMA,
                             CD_CURSO,
                             QTD_ALUNO_CURSANDO,
                             QTD_ALUNO_TRANCADO,
                             QTD_ALUNO,
                             VL_PERCENTUAL,
                             VL_CUSTO,
                             ID_VL_APROPRIACAO_INDIRETA
                            )
                     VALUES (ca.sq_dre_grade_disciplina_turma.nextval,
                             v_id_grade_alocacao_docente,
                             v_dt_folha,
                             v_cd_disciplina,
                             v_cd_turma,
                             v_cd_curso,
                             v_qtd_aluno_cursando,
                             v_qtd_aluno_trancado,
                             v_qtd_aluno,
                             v_vl_percentual,
                             null,
                             null
                           );
            EXCEPTION
                  WHEN OTHERS THEN
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;
        END IF;
    END LOOP;
    CLOSE c_alocacao_docente;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão na tabela DRE_GRADE_DISCIPLINA_TURMA do ano ' || p_nr_ano || ' mês ' ||
                               p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluídas na tabela DRE_GRADE_DISCIPLINA_TURMA ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;

    p_ds_msg := 'Calcula os percentuais em relação ao total da disciplina turma na tabela DRE_GRADE_DISCIPLINA_TURMA.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

    -- Calcular os percentuais em relação ao total da disciplina turma

    OPEN c_ler_grade_disciplina_turma;

    LOOP
        FETCH c_ler_grade_disciplina_turma INTO lgdt;

        EXIT WHEN c_ler_grade_disciplina_turma%NOTFOUND;

        IF  c_ler_grade_disciplina_turma%FOUND THEN
            -- Totalizar por por disciplina turma
            v_qtd_alunos_disciplina_turma := 0;
            v_qtd_linhas_cursor := 0;

            BEGIN
                select sum(qtd_aluno), count(*)
                  into v_qtd_alunos_disciplina_turma, v_qtd_linhas_cursor
                  from ca.dre_grade_disciplina_turma
                 where cd_disciplina = lgdt.cd_disciplina
                   and cd_turma = lgdt.cd_turma
                   and dt_folha = v_dt_folha
                   and id_grade_alocacao_docente = lgdt.id_grade_alocacao_docente
                   and id_grade_alocacao_docente is not null;
            EXCEPTION
                 when no_data_found then
                      v_mensagem := v_qtd_alunos_disciplina_turma;
                      p_ds_msg := 'Não existe alunos para disciplina turma ' || v_mensagem || '.';
                      p_tp_mensagem := 'A';
                      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;

            IF (v_qtd_alunos_disciplina_turma <> 0) THEN
                v_vl_percentual := lgdt.qtd_aluno / v_qtd_alunos_disciplina_turma * 100;
                v_id_grade_disciplina_turma := lgdt.id_grade_disciplina_turma;

                BEGIN
                    update ca.dre_grade_disciplina_turma
                       set vl_percentual = v_vl_percentual
                     where id_grade_disciplina_turma = v_id_grade_disciplina_turma;
                     v_qtd_linhas := v_qtd_linhas +1;
                EXCEPTION
                     when others then
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;
                commit;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_ler_grade_disciplina_turma;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização dos percentuais na tabela DRE_GRADE_DISCIPLINA_TURMA do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_DISCIPLINA_TURMA ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;

    p_ds_msg := 'Atualiza os percentuais em relação ao total da disciplina turma na tabela DRE_GRADE_DISCIPLINA_TURMA.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    -- Atualiza os percentuais em relação ao total da disciplina turma.

    -- Atualiza os percentuais em relação ao total da disciplina turma

    OPEN c_total_disciplina_turma;

    LOOP
        FETCH c_total_disciplina_turma INTO tdt;

        EXIT WHEN c_total_disciplina_turma%NOTFOUND;

        IF  c_total_disciplina_turma%FOUND THEN
            IF (tdt.vl_percentual <> 100) THEN
                BEGIN
                    select max(id_grade_disciplina_turma)
                      into v_id_grade_disciplina_turma
                      from ca.dre_grade_disciplina_turma
                     where cd_disciplina = tdt.cd_disciplina
                       and cd_turma = tdt.cd_turma
                       and dt_folha = v_dt_folha
                       and id_grade_alocacao_docente = tdt.id_grade_alocacao_docente
                       and id_grade_alocacao_docente is not null
                  order by cd_disciplina,cd_turma;
                EXCEPTION
                     when no_data_found then
                          v_mensagem := tdt.cd_disciplina || ' - ' || tdt.cd_turma;
                          p_ds_msg := 'Não existe alunos para disciplina turma ' || v_mensagem || '.';
                          p_tp_mensagem := 'A';
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;

                IF (v_id_grade_disciplina_turma <> 0) THEN
                    v_vl_percentual := 0;
                    v_sinal := '';
                    IF (tdt.vl_percentual < 100) THEN
                        v_vl_percentual := 100 - tdt.vl_percentual;
                        v_sinal := '+';
                    END IF;
                    IF (tdt.vl_percentual > 100) THEN
                        v_vl_percentual := tdt.vl_percentual - 100;
                        v_sinal := '-';
                    END IF;

                    BEGIN
                         IF (v_sinal = '+') THEN
                            update ca.dre_grade_disciplina_turma
                               set vl_percentual = vl_percentual + v_vl_percentual
                             where id_grade_disciplina_turma = v_id_grade_disciplina_turma;
                         END IF;
                         IF (v_sinal = '-') THEN
                            update ca.dre_grade_disciplina_turma
                               set vl_percentual = vl_percentual - v_vl_percentual
                             where id_grade_disciplina_turma = v_id_grade_disciplina_turma;
                         END IF;
                         v_qtd_linhas := v_qtd_linhas +1;
                    EXCEPTION
                         when others then
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                    commit;
                END IF;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_total_disciplina_turma;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização dos percentuais na tabela DRE_GRADE_DISCIPLINA_TURMA do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_DISCIPLINA_TURMA ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_ATU_GRADE_DISCIPLINA_TURMA;

PROCEDURE P_PROPORCIONALIZA_VERBAS (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                    p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                    p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                    p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS
    --proporcionaliza a grade_verba  grade_verba_pos e grade verba_adm
    v_dt_folha                    DATE;
    v_mensagem                    VARCHAR2 (1000)  := NULL;
    v_id_grade_verbas             NUMBER   (8)     := 0;
    v_id_grade_verbas_pos         NUMBER   (8)     := 0;
    v_id_grade_verbas_adm         NUMBER   (8)     := 0;
    v_nr_ano                      VARCHAR2 (4)     := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)     := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)     := NULL;
    v_qtd_linhas                  NUMBER   (6)     := 0;
    v_vl_percentual_docencia      NUMBER(15,2)     := 0;
    v_vl_percentual_adm           NUMBER(15,2)     := 0;
    v_vl_percentual_pos           NUMBER(15,2)     := 0;
    v_vl_total                    NUMBER(15,2)     := 0;
    v_vl_percentual_pos_cc        NUMBER(15,2)     := 0;
    v_vl_percentual_adm_cc        NUMBER(15,2)     := 0;
    v_vl_percentual               NUMBER(15,2)     := 0;
    v_sinal                       VARCHAR2 (1)     := NULL;
    v_vl_centro_custo             NUMBER(15,2)     := 0;
    p_id_plano_execucao           NUMBER   (8)     := 0;
    p_id_controle_execucao        NUMBER   (8)     := 0;
    p_ds_msg                      VARCHAR2 (500)   := NULL;
    p_tp_mensagem                 VARCHAR2 (1)     := NULL;
    p_status                      VARCHAR2 (1)     := NULL;

    cursor c_grade_verba is
           select id_grade_verbas,dt_folha,cd_professor,vl_docencia,vl_adm,vl_pos
             from ca.dre_grade_verbas
            where dt_folha = v_dt_folha
              and (vl_docencia <> 0 or vl_adm <> 0 or vl_pos <> 0)
         order by id_grade_verbas;

    cursor c_grade_verba_pos is
         select id_grade_verbas_pos,id_grade_verbas,cd_centro_custo_ebs,vl_centro_custo
           from ca.dre_grade_verbas_pos
          where id_grade_verbas = v_id_grade_verbas
       order by id_grade_verbas_pos;

    cursor c_grade_verba_adm is
           select id_grade_verbas_adm,id_grade_verbas,cd_centro_custo_ebs,vl_centro_custo,qt_horas
             from ca.dre_grade_verbas_adm
            where id_grade_verbas = v_id_grade_verbas
         order by id_grade_verbas_adm;

    cursor c_perc_docencia is
           select id_grade_verbas,cd_professor,vl_percentual_adm,vl_percentual_docencia,vl_percentual_pos,
                  (vl_percentual_adm + vl_percentual_docencia + vl_percentual_pos) vl_percentual_total
             from ca.dre_grade_verbas
            where (vl_percentual_adm + vl_percentual_docencia + vl_percentual_pos) <> 100
              and dt_folha = v_dt_folha
         order by cd_professor;

    cursor c_perc_pos is
           select p.id_grade_verbas,sum(p.vl_percentual_pos) vl_percentual_pos
             from ca.dre_grade_verbas_pos p
            where exists (select 1
                            from ca.dre_grade_verbas v
                           where v.id_grade_verbas = p.id_grade_verbas
                             and v.dt_folha = v_dt_folha)
         group by id_grade_verbas
         order by id_grade_verbas;

    cursor c_perc_adm is
           select a.id_grade_verbas,sum(a.vl_percentual_adm) vl_percentual_adm
             from ca.dre_grade_verbas_adm a
            where exists (select 1
                            from ca.dre_grade_verbas v
                           where v.id_grade_verbas = a.id_grade_verbas
                             and v.dt_folha = v_dt_folha)
         group by id_grade_verbas
         order by id_grade_verbas;

    cgv             c_grade_verba%ROWTYPE;
    gvp             c_grade_verba_pos%ROWTYPE;
    gva             c_grade_verba_adm%ROWTYPE;
    cpd             c_perc_docencia%ROWTYPE;
    cpp             c_perc_pos%ROWTYPE;
    cpa             c_perc_adm%ROWTYPE;

BEGIN

   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_PROPORCIONALIZA_VERBAS';


   s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                  p_nr_mes,
                                                  p_id_plano_execucao,
                                                  p_cd_estabelecimento,
                                                  p_nr_registro,
                                                  p_id_controle_execucao);


   p_status := 1;

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));

   v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

   v_qtd_linhas := 0;
   p_ds_msg := 'Proporcionaliza o valor docência, docência pós e administrativo.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Proporcionaliza o valor docência, docência pós e administrativo.

    OPEN c_grade_verba;

    LOOP
        FETCH c_grade_verba INTO cgv;

        EXIT WHEN c_grade_verba%NOTFOUND;

        IF  c_grade_verba%FOUND THEN
            v_id_grade_verbas := cgv.id_grade_verbas;
            v_vl_total := cgv.vl_docencia + cgv.vl_adm + cgv.vl_pos;
            v_vl_percentual_docencia := cgv.vl_docencia / v_vl_total * 100;
            v_vl_percentual_adm := cgv.vl_adm / v_vl_total * 100;
            v_vl_percentual_pos := cgv.vl_pos / v_vl_total * 100;
            BEGIN
                update ca.dre_grade_verbas
                   set vl_percentual_docencia = v_vl_percentual_docencia,
                       vl_percentual_adm = v_vl_percentual_adm,
                       vl_percentual_pos = v_vl_percentual_pos
                 where id_grade_verbas = v_id_grade_verbas;
                   v_qtd_linhas := v_qtd_linhas + 1;
            EXCEPTION
                when others then
                     p_ds_msg := 'Mensagem: ' || sqlerrm;
                     p_tp_mensagem := 'A';
                     --p_status := 2;
                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;

            OPEN c_grade_verba_pos;

            LOOP
                FETCH c_grade_verba_pos INTO gvp;

                EXIT WHEN c_grade_verba_pos%NOTFOUND;

                IF  c_grade_verba_pos%FOUND THEN
                    v_vl_centro_custo := 0;
                    BEGIN
                        select sum(vl_centro_custo)
                          into v_vl_centro_custo
                          from ca.dre_grade_verbas_pos
                         where id_grade_verbas = v_id_grade_verbas;
                    EXCEPTION
                         when no_data_found then
                              v_mensagem := cpp.id_grade_verbas;
                              p_ds_msg := 'Não existe professor ' || v_mensagem || '.';
                              p_tp_mensagem := 'A';
                              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;

                    v_id_grade_verbas_pos  := gvp.id_grade_verbas_pos;
                    v_vl_percentual_pos_cc := 0;
                    IF (cgv.vl_pos <> 0) THEN
                        v_vl_percentual_pos_cc := gvp.vl_centro_custo / v_vl_centro_custo * 100;
                    END IF;
                    BEGIN
                        update ca.dre_grade_verbas_pos
                           set vl_percentual_pos = v_vl_percentual_pos_cc
                         where id_grade_verbas_pos = v_id_grade_verbas_pos;
                           v_qtd_linhas := v_qtd_linhas + 1;
                    EXCEPTION
                        when others then
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                END IF;
            END LOOP;
            CLOSE c_grade_verba_pos;

        END IF;
    END LOOP;
    CLOSE c_grade_verba;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização na tabela DRE_GRADE_VERBAS do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_VERBAS ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;
    p_ds_msg := 'Atualiza percentual da docência.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


    -- Atualiza percentual da docência.

    OPEN c_perc_docencia;

    LOOP
        FETCH c_perc_docencia INTO cpd;

        EXIT WHEN c_perc_docencia%NOTFOUND;

        IF  c_perc_docencia%FOUND THEN
            v_id_grade_verbas := cpd.id_grade_verbas;
            v_vl_percentual := 0;
            v_sinal := '';
            IF (cpd.vl_percentual_total < 100) THEN
                v_vl_percentual := 100 - cpd.vl_percentual_total;
                v_sinal := '+';
            END IF;
            IF (cpd.vl_percentual_total > 100) THEN
                v_vl_percentual := cpd.vl_percentual_total - 100;
                v_sinal := '-';
            END IF;

            BEGIN
                IF (cpd.vl_percentual_docencia <> 0) THEN
                    IF (v_sinal = '+') THEN
                        update ca.dre_grade_verbas
                           set vl_percentual_docencia = vl_percentual_docencia + v_vl_percentual
                         where id_grade_verbas = v_id_grade_verbas;
                    END IF;
                    IF (v_sinal = '-') THEN
                        update ca.dre_grade_verbas
                           set vl_percentual_docencia = vl_percentual_docencia - v_vl_percentual
                         where id_grade_verbas = v_id_grade_verbas;
                    END IF;
                    v_qtd_linhas := v_qtd_linhas + 1;
                ELSE
                    IF (cpd.vl_percentual_pos <> 0) THEN
                        IF (v_sinal = '+') THEN
                            update ca.dre_grade_verbas
                               set vl_percentual_pos = vl_percentual_pos + v_vl_percentual
                             where id_grade_verbas = v_id_grade_verbas;
                         END IF;
                         IF (v_sinal = '-') THEN
                             update ca.dre_grade_verbas
                                set vl_percentual_pos = vl_percentual_pos - v_vl_percentual
                              where id_grade_verbas = v_id_grade_verbas;
                         END IF;
                         v_qtd_linhas := v_qtd_linhas + 1;
                    ELSE
                         IF (v_sinal = '+') THEN
                             update ca.dre_grade_verbas
                                set vl_percentual_adm = vl_percentual_adm + v_vl_percentual
                              where id_grade_verbas = v_id_grade_verbas;
                         END IF;
                         IF (v_sinal = '-') THEN
                               update ca.dre_grade_verbas
                                set vl_percentual_adm = vl_percentual_adm - v_vl_percentual
                              where id_grade_verbas = v_id_grade_verbas;
                         END IF;

                         v_qtd_linhas := v_qtd_linhas + 1;
                    END IF;
                END IF;
            EXCEPTION
                when others then
                     p_ds_msg := 'Mensagem: ' || sqlerrm;
                     p_tp_mensagem := 'A';
                     --p_status := 2;
                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;
        END IF;
    END LOOP;
    CLOSE c_perc_docencia;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização na tabela DRE_GRADE_VERBAS do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_VERBAS ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END IF;

    v_qtd_linhas := 0;
    p_ds_msg := 'Atualiza percentual da docência pós.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


    -- Atualiza percentual da docência pós.

    OPEN c_perc_pos;

    LOOP
        FETCH c_perc_pos INTO cpp;

        EXIT WHEN c_perc_pos%NOTFOUND;

        IF  c_perc_pos%FOUND THEN
            IF (cpp.vl_percentual_pos <> 100) THEN
                v_id_grade_verbas_pos := 0;
                BEGIN
                    select max(id_grade_verbas_pos)
                      into v_id_grade_verbas_pos
                      from ca.dre_grade_verbas_pos
                     where id_grade_verbas = cpp.id_grade_verbas;
                EXCEPTION
                     when no_data_found then
                          v_mensagem := cpp.id_grade_verbas;
                          p_ds_msg := 'Não existe professor ' || v_mensagem || '.';
                          p_tp_mensagem := 'A';
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;

                IF (v_id_grade_verbas_pos <> 0) THEN
                    v_vl_percentual := 0;
                    v_sinal := '';
                    IF (cpp.vl_percentual_pos < 100) THEN
                        v_vl_percentual := 100 - cpp.vl_percentual_pos;
                        v_sinal := '+';
                    END IF;
                    IF (cpp.vl_percentual_pos > 100) THEN
                        v_vl_percentual := cpp.vl_percentual_pos - 100;
                        v_sinal := '-';
                    END IF;

                    BEGIN
                         IF (v_sinal = '+') THEN
                              update ca.dre_grade_verbas_pos
                                 set vl_percentual_pos = vl_percentual_pos + v_vl_percentual
                               where id_grade_verbas_pos = v_id_grade_verbas_pos;
                         END IF;
                         IF (v_sinal = '-') THEN
                              update ca.dre_grade_verbas_pos
                                 set vl_percentual_pos = vl_percentual_pos - v_vl_percentual
                               where id_grade_verbas_pos = v_id_grade_verbas_pos;
                         END IF;
                           v_qtd_linhas := v_qtd_linhas + 1;
                    EXCEPTION
                        when others then
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                END IF;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_perc_pos;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização na tabela DRE_GRADE_VERBAS_POS do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_VERBAS_POS ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;
    p_ds_msg := 'Atualiza percentual do administrativo.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    -- Atualiza percentual do administrativo.

    OPEN c_perc_adm;

    LOOP
        FETCH c_perc_adm INTO cpa;

        EXIT WHEN c_perc_adm%NOTFOUND;

        IF  c_perc_adm%FOUND THEN
            IF (cpa.vl_percentual_adm <> 100) THEN
                v_id_grade_verbas_adm := 0;
                BEGIN
                    select max(id_grade_verbas_adm)
                      into v_id_grade_verbas_adm
                      from ca.dre_grade_verbas_adm
                     where id_grade_verbas = cpa.id_grade_verbas;
                EXCEPTION
                     when no_data_found then
                          v_mensagem := cpa.id_grade_verbas;
                          p_ds_msg := 'Não existe professor ' || v_mensagem || '.';
                          p_tp_mensagem := 'A';
                          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;

                IF (v_id_grade_verbas_adm <> 0) THEN
                    v_vl_percentual := 0;
                    v_sinal := '';
                    IF (cpa.vl_percentual_adm < 100) THEN
                        v_vl_percentual := 100 - cpa.vl_percentual_adm;
                        v_sinal := '+';
                    END IF;
                    IF (cpa.vl_percentual_adm > 100) THEN
                        v_vl_percentual := cpa.vl_percentual_adm - 100;
                        v_sinal := '-';
                    END IF;

                    BEGIN
                        IF (v_sinal = '+') THEN
                            update ca.dre_grade_verbas_adm
                               set vl_percentual_adm = vl_percentual_adm + v_vl_percentual
                             where id_grade_verbas_adm = v_id_grade_verbas_adm;
                        END IF;
                        IF (v_sinal = '-') THEN
                            update ca.dre_grade_verbas_adm
                               set vl_percentual_adm = vl_percentual_adm - v_vl_percentual
                             where id_grade_verbas_adm = v_id_grade_verbas_adm;
                        END IF;
                           v_qtd_linhas := v_qtd_linhas + 1;


                    EXCEPTION
                        when others then
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
                END IF;
            END IF;
        END IF;
    END LOOP;
    CLOSE c_perc_adm;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização na tabela DRE_GRADE_VERBAS_ADM do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_VERBAS_ADM ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_PROPORCIONALIZA_VERBAS;

PROCEDURE P_APURA_CUSTO_SISPRO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    -- Apura custo nas grades de verba e cria vl_aproplicacao_indireta
    v_dt_folha                    DATE;
    v_cd_professor                VARCHAR2 (7)    := NULL;
    v_mensagem                    VARCHAR2 (1000) := NULL;
    v_nr_ano                      VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)    := NULL;
    v_qtd_linhas                  NUMBER   (6)    := 0;
    v_vl_apropriacao              NUMBER   (15,2) := 0;
    v_vl_docencia                 NUMBER   (15,2) := 0;
    v_vl_docencia_pos             NUMBER   (15,2) := 0;
    v_vl_adm                      NUMBER   (15,2) := 0;
    v_vl_disciplina_turma         NUMBER   (15,2) := 0;
    v_id_grade_alocacao_docente   NUMBER   (8)    := 0;
    v_id_estrutura_org_ex         NUMBER   (8)    := 0;
    v_id_plano_de_contas          NUMBER   (8)    := 0;
    v_id_grade_verbas             NUMBER   (8)    := 0;
    v_cd_disciplina               VARCHAR2 (4)    := NULL;
    v_cd_turma                    NUMBER   (2)    := 0;
    v_cd_curso                    NUMBER   (4)    := 0;
    v_cd_centro_custo_ebs         VARCHAR2 (30)   := NULL;
    v_qtd_disc                    NUMBER   (6)    := 0;
    v_qtd_mat                     NUMBER   (6)    := 0;
    v_qtd_mem                     NUMBER   (6)    := 0;
    v_qtd_adm                     NUMBER   (6)    := 0;
    v_id_vl_apropriacao_indireta  NUMBER   (8)    := 0;
    v_id_vl_apropriacao_ind_ex    NUMBER   (8)    := 0;
    v_vl_custo_ex                 NUMBER   (15,2) := 0;
    p_id_plano_execucao           NUMBER   (8)    := 0;
    p_id_controle_execucao        NUMBER   (8)    := 0;
    p_ds_msg                      VARCHAR2 (500)  := NULL;
    p_tp_mensagem                 VARCHAR2 (1)    := NULL;
    p_status                      VARCHAR2 (1)    := NULL;

    v_cd_indicador_un_negocio     NUMBER   (3)    := 0;
    v_tp_conta                    NUMBER   (1)    := 0;

    cursor c_apura_custo is
           select v.cd_professor,v.cd_estabelecimento,v.nr_registro,
                 (sum(decode(vf.tipo_lancto,'DB',vf.valor,0)) - sum(decode(vf.tipo_lancto,'CR',vf.valor,0))) vl_custo
             from ca.ebs_fp_verbas_funcionarios vf,
                  ca.dre_grade_verbas v
            where vf.competencia = v_dt_folha
              and ((vf.cta_contabil like '5201%') or (vf.cta_contabil like '6201%') or (vf.cta_contabil like '6401%'))
              and vf.competencia = v.dt_folha
              and to_number(trim(vf.estb)) = v.cd_estabelecimento
              and to_number(trim(vf.matricula)) = v.nr_registro
              --and v.id_grade_verbas = 2374
         group by v.cd_professor,v.cd_estabelecimento,v.nr_registro
         order by v.cd_professor,v.cd_estabelecimento,v.nr_registro;


    cursor c_calcula_custo is
            select id_grade_verbas, dt_folha, cd_professor, vl_docencia, vl_percentual_docencia, vl_adm, vl_percentual_adm,
                   vl_pos, vl_percentual_pos, vl_custo, cd_estabelecimento, nr_registro,
                   --to_char(nr_registro,'0000000') nr_registro,
                   fl_n_disc, fl_n_mat, fl_n_mem, fl_n_adm
              from ca.dre_grade_verbas v
             where v.dt_folha = v_dt_folha
          order by v.id_grade_verbas;

    cursor c_grade_alocacao_docente is
           select *
             from ca.dre_grade_alocacao_docente
            where dt_folha = v_dt_folha
              and trim(cd_professor) = trim(v_cd_professor);

    cursor c_grade_disciplina_turma is
           select *
             from ca.dre_grade_disciplina_turma
            where dt_folha = v_dt_folha
              and trim(cd_disciplina) = trim(v_cd_disciplina)
              and trim(cd_turma) = trim(v_cd_turma)
              and id_grade_alocacao_docente is not null
              and id_grade_alocacao_docente = v_id_grade_alocacao_docente;
              --and trim(cd_curso) = trim(v_cd_curso)

    cursor c_grade_verbas_pos is
           select *
             from ca.dre_grade_verbas_pos
            where id_grade_verbas = v_id_grade_verbas
           order by id_grade_verbas;

    cursor c_grade_verbas_adm is
           select *
             from ca.dre_grade_verbas_adm
            where id_grade_verbas = v_id_grade_verbas
         order by id_grade_verbas;

    cac             c_apura_custo%ROWTYPE;
    ccc             c_calcula_custo%ROWTYPE;
    gad             c_grade_alocacao_docente%ROWTYPE;
    gdt             c_grade_disciplina_turma%ROWTYPE;
    gvp             c_grade_verbas_pos%ROWTYPE;
    gva             c_grade_verbas_adm%ROWTYPE;
   -- cta             c_tecnico_adm%ROWTYPE;

BEGIN

    -- Busca código do plano de execução --
    select id_plano_execucao
      into p_id_plano_execucao
      from ca.dre_plano_execucao
     where nm_procedure = 'P_APURA_CUSTO_SISPRO';


    s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                   p_nr_mes,
                                                   p_id_plano_execucao,
                                                   p_cd_estabelecimento,
                                                   p_nr_registro,
                                                   p_id_controle_execucao);


    p_status := 1;

    v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
    v_nr_ano_ebs := substr(v_nr_ano,3,2);
    v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
    v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

    v_qtd_linhas := 0;

    p_ds_msg := 'Apura custo no Sispro e atualiza tabela de grade de verbas.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


    -- Apura custo no Sispro e atualiza tabela de grade de verbas.

    OPEN c_apura_custo;

    LOOP
        FETCH c_apura_custo INTO cac;

        EXIT WHEN c_apura_custo%NOTFOUND;

        IF c_apura_custo%FOUND THEN
           v_id_grade_verbas := 0;
           BEGIN
               -- Verificar código na grade de verbas
               select id_grade_verbas
                 into v_id_grade_verbas
                 from ca.dre_grade_verbas
                where dt_folha = v_dt_folha
                  and cd_estabelecimento = cac.cd_estabelecimento
                  and nr_registro = cac.nr_registro;
           EXCEPTION
                 when no_data_found then
                      BEGIN
                          v_qtd_linhas := v_qtd_linhas + 1;
                          INSERT INTO ca.dre_grade_verbas
                                      (ID_GRADE_VERBAS,
                                       DT_FOLHA,
                                       CD_PROFESSOR,
                                       VL_DOCENCIA,
                                       VL_PERCENTUAL_DOCENCIA,
                                       VL_ADM,
                                       VL_PERCENTUAL_ADM,
                                       VL_POS,
                                       VL_PERCENTUAL_POS,
                                       VL_CUSTO,
                                       CD_ESTABELECIMENTO,
                                       NR_REGISTRO
                                      )
                               VALUES (ca.sq_dre_grade_verbas.nextval,
                                       v_dt_folha,
                                       cac.cd_professor,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       cac.vl_custo,
                                       cac.cd_estabelecimento,
                                       cac.nr_registro
                                      );

                      EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                      END;
           END;

           IF (v_id_grade_verbas <> 0) THEN
               BEGIN
                   update ca.dre_grade_verbas
                      set vl_custo = cac.vl_custo
                    where id_grade_verbas  = v_id_grade_verbas;
                    v_qtd_linhas := v_qtd_linhas + 1;
               EXCEPTION
                  WHEN OTHERS THEN
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;

               -- Tratamento para dois casos que estão na grade com custo e sem valores na docência, adm e pós.
               BEGIN
                   update ca.dre_grade_verbas
                      set vl_adm = cac.vl_custo
                    where id_grade_verbas  = v_id_grade_verbas
                      and vl_custo <> 0
                      and vl_docencia = 0
                      and vl_adm = 0
                      and vl_pos = 0
                      and vl_percentual_adm <> 0;
                    v_qtd_linhas := v_qtd_linhas + 1;
               EXCEPTION
                  WHEN OTHERS THEN
                       p_ds_msg := 'Mensagem: ' || sqlerrm;
                       p_tp_mensagem := 'A';
                       --p_status := 2;
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
               END;

           END IF;
        END IF;
    END LOOP;
    CLOSE c_apura_custo;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada atualização na DRE_GRADE_VERBAS do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas alteradas na tabela DRE_GRADE_VERBAS ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    v_qtd_linhas := 0;

    p_ds_msg := 'Calcula custo e atualiza tabela de apropriação indireta.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


    -- Calcula custo e atualiza tabela de apropriação indireta.

    -- Zerar flags --
    BEGIN
        update ca.dre_grade_verbas
           set fl_n_disc = 0,
               fl_n_mat = 0,
               fl_n_mem = 0,
               fl_n_adm = 0
         where dt_folha = v_dt_folha;
    EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               p_tp_mensagem := 'A';
               --p_status := 2;
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END;
    commit;
    -- Zerar vl_custo na grade de verbas pós --
    BEGIN
        update ca.dre_grade_verbas_pos p
           set vl_custo = 0, id_vl_apropriacao_indireta = null
         where exists (select 1
                         from ca.dre_grade_verbas v
                        where v.dt_folha = v_dt_folha
                          and v.id_grade_verbas = p.id_grade_verbas);
    EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               p_tp_mensagem := 'A';
               --p_status := 2;
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END;
    commit;
    -- Zerar vl_custo na grade de verbas adm --
    BEGIN
        update ca.dre_grade_verbas_adm a
           set vl_custo = 0, id_vl_apropriacao_indireta = null
         where exists (select 1
                         from ca.dre_grade_verbas v
                        where v.dt_folha = v_dt_folha
                          and v.id_grade_verbas = a.id_grade_verbas);
    EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               p_tp_mensagem := 'A';
               --p_status := 2;
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END;
    commit;
    -- Zerar vl_custo na grade alocação docente --
    BEGIN
        update ca.dre_grade_alocacao_docente
           set vl_custo = 0, id_vl_apropriacao_indireta = null
         where dt_folha = v_dt_folha;
    EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               p_tp_mensagem := 'A';
               --p_status := 2;
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END;
    commit;
    -- Zerar vl_custo na grade disciplina turma --
    BEGIN
        update ca.dre_grade_disciplina_turma
           set vl_custo = 0, id_vl_apropriacao_indireta = null
         where dt_folha = v_dt_folha;
    EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               p_tp_mensagem := 'A';
               --p_status := 2;
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END;
    commit;
    OPEN c_calcula_custo;

    LOOP
        FETCH c_calcula_custo INTO ccc;

        EXIT WHEN c_calcula_custo%NOTFOUND;

        IF c_calcula_custo%FOUND THEN
           -- Graduação --
           IF (ccc.vl_percentual_docencia <> 0) THEN
               v_vl_docencia := ccc.vl_custo * ccc.vl_percentual_docencia / 100;
               v_cd_professor := ccc.cd_professor;

               v_qtd_disc := 0;
               -- Para cada disciplina turma do docente --
               OPEN c_grade_alocacao_docente;

               LOOP
                  FETCH c_grade_alocacao_docente INTO gad;

                  EXIT WHEN c_grade_alocacao_docente%NOTFOUND;

                  IF c_grade_alocacao_docente%FOUND THEN
                     v_qtd_disc := v_qtd_disc + 1;
                     v_qtd_mat := 0;
                     -- Para cada disciplina turma
                     v_vl_disciplina_turma := v_vl_docencia * gad.vl_percentual / 100;

                     v_cd_disciplina := gad.cd_disciplina;
                     v_cd_turma := gad.cd_turma;
                     v_id_grade_alocacao_docente := gad.id_grade_alocacao_docente;

                     OPEN c_grade_disciplina_turma;

                     LOOP
                        --v_cd_disciplina := gad.cd_disciplina;
                        --v_cd_turma := gad.cd_turma;
                        ----v_cd_curso := gad.cd_curso;
                        ----v_id_grade_alocacao_docente := gad.id_grade_alocacao_docente;

                        FETCH c_grade_disciplina_turma INTO gdt;

                        EXIT WHEN c_grade_disciplina_turma%NOTFOUND;

                        IF c_grade_disciplina_turma%FOUND THEN
                           v_qtd_mat := v_qtd_mat + 1;
                           -- Verifica centro de custo do curso
                           BEGIN
                               v_cd_centro_custo_ebs := '';
                               select cd_centro_custo_ebs
                                 into v_cd_centro_custo_ebs
                                 from ca.curso cur,
                                      al.centro_custo cc
                                where cur.cd_curso = gdt.cd_curso
                                  and cc.cd_centro_custo = cur.cd_centro_custo;
                           EXCEPTION
                                when no_data_found then
                                     v_mensagem := gdt.cd_curso;
                                     p_ds_msg := 'Curso não encontrado: ' || v_mensagem;
                                     p_tp_mensagem := 'A';
                                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END;

                           -- Para cada curso
                           -- Localizar parâmetro de conversão do centro de custo do curso de graduação na tabela CA.DRE_ESTRUTURA_ORG_EX
                           BEGIN
                               select eo.id_estrutura_org_ex
                                 into v_id_estrutura_org_ex
                                 from ca.dre_estrutura_org_ex eo,
                                      ca.dre_estrutura_org_itens_ex eoi
                                where eo.nr_ano = p_nr_ano
                                  and eo.nr_mes = p_nr_mes
                                  and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                                  and trim(eoi.cd_centro_custo_ebs) = trim(v_cd_centro_custo_ebs);
                           EXCEPTION
                                when no_data_found then
                                     v_mensagem := v_cd_centro_custo_ebs;
                                     p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                                     p_tp_mensagem := 'A';
                                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END;

                           -- Localizar conta de custos na tabela CA.DRE_PLANO_DE_CONTAS
                           BEGIN
                               select id_plano_de_contas
                                 into v_id_plano_de_contas
                                 from ca.dre_plano_de_contas
                                where tp_conta = 1;
                           EXCEPTION
                                when no_data_found then
                                     p_ds_msg := 'Conta de custo não existe no plano de contas: ' || sqlerrm;
                                     p_tp_mensagem := 'A';
                                     --p_status := 2;
                                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END;

                           v_vl_apropriacao := v_vl_disciplina_turma * gdt.vl_percentual / 100;

                           v_id_vl_apropriacao_indireta := 0;
                           BEGIN
                              v_qtd_linhas := v_qtd_linhas + 1;
                              v_id_vl_apropriacao_indireta := ca.sq_dre_vl_apropriacao_indireta.nextval;
                              INSERT INTO ca.dre_vl_apropriacao_indireta
                                          (ID_VL_APROPRIACAO_INDIRETA,
                                           NR_ANO,
                                           NR_MES,
                                           ID_PLANO_CONTAS,
                                           ID_ESTRUTURA_ORG_EX,
                                           VL_APROPRIACAO,
                                           CD_CENTRO_CUSTO_ORIGEM,
                                           TP_ORIGEM,
                                           ID_GRADE_VERBAS
                                          )
                                   VALUES (v_id_vl_apropriacao_indireta,
                                           p_nr_ano,
                                           p_nr_mes,
                                           v_id_plano_de_contas,
                                           v_id_estrutura_org_ex,
                                           v_vl_apropriacao * -1,
                                           v_cd_centro_custo_ebs,
                                           3,
                                           ccc.id_grade_verbas
                                           );
                           EXCEPTION
                              WHEN OTHERS THEN
                                   p_ds_msg := 'Mensagem: ' || sqlerrm;
                                   p_tp_mensagem := 'A';
                                   --p_status := 2;
                                   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END;

                           -- Atualização da Grade de Disciplina Turma --
                           v_id_vl_apropriacao_ind_ex := 0;
                           v_vl_custo_ex := 0;
                           BEGIN
                              select id_vl_apropriacao_indireta, vl_custo
                                into v_id_vl_apropriacao_ind_ex, v_vl_custo_ex
                                from ca.dre_grade_disciplina_turma
                               where id_grade_disciplina_turma = gdt.id_grade_disciplina_turma;
                                 --and vl_custo <> 0
                                 --and id_vl_apropriacao_indireta is not null;
                           EXCEPTION
                              WHEN OTHERS THEN
                                   p_ds_msg := 'Mensagem: ' || sqlerrm;
                                   p_tp_mensagem := 'A';
                                   --p_status := 2;
                                   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END;

                           IF (v_id_vl_apropriacao_ind_ex <> 0 and v_vl_custo_ex <> 0) THEN

                               p_ds_msg := 'Apropriação Indireta: ' || v_id_vl_apropriacao_ind_ex ||
                                           ' - Vl. Custo: ' || v_vl_custo_ex ||
                                           ' Grade de Verbas Disciplina Turma: ' || gdt.id_grade_disciplina_turma;
                               p_tp_mensagem := 'A';
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END IF;

                           update ca.dre_grade_disciplina_turma
                              set vl_custo = (nvl(vl_custo,0) + (v_vl_apropriacao * -1)),
                                  id_vl_apropriacao_indireta = v_id_vl_apropriacao_indireta
                            where id_grade_disciplina_turma = gdt.id_grade_disciplina_turma;

                        END IF;
                     END LOOP;
                     CLOSE c_grade_disciplina_turma;

                     -- Se não existir grade disciplina turma
                     IF (v_qtd_mat = 0) THEN
                         -- Verifica centro de custo do curso
                         BEGIN
                             v_cd_centro_custo_ebs := '';
                             select distinct vf.centro_custo
                               into v_cd_centro_custo_ebs
                               from ca.ebs_fp_verbas_funcionarios vf
                              where vf.competencia = v_dt_folha
                                and ((vf.cta_contabil like '5201%') or (vf.cta_contabil like '6201%') or (vf.cta_contabil like '6401%'))
                                and to_number(trim(vf.estb)) = ccc.cd_estabelecimento
                                and to_number(trim(vf.matricula)) = ccc.nr_registro;
                         EXCEPTION
                              when no_data_found then
                                   v_mensagem := ccc.nr_registro;
                                   p_ds_msg := 'Matricula não encontrada: ' || v_mensagem;
                                   p_tp_mensagem := 'A';
                                   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                         END;

                         -- Para cada curso
                         -- Localizar parâmetro de conversão do centro de custo do curso de graduação na tabela CA.DRE_ESTRUTURA_ORG_EX
                         BEGIN
                             select eo.id_estrutura_org_ex
                               into v_id_estrutura_org_ex
                               from ca.dre_estrutura_org_ex eo,
                                    ca.dre_estrutura_org_itens_ex eoi
                              where eo.nr_ano = p_nr_ano
                                and eo.nr_mes = p_nr_mes
                                and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                                and trim(eoi.cd_centro_custo_ebs) = trim(v_cd_centro_custo_ebs);
                         EXCEPTION
                              when no_data_found then
                                   v_mensagem := v_cd_centro_custo_ebs;
                                   p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                                   p_tp_mensagem := 'A';
                                   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                         END;

                         -- Localizar conta de custos na tabela CA.DRE_PLANO_DE_CONTAS
                         BEGIN
                             select id_plano_de_contas
                               into v_id_plano_de_contas
                               from ca.dre_plano_de_contas
                              where tp_conta = 1;
                         EXCEPTION
                              when no_data_found then
                                   p_ds_msg := 'Conta de custo não existe no plano de contas: ' || sqlerrm;
                                   p_tp_mensagem := 'A';
                                   --p_status := 2;
                                   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                         END;

                         v_vl_apropriacao := v_vl_disciplina_turma;

                         v_id_vl_apropriacao_indireta := 0;
                         BEGIN
                            v_qtd_linhas := v_qtd_linhas + 1;
                            v_id_vl_apropriacao_indireta := ca.sq_dre_vl_apropriacao_indireta.nextval;
                            INSERT INTO ca.dre_vl_apropriacao_indireta
                                        (ID_VL_APROPRIACAO_INDIRETA,
                                         NR_ANO,
                                         NR_MES,
                                         ID_PLANO_CONTAS,
                                         ID_ESTRUTURA_ORG_EX,
                                         VL_APROPRIACAO,
                                         CD_CENTRO_CUSTO_ORIGEM,
                                         TP_ORIGEM,
                                         ID_GRADE_VERBAS
                                        )
                                 VALUES (v_id_vl_apropriacao_indireta,
                                         p_nr_ano,
                                         p_nr_mes,
                                         v_id_plano_de_contas,
                                         v_id_estrutura_org_ex,
                                         v_vl_apropriacao * -1,
                                         v_cd_centro_custo_ebs,
                                         2,
                                         ccc.id_grade_verbas
                                         );
                         EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                         END;

                         v_id_vl_apropriacao_ind_ex := 0;
                         v_vl_custo_ex := 0;
                         BEGIN
                              select id_vl_apropriacao_indireta, vl_custo
                                into v_id_vl_apropriacao_ind_ex, v_vl_custo_ex
                                from ca.dre_grade_alocacao_docente
                               where id_grade_alocacao_docente = gad.id_grade_alocacao_docente;
                                 --and vl_custo <> 0
                                 --and id_vl_apropriacao_indireta is not null;
                         EXCEPTION
                              WHEN OTHERS THEN
                                   p_ds_msg := 'Mensagem: ' || sqlerrm;
                                   p_tp_mensagem := 'A';
                                   --p_status := 2;
                                   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                         END;

                         IF (v_id_vl_apropriacao_ind_ex <> 0 and v_vl_custo_ex <> 0) THEN
                             p_ds_msg := 'Apropriação Indireta: ' || v_id_vl_apropriacao_ind_ex ||
                                         ' - Vl. Custo: ' || v_vl_custo_ex ||
                                         ' Grade de Verbas Alocação: ' || gad.id_grade_alocacao_docente;
                             p_tp_mensagem := 'A';
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                         END IF;

                         update ca.dre_grade_verbas
                            set fl_n_mat = 1
                          where id_grade_verbas = ccc.id_grade_verbas;

                         -- Atualização da Grade de Alocação Docente --
                         update ca.dre_grade_alocacao_docente
                            set vl_custo = (nvl(vl_custo,0) + (v_vl_apropriacao * -1)),
                                id_vl_apropriacao_indireta = v_id_vl_apropriacao_indireta
                          where id_grade_alocacao_docente = gad.id_grade_alocacao_docente;

                     END IF;
                 --END IF;
                  END IF;
               END LOOP;
               CLOSE c_grade_alocacao_docente;

               -- Se não existir grade alocação de docente
               IF (v_qtd_disc = 0) THEN
                   -- Verifica centro de custo do curso
                   BEGIN
                       v_cd_centro_custo_ebs := '';
                       select distinct vf.centro_custo
                         into v_cd_centro_custo_ebs
                         from ca.ebs_fp_verbas_funcionarios vf
                        where vf.competencia = v_dt_folha
                          and ((vf.cta_contabil like '5201%') or (vf.cta_contabil like '6201%') or (vf.cta_contabil like '6401%'))
                          and to_number(trim(vf.estb)) = ccc.cd_estabelecimento
                          and to_number(trim(vf.matricula)) = ccc.nr_registro;
                   EXCEPTION
                        when no_data_found then
                             v_mensagem := ccc.nr_registro;
                             p_ds_msg := 'Matricula não encontrada: ' || v_mensagem;
                             p_tp_mensagem := 'A';
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   -- Para cada curso
                   -- Localizar parâmetro de conversão do centro de custo do curso de graduação na tabela CA.DRE_ESTRUTURA_ORG_EX
                   BEGIN
                       select eo.id_estrutura_org_ex
                         into v_id_estrutura_org_ex
                         from ca.dre_estrutura_org_ex eo,
                              ca.dre_estrutura_org_itens_ex eoi
                        where eo.nr_ano = p_nr_ano
                          and eo.nr_mes = p_nr_mes
                          and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                          and trim(eoi.cd_centro_custo_ebs) = trim(v_cd_centro_custo_ebs);
                   EXCEPTION
                        when no_data_found then
                             v_mensagem := v_cd_centro_custo_ebs;
                             p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                             p_tp_mensagem := 'A';
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   -- Localizar conta de custos na tabela CA.DRE_PLANO_DE_CONTAS
                   BEGIN
                       select id_plano_de_contas
                         into v_id_plano_de_contas
                         from ca.dre_plano_de_contas
                        where tp_conta = 1;
                   EXCEPTION
                        when no_data_found then
                             p_ds_msg := 'Conta de custo não existe no plano de contas: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   v_vl_apropriacao := v_vl_docencia;

                   v_id_vl_apropriacao_indireta := 0;
                   BEGIN
                      v_qtd_linhas := v_qtd_linhas + 1;
                      v_id_vl_apropriacao_indireta := ca.sq_dre_vl_apropriacao_indireta.nextval;
                      INSERT INTO ca.dre_vl_apropriacao_indireta
                                  (ID_VL_APROPRIACAO_INDIRETA,
                                   NR_ANO,
                                   NR_MES,
                                   ID_PLANO_CONTAS,
                                   ID_ESTRUTURA_ORG_EX,
                                   VL_APROPRIACAO,
                                   CD_CENTRO_CUSTO_ORIGEM,
                                   TP_ORIGEM,
                                   ID_GRADE_VERBAS
                                  )
                           VALUES (v_id_vl_apropriacao_indireta,
                                   p_nr_ano,
                                   p_nr_mes,
                                   v_id_plano_de_contas,
                                   v_id_estrutura_org_ex,
                                   v_vl_apropriacao * -1,
                                   v_cd_centro_custo_ebs,
                                   1,
                                   ccc.id_grade_verbas
                                   );
                   EXCEPTION
                      WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   v_id_vl_apropriacao_ind_ex := 0;
                   v_vl_custo_ex := 0;
                   BEGIN
                      select id_vl_apropriacao_indireta, vl_custo
                        into v_id_vl_apropriacao_ind_ex, v_vl_custo_ex
                        from ca.dre_grade_verbas
                       where id_grade_verbas = ccc.id_grade_verbas;
                         --and vl_custo <> 0
                         --and id_vl_apropriacao_indireta is not null;
                   EXCEPTION
                      WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   IF (v_id_vl_apropriacao_ind_ex <> 0 and v_vl_custo_ex <> 0) THEN
                       p_ds_msg := 'Apropriação Indireta: ' || v_id_vl_apropriacao_ind_ex ||
                                   ' - Vl. Custo: ' || v_vl_custo_ex ||
                                   ' Grade de Verbas: ' || ccc.id_grade_verbas;
                       p_tp_mensagem := 'A';
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END IF;

                   -- Professor não dá nenhuma disciplina
                   update ca.dre_grade_verbas
                      set fl_n_disc = 1,
                          id_vl_apropriacao_indireta = v_id_vl_apropriacao_indireta
                    where id_grade_verbas = ccc.id_grade_verbas;

               END IF;
               commit;
           END IF;

           -- Pós-Graduação --
           IF (ccc.vl_percentual_pos <> 0) THEN
               v_vl_docencia_pos := ccc.vl_custo * ccc.vl_percentual_pos / 100;
               v_id_grade_verbas := ccc.id_grade_verbas;

               v_qtd_mem := 0;
               -- Para cada curso da pós-graduação --
               OPEN c_grade_verbas_pos;

               LOOP
                  FETCH c_grade_verbas_pos INTO gvp;

                  EXIT WHEN c_grade_verbas_pos%NOTFOUND;

                  IF c_grade_verbas_pos%FOUND THEN
                     v_qtd_mem := v_qtd_mem + 1;
                     -- Localizar parâmetro de conversão do centro de custo do curso de graduação na tabela CA.DRE_ESTRUTURA_ORG_EX
                     BEGIN
                         select eo.id_estrutura_org_ex
                           into v_id_estrutura_org_ex
                           from ca.dre_estrutura_org_ex eo,
                                ca.dre_estrutura_org_itens_ex eoi
                          where eo.nr_ano = p_nr_ano
                            and eo.nr_mes = p_nr_mes
                            and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                            and trim(eoi.cd_centro_custo_ebs) = trim(gvp.cd_centro_custo_ebs);
                     EXCEPTION
                          when no_data_found then
                               v_mensagem := gvp.cd_centro_custo_ebs;
                               p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                               p_tp_mensagem := 'A';
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     -- Localizar conta de custos na tabela CA.DRE_PLANO_DE_CONTAS
                     BEGIN
                         select id_plano_de_contas
                           into v_id_plano_de_contas
                           from ca.dre_plano_de_contas
                          where tp_conta = 1;
                     EXCEPTION
                          when no_data_found then
                               p_ds_msg := 'Conta de custo não existe no plano de contas: ' || sqlerrm;
                               p_tp_mensagem := 'A';
                               --p_status := 2;
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     v_vl_apropriacao := v_vl_docencia_pos * gvp.vl_percentual_pos / 100;
                     v_id_vl_apropriacao_indireta := 0;

                     BEGIN
                        v_qtd_linhas := v_qtd_linhas + 1;
                        v_id_vl_apropriacao_indireta := ca.sq_dre_vl_apropriacao_indireta.nextval;
                        INSERT INTO ca.dre_vl_apropriacao_indireta
                                    (ID_VL_APROPRIACAO_INDIRETA,
                                     NR_ANO,
                                     NR_MES,
                                     ID_PLANO_CONTAS,
                                     ID_ESTRUTURA_ORG_EX,
                                     VL_APROPRIACAO,
                                     CD_CENTRO_CUSTO_ORIGEM,
                                     TP_ORIGEM,
                                     ID_GRADE_VERBAS
                                    )
                             VALUES (v_id_vl_apropriacao_indireta,
                                     p_nr_ano,
                                     p_nr_mes,
                                     v_id_plano_de_contas,
                                     v_id_estrutura_org_ex,
                                     v_vl_apropriacao * -1,
                                     gvp.cd_centro_custo_ebs,
                                     4,
                                     v_id_grade_verbas
                                     );
                     EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     v_id_vl_apropriacao_ind_ex := 0;
                     v_vl_custo_ex := 0;
                     BEGIN
                        select id_vl_apropriacao_indireta, vl_custo
                          into v_id_vl_apropriacao_ind_ex, v_vl_custo_ex
                          from ca.dre_grade_verbas_pos
                         where id_grade_verbas_pos = gvp.id_grade_verbas_pos;
                           --and vl_custo <> 0
                           --and id_vl_apropriacao_indireta is not null;
                     EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     IF (v_id_vl_apropriacao_ind_ex <> 0 and v_vl_custo_ex <> 0) THEN
                         p_ds_msg := 'Apropriação Indireta: ' || v_id_vl_apropriacao_ind_ex ||
                                                      ' - Vl. Custo: ' || v_vl_custo_ex ||
                                                  ' Grade de Verbas Pos: ' || gvp.id_grade_verbas_pos;
                         p_tp_mensagem := 'A';
                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END IF;

                     -- Atualização da Grade Verbas Pós --
                     update ca.dre_grade_verbas_pos
                        set vl_custo = (nvl(vl_custo,0) + (v_vl_apropriacao * -1)),
                            id_vl_apropriacao_indireta = v_id_vl_apropriacao_indireta
                      where id_grade_verbas_pos = gvp.id_grade_verbas_pos;
                  END IF;
               END LOOP;
               CLOSE c_grade_verbas_pos;

               -- Se nao existir grade de verbas da pós
              IF (v_qtd_mem = 0) THEN
                  -- Verifica centro de custo do curso
                   --BEGIN

                       v_cd_centro_custo_ebs := '1405601001';	--VICE-REITORIA DE PESQUISA E PÓS-GRADUAÇÃO 
                     --  Conforme CI 10/06/2019
                  --     select distinct vf.centro_custo
                  --       into v_cd_centro_custo_ebs
                  --       from ca.ebs_fp_verbas_funcionarios vf
                  --      where vf.competencia = v_dt_folha
                  --        and ((vf.cta_contabil like '5201%') or (vf.cta_contabil like '6201%') or (vf.cta_contabil like '6401%'))
                  --        and to_number(trim(vf.estb)) = ccc.cd_estabelecimento
                  --        and to_number(trim(vf.matricula)) = ccc.nr_registro;
                  -- EXCEPTION
                  --      when no_data_found then
                  --           v_mensagem := ccc.nr_registro;
                  --           p_ds_msg := 'Matricula não encontrada: ' || v_mensagem;
                  --           p_tp_mensagem := 'A';
                  --           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                  -- END;

                   -- Para cada curso
                   -- Localizar parâmetro de conversão do centro de custo do curso de graduação na tabela CA.DRE_ESTRUTURA_ORG_EX
                   BEGIN
                       select eo.id_estrutura_org_ex
                         into v_id_estrutura_org_ex
                         from ca.dre_estrutura_org_ex eo,
                              ca.dre_estrutura_org_itens_ex eoi
                        where eo.nr_ano = p_nr_ano
                          and eo.nr_mes = p_nr_mes
                          and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                          and trim(eoi.cd_centro_custo_ebs) = trim(v_cd_centro_custo_ebs);
                   EXCEPTION
                        when no_data_found then
                             v_mensagem := v_cd_centro_custo_ebs;
                             p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                             p_tp_mensagem := 'A';
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   -- Localizar conta de custos na tabela CA.DRE_PLANO_DE_CONTAS
                   BEGIN
                       select id_plano_de_contas
                         into v_id_plano_de_contas
                         from ca.dre_plano_de_contas
                        where tp_conta = 1;
                   EXCEPTION
                        when no_data_found then
                             p_ds_msg := 'Conta de custo não existe no plano de contas: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   v_vl_apropriacao := v_vl_docencia_pos;
                   v_id_vl_apropriacao_indireta := 0;

                   BEGIN
                      v_qtd_linhas := v_qtd_linhas + 1;
                      v_id_vl_apropriacao_indireta := ca.sq_dre_vl_apropriacao_indireta.nextval;
                      INSERT INTO ca.dre_vl_apropriacao_indireta
                                  (ID_VL_APROPRIACAO_INDIRETA,
                                   NR_ANO,
                                   NR_MES,
                                   ID_PLANO_CONTAS,
                                   ID_ESTRUTURA_ORG_EX,
                                   VL_APROPRIACAO,
                                   CD_CENTRO_CUSTO_ORIGEM,
                                   TP_ORIGEM,
                                   ID_GRADE_VERBAS
                                  )
                           VALUES (v_id_vl_apropriacao_indireta,
                                   p_nr_ano,
                                   p_nr_mes,
                                   v_id_plano_de_contas,
                                   v_id_estrutura_org_ex,
                                   v_vl_apropriacao * -1,
                                   v_cd_centro_custo_ebs,
                                   5,
                                   v_id_grade_verbas
                                   );
                   EXCEPTION
                      WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   v_id_vl_apropriacao_ind_ex := 0;
                   v_vl_custo_ex := 0;
                   BEGIN
                      select id_vl_apropriacao_indireta, vl_custo
                        into v_id_vl_apropriacao_ind_ex, v_vl_custo_ex
                        from ca.dre_grade_verbas
                       where id_grade_verbas = ccc.id_grade_verbas;
                         --and vl_custo <> 0
                         --and id_vl_apropriacao_indireta is not null;
                   EXCEPTION
                      WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;

                   IF (v_id_vl_apropriacao_ind_ex <> 0 and v_vl_custo_ex <> 0) THEN
                       p_ds_msg := 'Apropriação Indireta: ' || v_id_vl_apropriacao_ind_ex ||
                                   ' - Vl. Custo: ' || v_vl_custo_ex ||
                                   ' Grade de Verbas da Pós: ' || ccc.id_grade_verbas;
                       p_tp_mensagem := 'A';
                       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END IF;

                   -- Professor não está no memorando
                   update ca.dre_grade_verbas
                      set fl_n_mem = 1,
                          id_vl_apropriacao_indireta = v_id_vl_apropriacao_indireta
                    where id_grade_verbas = ccc.id_grade_verbas;

              END IF;
              commit;
           END IF;

           -- Administrativo --
           IF ((ccc.vl_adm <> 0) and (ccc.vl_percentual_adm <> 0)) THEN
               v_vl_adm := ccc.vl_custo * ccc.vl_percentual_adm / 100;
               v_id_grade_verbas := ccc.id_grade_verbas;
               v_qtd_adm := 0;
               -- Para cada cargo ou lotação --
               OPEN c_grade_verbas_adm;

               LOOP
                  FETCH c_grade_verbas_adm INTO gva;

                  EXIT WHEN c_grade_verbas_adm%NOTFOUND;

                  IF c_grade_verbas_adm%FOUND THEN
                     v_qtd_adm := v_qtd_adm + 1;
                     v_cd_indicador_un_negocio := 0;
                     -- Localizar parâmetro de conversão do centro de custo do curso de graduação na tabela CA.DRE_ESTRUTURA_ORG_EX
                     BEGIN
                         select eo.id_estrutura_org_ex, eo.cd_indicador_un_negocio
                           into v_id_estrutura_org_ex, v_cd_indicador_un_negocio
                           from ca.dre_estrutura_org_ex eo,
                                ca.dre_estrutura_org_itens_ex eoi
                          where eo.nr_ano = p_nr_ano
                            and eo.nr_mes = p_nr_mes
                            and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                            and trim(eoi.cd_centro_custo_ebs) = trim(gva.cd_centro_custo_ebs);
                     EXCEPTION
                          when no_data_found then
                               v_mensagem := gva.cd_centro_custo_ebs;
                               p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                               p_tp_mensagem := 'A';
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     v_tp_conta := 2;
                     IF (v_cd_indicador_un_negocio = 1 or v_cd_indicador_un_negocio = 2) THEN
                        v_tp_conta := 5;
                     END IF;
                     IF (v_cd_indicador_un_negocio = 3 ) THEN
                        v_tp_conta := 1;
                     END IF;

                     -- Localizar conta de custos na tabela CA.DRE_PLANO_DE_CONTAS
                     BEGIN
                         select id_plano_de_contas
                           into v_id_plano_de_contas
                           from ca.dre_plano_de_contas
                          where tp_conta = v_tp_conta;
                     EXCEPTION
                          when no_data_found then
                               p_ds_msg := 'Conta de custo não existe no plano de contas: ' || sqlerrm;
                               p_tp_mensagem := 'A';
                               --p_status := 2;
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     v_vl_apropriacao := v_vl_adm * gva.vl_percentual_adm / 100;

                     v_id_vl_apropriacao_indireta := 0;
                     BEGIN
                        v_qtd_linhas := v_qtd_linhas + 1;
                        v_id_vl_apropriacao_indireta := ca.sq_dre_vl_apropriacao_indireta.nextval;
                        INSERT INTO ca.dre_vl_apropriacao_indireta
                                    (ID_VL_APROPRIACAO_INDIRETA,
                                     NR_ANO,
                                     NR_MES,
                                     ID_PLANO_CONTAS,
                                     ID_ESTRUTURA_ORG_EX,
                                     VL_APROPRIACAO,
                                     CD_CENTRO_CUSTO_ORIGEM,
                                     TP_ORIGEM,
                                     ID_GRADE_VERBAS
                                    )
                             VALUES (v_id_vl_apropriacao_indireta,
                                     p_nr_ano,
                                     p_nr_mes,
                                     v_id_plano_de_contas,
                                     v_id_estrutura_org_ex,
                                     v_vl_apropriacao  * -1,
                                     gva.cd_centro_custo_ebs,
                                     6,
                                     v_id_grade_verbas
                                     );
                     EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     -- Atualização da Grade Verbas Adm --
                     update ca.dre_grade_verbas_adm
                        set vl_custo = (nvl(vl_custo,0) + (v_vl_apropriacao * -1)),
                            id_vl_apropriacao_indireta = v_id_vl_apropriacao_indireta
                      where id_grade_verbas_adm = gva.id_grade_verbas_adm;

                  END IF;
               END LOOP;
               CLOSE c_grade_verbas_adm;

               -- Se nao existir grade de verbas adm
                IF (v_qtd_adm = 0) THEN
                    -- Verifica centro de custo do curso
                     BEGIN
                         v_cd_centro_custo_ebs := '';
                         select distinct vf.centro_custo
                           into v_cd_centro_custo_ebs
                           from ca.ebs_fp_verbas_funcionarios vf
                          where vf.competencia = v_dt_folha
                            --and ((vf.cta_contabil like '5201%') or (vf.cta_contabil like '6201%') or (vf.cta_contabil like '6401%'))
                            and to_number(trim(vf.estb)) = ccc.cd_estabelecimento
                            and to_number(trim(vf.matricula)) = ccc.nr_registro;
                     EXCEPTION
                          when no_data_found then
                               v_mensagem := ccc.nr_registro;
                               p_ds_msg := 'Matricula não encontrada: ' || v_mensagem;
                               p_tp_mensagem := 'A';
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     -- Para cada curso
                     -- Localizar parâmetro de conversão do centro de custo do curso de graduação na tabela CA.DRE_ESTRUTURA_ORG_EX
                     v_cd_indicador_un_negocio := 0;
                     BEGIN
                         select eo.id_estrutura_org_ex, eo.cd_indicador_un_negocio
                           into v_id_estrutura_org_ex, v_cd_indicador_un_negocio
                           from ca.dre_estrutura_org_ex eo,
                                ca.dre_estrutura_org_itens_ex eoi
                          where eo.nr_ano = p_nr_ano
                            and eo.nr_mes = p_nr_mes
                            and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                            and trim(eoi.cd_centro_custo_ebs) = trim(v_cd_centro_custo_ebs);
                     EXCEPTION
                          when no_data_found then
                               v_mensagem := v_cd_centro_custo_ebs;
                               p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                               p_tp_mensagem := 'A';
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     -- Localizar conta de custos na tabela CA.DRE_PLANO_DE_CONTAS
                     v_tp_conta := 2;
                     IF (v_cd_indicador_un_negocio = 1 or v_cd_indicador_un_negocio = 2 or v_cd_indicador_un_negocio = 3 ) THEN
                        v_tp_conta := 1;
                     END IF;


                     BEGIN
                         select id_plano_de_contas
                           into v_id_plano_de_contas
                           from ca.dre_plano_de_contas
                          where tp_conta = v_tp_conta;
                     EXCEPTION
                          when no_data_found then
                               p_ds_msg := 'Conta de custo não existe no plano de contas: ' || sqlerrm;
                               p_tp_mensagem := 'A';
                               --p_status := 2;
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     v_vl_apropriacao := v_vl_adm;
                     v_id_vl_apropriacao_indireta := 0;
                     BEGIN
                        v_qtd_linhas := v_qtd_linhas + 1;
                        v_id_vl_apropriacao_indireta := ca.sq_dre_vl_apropriacao_indireta.nextval;
                        INSERT INTO ca.dre_vl_apropriacao_indireta
                                    (ID_VL_APROPRIACAO_INDIRETA,
                                     NR_ANO,
                                     NR_MES,
                                     ID_PLANO_CONTAS,
                                     ID_ESTRUTURA_ORG_EX,
                                     VL_APROPRIACAO,
                                     CD_CENTRO_CUSTO_ORIGEM,
                                     TP_ORIGEM,
                                     ID_GRADE_VERBAS
                                    )
                             VALUES (v_id_vl_apropriacao_indireta,
                                     p_nr_ano,
                                     p_nr_mes,
                                     v_id_plano_de_contas,
                                     v_id_estrutura_org_ex,
                                     v_vl_apropriacao * -1,
                                     v_cd_centro_custo_ebs,
                                     7,
                                     v_id_grade_verbas
                                     );
                     EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;

                     -- Professor não está no memorando
                     update ca.dre_grade_verbas
                        set fl_n_adm = 1,
                            id_vl_apropriacao_indireta = v_id_vl_apropriacao_indireta
                      where id_grade_verbas = ccc.id_grade_verbas;

                END IF;
                commit;

           END IF;
        END IF;
    END LOOP;
    CLOSE c_calcula_custo;
    commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão na DRE_VL_APROPRIACAO_INDIRETA do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas na tabela DRE_VL_APROPRIACAO_INDIRETA ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;


    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_APURA_CUSTO_SISPRO;

PROCEDURE P_VL_APROPRIACAO_DIRETA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                   p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                   p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                   p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_nr_ano                     VARCHAR2 (4)    := null;
    v_nr_ano_ebs                 VARCHAR2 (2)    := null;
    v_nr_mes_ebs                 VARCHAR2 (2)    := null;
    v_cd_ccusto_ebs              VARCHAR2 (30)   := null;
    v_cd_ccusto_ebs_ex           VARCHAR2 (30)   := null;
    v_cd_ccontabil_ebs           VARCHAR2 (30)   := NULL;
    v_cd_conta_contabil_ebs      VARCHAR2 (30)   := NULL;
    v_id_plano_de_contas         NUMBER   (8)    := 0;
    v_id_par_apropriacao_direta  NUMBER   (8)    := 0;
    v_id_estrutura_org_ex        NUMBER   (8)    := 0;
    v_vl_apropriacao             NUMBER   (15,2) := 0;
    v_debitos                    NUMBER   (15,2) := 0;
    v_creditos                   NUMBER   (15,2) := 0;
    v_fl_ignorar                 VARCHAR2 (1)    := NULL;
    v_mensagem                   VARCHAR2 (1000) := NULL;
    v_tam_ccontabil_ebs          NUMBER   (2)    := 0;
    v_tam_ccusto_ebs             NUMBER   (2)    := 0;
    v_tamanho                    NUMBER   (2)    := 0;
    v_qtd_linhas_balancete       NUMBER   (6)    := 0;
    v_id_vl_apropriacao_direta   NUMBER   (8)    := 0;
    p_id_plano_execucao          NUMBER   (8)    := 0;
    p_id_controle_execucao       NUMBER   (8)    := 0;
    p_ds_msg                     VARCHAR2 (500)  := NULL;
    p_tp_mensagem                VARCHAR2 (1)    := NULL;
    p_status                     VARCHAR2 (1)    := NULL;

    -- Ler balancete
    cursor c_ler_balancete is
           select cd_ccusto_ebs, cd_ccontabil_ebs,cd_linha_produto,vl_debitos,vl_creditos
             from ca.ebs_balancete_cc
            where nr_ano = v_nr_ano_ebs
              and nr_mes = v_nr_mes_ebs;

    -- Ler Parametrização da Apropriação Direta
    cursor c_par_apropriacao is
           select id_par_apropriacao_direta, id_plano_de_contas, fl_ignorar
             from ca.dre_par_apropriacao_direta
            where cd_conta_contabil_ebs = v_cd_ccontabil_ebs
              and cd_centro_custo_ebs = v_cd_ccusto_ebs;

    clb              c_ler_balancete%ROWTYPE;
    cpa              c_par_apropriacao%ROWTYPE;

BEGIN


   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_VL_APROPRIACAO_DIRETA';


   s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                  p_nr_mes,
                                                  p_id_plano_execucao,
                                                  p_cd_estabelecimento,
                                                  p_nr_registro,
                                                  p_id_controle_execucao);


    p_status := 1;

   v_nr_ano := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));

   -- Ler Balancete
   p_ds_msg := 'Lendo balancete...';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

   OPEN c_ler_balancete;

   LOOP
       FETCH c_ler_balancete INTO clb;

       EXIT WHEN c_ler_balancete%NOTFOUND;

       IF c_ler_balancete%FOUND THEN
            -- Inicializa varáveis --
            v_fl_ignorar            := NULL;
            v_id_plano_de_contas    := 0;
            v_id_estrutura_org_ex   := 0;
            v_vl_apropriacao        := 0;
            v_cd_conta_contabil_ebs := NULL;
            v_cd_ccontabil_ebs      := rtrim(ltrim(clb.cd_ccontabil_ebs));
            v_cd_ccusto_ebs         := rtrim(ltrim(clb.cd_ccusto_ebs));
            v_tam_ccontabil_ebs     := length(clb.cd_ccontabil_ebs);
            v_tam_ccusto_ebs        := length(clb.cd_ccusto_ebs);
            v_tamanho               := length(clb.cd_ccusto_ebs);
            v_id_par_apropriacao_direta := 0;
            v_id_vl_apropriacao_direta := 0;
            v_qtd_linhas_balancete := v_qtd_linhas_balancete + 1;

            -- Verifica se existe centro de custo --
            BEGIN
                select distinct cd_centro_custo_ebs
                  into v_cd_ccusto_ebs
                  from al.centro_custo cc
                 where cd_centro_custo_ebs = v_cd_ccusto_ebs;
            EXCEPTION
                when no_data_found then
                v_mensagem := v_cd_ccusto_ebs;
                p_ds_msg := 'Centro de Custo não encontrado ' || v_mensagem;
                p_tp_mensagem := 'A';
                s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;

            -- Localizar parâmetro conta contábil do EBS
            WHILE (v_tam_ccontabil_ebs <> 0 and v_id_par_apropriacao_direta = 0) LOOP
                BEGIN
                    select distinct cd_conta_contabil_ebs
                      into v_cd_conta_contabil_ebs
                      from ca.dre_par_apropriacao_direta
                     where rtrim(ltrim(cd_conta_contabil_ebs)) = v_cd_ccontabil_ebs;
                EXCEPTION
                    when no_data_found then
                    v_cd_conta_contabil_ebs := NULL;
                END;

                -- Localizar parâmetro centro de custo do EBS
                IF v_cd_conta_contabil_ebs is not null THEN
                   v_cd_ccusto_ebs  := rtrim(ltrim(clb.cd_ccusto_ebs));
                   v_tam_ccusto_ebs := length(clb.cd_ccusto_ebs);
                   v_tamanho        := length(clb.cd_ccusto_ebs);
                   BEGIN
                      FOR i IN REVERSE 1..v_tam_ccusto_ebs LOOP
                          OPEN c_par_apropriacao;
                          FETCH  c_par_apropriacao INTO cpa;
                          IF c_par_apropriacao%FOUND THEN
                             v_id_par_apropriacao_direta := cpa.id_par_apropriacao_direta;
                             v_id_plano_de_contas := cpa.id_plano_de_contas;
                             v_fl_ignorar := cpa.fl_ignorar;
                             EXIT WHEN c_par_apropriacao%FOUND;
                          ELSE
                             CLOSE c_par_apropriacao;
                             --v_mensagem := v_tamanho;
                             --DBMS_OUTPUT.PUT_LINE('Tamanho CC: ' || v_mensagem);
                             v_tamanho := v_tamanho - 1;
                             v_cd_ccusto_ebs := substr(v_cd_ccusto_ebs,1,v_tamanho);
                             --v_mensagem := v_cd_ccusto_ebs;
                             --DBMS_OUTPUT.PUT_LINE('CC ' || v_mensagem);
                          END IF;
                          --v_mensagem := i;
                          --DBMS_OUTPUT.PUT_LINE('Contador: ' || v_mensagem);
                      END LOOP;
                      IF v_id_par_apropriacao_direta <> 0 THEN
                         CLOSE c_par_apropriacao;
                      END IF;
                   END;
                END IF;
                IF (v_tam_ccontabil_ebs > 6) THEN
                    v_tam_ccontabil_ebs := 6;
                    v_cd_ccontabil_ebs  := trim(substr(v_cd_ccontabil_ebs,1,v_tam_ccontabil_ebs));
                ELSE
                    IF (v_tam_ccontabil_ebs > 4) THEN
                        v_tam_ccontabil_ebs := 4;
                        v_cd_ccontabil_ebs  := trim(substr(v_cd_ccontabil_ebs,1,v_tam_ccontabil_ebs));
                    ELSE
                        IF (v_tam_ccontabil_ebs > 2) THEN
                            v_tam_ccontabil_ebs := 2;
                            v_cd_ccontabil_ebs  := trim(substr(v_cd_ccontabil_ebs,1,v_tam_ccontabil_ebs));
                        ELSE
                            IF (v_tam_ccontabil_ebs > 1) THEN
                                v_tam_ccontabil_ebs := 1;
                                v_cd_ccontabil_ebs  := trim(substr(v_cd_ccontabil_ebs,1,v_tam_ccontabil_ebs));
                            ELSE
                              v_tam_ccontabil_ebs := 0;
                            END IF;
                        END IF;
                    END IF;
                END IF;
                --v_mensagem := v_cd_ccusto_ebs || ' ' || v_cd_ccontabil_ebs;
                --DBMS_OUTPUT.PUT_LINE('Loop ' || v_mensagem);

            END LOOP;

            -- Verifica se existe parametrização para o lançamento contábil do EBS
            IF (v_fl_ignorar = '0') THEN
                --Identificar estrutura organizacional da DRE que corresponde ao centro de custo do EBS
                v_tam_ccusto_ebs := length(clb.cd_ccusto_ebs);
                v_tamanho        := length(clb.cd_ccusto_ebs);
                v_cd_ccusto_ebs  := clb.cd_ccusto_ebs;
                FOR i IN REVERSE 1..v_tam_ccusto_ebs LOOP
                    BEGIN
                       select eo.id_estrutura_org_ex
                         into v_id_estrutura_org_ex
                         from ca.dre_estrutura_org_ex eo,
                              ca.dre_estrutura_org_itens_ex eoi
                        where eo.nr_ano = p_nr_ano
                          and eo.nr_mes = p_nr_mes
                          and eoi.id_estrutura_org_ex = eo.id_estrutura_org_ex
                          and eoi.cd_centro_custo_ebs = v_cd_ccusto_ebs;
                    EXCEPTION
                        when no_data_found then
                        v_tamanho := v_tamanho - 1;
                        v_cd_ccusto_ebs := substr(v_cd_ccusto_ebs,1,v_tamanho);
                    END;
                    EXIT WHEN v_id_estrutura_org_ex <> 0;
                END LOOP;

                IF (v_id_estrutura_org_ex <> 0) THEN
                    v_vl_apropriacao := clb.vl_creditos - clb.vl_debitos;
                    BEGIN
                      INSERT INTO ca.dre_vl_apropriacao_direta
                                  (ID_VL_APROPRIACAO_DIRETA,
                                   NR_ANO,
                                   NR_MES,
                                   ID_PLANO_CONTAS,
                                   ID_ESTRUTURA_ORG_EX,
                                   VL_APROPRIACAO,
                                   ID_PAR_APROPRIACAO_DIRETA,
                                   CD_CONTA_CONTABIL_ORIGEM,
                                   CD_CENTRO_CUSTO_ORIGEM,
                                   CD_LINHA_PRODUTO
                                  )
                           VALUES (ca.sq_dre_vl_apropriacao_direta.nextval,
                                   p_nr_ano,
                                   p_nr_mes,
                                   v_id_plano_de_contas,
                                   v_id_estrutura_org_ex,
                                   v_vl_apropriacao,
                                   v_id_par_apropriacao_direta,
                                   clb.cd_ccontabil_ebs,
                                   clb.cd_ccusto_ebs,
                                   clb.cd_linha_produto
                                 );
                    EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Inclusão não realizada: ' || sqlerrm;
                             p_tp_mensagem := 'E';
                             p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
              ELSE
                  v_mensagem := v_cd_ccontabil_ebs || ' - ' || clb.CD_CCUSTO_EBS;
                  p_ds_msg := 'Centro de Custo não esta cadastrado no organograma: ' || v_mensagem;
                  p_tp_mensagem := 'A';
                  s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
              END IF;
            END IF;

            IF v_fl_ignorar is NULL THEN
               v_mensagem := clb.cd_ccontabil_ebs || ' - ' || clb.cd_ccusto_ebs;
               p_ds_msg := 'Parametrização não encontrada: ' || v_mensagem;
               p_tp_mensagem := 'A';
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END IF;

       ELSE
          v_mensagem := sqlerrm;
          p_ds_msg := 'Nenhum lançamento encontrado no balancete do ano ' || p_nr_ano || ' mês ' ||
                                p_nr_mes || '. Mensagem: ' || v_mensagem;
          p_tp_mensagem := 'A';
          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
       END IF;
       --commit;
   END LOOP;

   CLOSE c_ler_balancete;
   commit;

   IF v_qtd_linhas_balancete = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Nenhum lançamento encontrado no balancete do ano ' || p_nr_ano || ' mês ' ||
                            p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'E';
      p_status := 2;
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas_balancete;
      p_ds_msg := 'Total de linhas do balancete ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);
END P_VL_APROPRIACAO_DIRETA;

PROCEDURE P_RATEIO_APROPRIACAO (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_nr_ano                     VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                 VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                 VARCHAR2 (2)    := NULL;
    v_tamanho                    NUMBER   (2)    := 0;
    v_max_nivel_gra              NUMBER   (3)    := 0;
    v_max_nivel_pos              NUMBER   (3)    := 0;
    v_id_estrutura_org_pai_ex    NUMBER   (8)    := 0;
    v_nr_apropriacao             NUMBER   (3)    := 0;
    v_nr_apropriacao_ant         NUMBER   (3)    := 0;
    p_id_plano_execucao          NUMBER   (8)    := 0;
    p_id_controle_execucao       NUMBER   (8)    := 0;
    p_ds_msg                     VARCHAR2 (500)  := NULL;
    p_tp_mensagem                VARCHAR2 (1)    := NULL;
    p_status                     VARCHAR2 (1)    := NULL;

    cursor c_copia_vl_apropriacao_direta is
           select vad.nr_ano,vad.nr_mes,vad.id_plano_contas,vad.id_estrutura_org_ex,vad.vl_apropriacao,vad.id_vl_apropriacao_direta
             from ca.dre_vl_apropriacao_direta vad, ca.dre_estrutura_org_ex eoe
            where vad.nr_mes = p_nr_mes
              and vad.nr_ano = p_nr_ano
              --and (eoe.cd_indicador_un_negocio in ('1','2') or eoe.cd_indicador_un_negocio is null)
              and eoe.id_estrutura_org_ex = vad.id_estrutura_org_ex
              and eoe.nr_mes = vad.nr_mes
              and eoe.nr_ano = vad.nr_ano;

    cursor c_copia_apropriacao_indireta is
           select vai.nr_ano,vai.nr_mes,vai.id_plano_contas,vai.id_estrutura_org_ex,vai.vl_apropriacao,vai.id_vl_apropriacao_indireta
             from ca.dre_vl_apropriacao_indireta vai, ca.dre_estrutura_org_ex eoe
            where vai.nr_mes = p_nr_mes
              and vai.nr_ano = p_nr_ano
              --and (eoe.cd_indicador_un_negocio in ('1','2') or eoe.cd_indicador_un_negocio is null)
              and eoe.id_estrutura_org_ex = vai.id_estrutura_org_ex
              and eoe.nr_mes = vai.nr_mes
              and eoe.nr_ano = vai.nr_ano;

    cursor c_grava_vl_calculo_gra is
           select eoe.cd_indicador_un_negocio,eoe.nr_nivel,eoe.id_estrutura_org_ex,eoe.id_estrutura_org_pai_ex,
                  vc.nr_ano,vc.nr_mes,vc.id_vl_apropriacao_direta,vc.id_plano_contas,vc.vl_calculo,vc.id_vl_calculo
             from ca.dre_estrutura_org_ex eoe, ca.dre_vl_calculo vc
            where eoe.id_estrutura_org_ex = vc.id_estrutura_org_ex
              and eoe.nr_ano = vc.nr_ano
              and eoe.nr_mes = vc.nr_mes
              and vc.nr_ano = p_nr_ano
              and vc.nr_mes = p_nr_mes
              and (eoe.cd_indicador_un_negocio = 1 and eoe.nr_nivel < v_max_nivel_gra)
              and vc.nr_apropriacao = v_nr_apropriacao_ant
          order by eoe.nr_nivel,eoe.id_estrutura_org_ex;

    cursor c_grava_vl_calculo_pos is
           select eoe.cd_indicador_un_negocio,eoe.nr_nivel,eoe.id_estrutura_org_ex,eoe.id_estrutura_org_pai_ex,
                  vc.nr_ano,vc.nr_mes,vc.id_vl_apropriacao_direta,vc.id_plano_contas,vc.vl_calculo,vc.id_vl_calculo
             from ca.dre_estrutura_org_ex eoe, ca.dre_vl_calculo vc
            where eoe.id_estrutura_org_ex = vc.id_estrutura_org_ex
              and eoe.nr_ano = vc.nr_ano
              and eoe.nr_mes = vc.nr_mes
              and vc.nr_ano = p_nr_ano
              and vc.nr_mes = p_nr_mes
              and (eoe.cd_indicador_un_negocio = 2 and eoe.nr_nivel < v_max_nivel_pos)
              and vc.nr_apropriacao = v_nr_apropriacao_ant
          order by eoe.nr_nivel,eoe.id_estrutura_org_ex;

    cursor c_ler_percentual_calculo is
           select eoe.cd_indicador_un_negocio,eoe.nr_nivel,eoe.id_estrutura_org_ex,ga.vl_percentual,
                    ga.nr_ano,ga.nr_mes
             from ca.dre_estrutura_org_ex eoe, ca.dre_grade_alunos ga
            where eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex
              and eoe.nr_ano = ga.nr_ano
              and eoe.nr_mes = ga.nr_mes
              and eoe.nr_ano = p_nr_ano
              and eoe.nr_mes = p_nr_mes
              and eoe.id_estrutura_org_pai_ex = v_id_estrutura_org_pai_ex
          order by eoe.nr_nivel,eoe.id_estrutura_org_ex;

    -- para atender nova estrutura org com VRE e VR (que está no lugar da pos mas não tem aluno)       
    cursor c_ler_percentual_calculo_pos is
           select eoe.cd_indicador_un_negocio,eoe.nr_nivel
                , eoe.id_estrutura_org_ex
                , 1/count(*) over (partition by eoe.nr_nivel) vl_percentual
                , eoe.nr_ano, eoe.nr_mes
             from ca.dre_estrutura_org_ex eoe --, ca.dre_grade_alunos ga
            where 1=1 -- eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex  and eoe.nr_ano = ga.nr_ano and eoe.nr_mes = ga.nr_mes
              and eoe.nr_ano = p_nr_ano
              and eoe.nr_mes = p_nr_mes
              and eoe.id_estrutura_org_pai_ex = v_id_estrutura_org_pai_ex
          order by eoe.nr_nivel,eoe.id_estrutura_org_ex;          

    cad             c_copia_vl_apropriacao_direta%ROWTYPE;
    cai             c_copia_apropriacao_indireta%ROWTYPE;
    gvcg            c_grava_vl_calculo_gra%ROWTYPE;
    gvcp            c_grava_vl_calculo_pos%ROWTYPE;
    lpc             c_ler_percentual_calculo%ROWTYPE;
    lpc_pos         c_ler_percentual_calculo_pos%ROWTYPE;

    v_mensagem                   VARCHAR2 (1000) := NULL;
    v_qtd_linhas                 NUMBER   (6)    := 0;
    v_vl_calculo                 NUMBER   (15,2) := 0;
    v_vl_total                   NUMBER   (15,2) := 0;
    v_qtd_linhas_cursor          NUMBER   (6)    := 0;

BEGIN


   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_RATEIO_APROPRIACAO';


   s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                  p_nr_mes,
                                                  p_id_plano_execucao,
                                                  p_cd_estabelecimento,
                                                  p_nr_registro,
                                                  p_id_controle_execucao);


   p_status := 1;

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));

   v_qtd_linhas := 0;


   p_ds_msg := 'Gravar CA.DRE_VL_CALCULO a partir da CA.DRE_APROPRIACAO_DIRETA.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

   -- Gravar em CA.DRE_VL_CALCULO os valores de todos os níveis da CA.DRE_APROPRIACAO_DIRETA;

   OPEN c_copia_vl_apropriacao_direta;

   LOOP
      FETCH c_copia_vl_apropriacao_direta INTO cad;

      EXIT WHEN c_copia_vl_apropriacao_direta%NOTFOUND;

      IF  c_copia_vl_apropriacao_direta%FOUND THEN
          BEGIN
              v_qtd_linhas := v_qtd_linhas + 1;
              INSERT INTO ca.dre_vl_calculo
                          (ID_VL_CALCULO,
                           NR_ANO,
                           NR_MES,
                           ID_PLANO_CONTAS,
                           ID_ESTRUTURA_ORG_EX,
                           VL_CALCULO,
                           ID_VL_CALCULO_ORIGEM,
                           NR_APROPRIACAO,
                           ID_VL_APROPRIACAO_DIRETA,
                           ID_VL_APROPRIACAO_INDIRETA
                          )
                   VALUES (ca.sq_dre_vl_calculo.nextval,
                           cad.nr_ano,
                           cad.nr_mes,
                           cad.id_plano_contas,
                           cad.id_estrutura_org_ex,
                           cad.vl_apropriacao,
                           null,
                           0,
                           cad.id_vl_apropriacao_direta,
                           null
                          );
          EXCEPTION
                WHEN OTHERS THEN
                        p_ds_msg := 'Mensagem: ' || sqlerrm;
                        p_tp_mensagem := 'A';
                        --p_status := 2;
                        s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
          END;
      END IF;

   END LOOP;
   CLOSE c_copia_vl_apropriacao_direta;
   commit;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizada inclusão na tabela DRE_VL_CALCULO do ano ' || p_nr_ano || ' mês ' ||
                            p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VL_CALCULO ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   v_qtd_linhas := 0;

   p_ds_msg := 'Gravar CA.DRE_VL_CALCULO a partir da CA.DRE_APROPRIACAO_INDIRETA.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Gravar em CA.DRE_VL_CALCULO os valores de todos os níveis da CA.DRE_APROPRIACAO_INDIRETA;

   OPEN c_copia_apropriacao_indireta;

   LOOP
      FETCH c_copia_apropriacao_indireta INTO cai;

      EXIT WHEN c_copia_apropriacao_indireta%NOTFOUND;

      IF  c_copia_apropriacao_indireta%FOUND THEN
          BEGIN
              v_qtd_linhas := v_qtd_linhas + 1;
              INSERT INTO ca.dre_vl_calculo
                          (ID_VL_CALCULO,
                           NR_ANO,
                           NR_MES,
                           ID_PLANO_CONTAS,
                           ID_ESTRUTURA_ORG_EX,
                           VL_CALCULO,
                           ID_VL_CALCULO_ORIGEM,
                           NR_APROPRIACAO,
                           ID_VL_APROPRIACAO_DIRETA,
                           ID_VL_APROPRIACAO_INDIRETA
                          )
                   VALUES (ca.sq_dre_vl_calculo.nextval,
                           cai.nr_ano,
                           cai.nr_mes,
                           cai.id_plano_contas,
                           cai.id_estrutura_org_ex,
                           cai.vl_apropriacao,
                           null,
                           0,
                           null,
                           cai.id_vl_apropriacao_indireta
                          );
          EXCEPTION
                WHEN OTHERS THEN
                        p_ds_msg := 'Mensagem: ' || sqlerrm;
                        p_tp_mensagem := 'A';
                        --p_status := 2;
                        s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
          END;
      END IF;

   END LOOP;
   CLOSE c_copia_apropriacao_indireta;
   commit;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizada inclusão na tabela DRE_VL_CALCULO do ano ' || p_nr_ano || ' mês ' ||
                            p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VL_CALCULO ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   v_qtd_linhas := 0;


   p_ds_msg := 'Gravar CA.DRE_VL_CALCULO para Graduação a partir do rateio por nivel da CA.DRE_VL_CALCULO e CA.DRE_GRADE_ALUNOS.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Gravar CA.DRE_VL_CALCULO para Garaduação a partir do rateio por nivel da CA.DRE_APROPRIACAO_DIRETA e CA.DRE_GRADE_ALUNOS

   -- Busca maior nivel de granularidade da graduação --
   v_max_nivel_gra := 0;
   BEGIN
       select max(nr_nivel)
         into v_max_nivel_gra
         from ca.dre_estrutura_org_ex eoe
        where eoe.cd_indicador_un_negocio = 1
          and eoe.nr_ano = p_nr_ano
          and eoe.nr_mes = p_nr_mes;
   EXCEPTION
         when no_data_found then
              v_mensagem := v_max_nivel_gra;
              p_ds_msg := 'Não existe nível de granularidade para graduação ' || v_mensagem || '.';
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END;

   v_nr_apropriacao := v_max_nivel_gra - 1;

   FOR i IN 1..v_nr_apropriacao LOOP
         v_nr_apropriacao_ant := i - 1;

         OPEN c_grava_vl_calculo_gra;

         LOOP
            FETCH c_grava_vl_calculo_gra INTO gvcg;

            EXIT WHEN c_grava_vl_calculo_gra%NOTFOUND;

            IF  c_grava_vl_calculo_gra%FOUND THEN
                v_id_estrutura_org_pai_ex := gvcg.id_estrutura_org_ex;

                OPEN c_ler_percentual_calculo;

                v_vl_total := 0;
                v_qtd_linhas_cursor :=0;
                BEGIN
                    select count(*)
                      into v_qtd_linhas_cursor
                      from ca.dre_estrutura_org_ex eoe, ca.dre_grade_alunos ga
                     where eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex
                       and eoe.nr_ano = ga.nr_ano
                       and eoe.nr_mes = ga.nr_mes
                       and eoe.nr_ano = p_nr_ano
                       and eoe.nr_mes = p_nr_mes
                       and eoe.id_estrutura_org_pai_ex = v_id_estrutura_org_pai_ex;
                EXCEPTION
                      WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;

                LOOP
                   FETCH c_ler_percentual_calculo INTO lpc;

                   EXIT WHEN c_ler_percentual_calculo%NOTFOUND;

                   IF c_ler_percentual_calculo%FOUND THEN
                      v_vl_calculo := gvcg.vl_calculo * lpc.vl_percentual /100;
                      v_vl_total := v_vl_total + v_vl_calculo;
                      -- Verifica se é o último registro do cursor
                      IF (v_qtd_linhas_cursor = SQL%ROWCOUNT) THEN
                         IF (v_vl_total < gvcg.vl_calculo) THEN
                            v_vl_calculo := v_vl_calculo + (gvcg.vl_calculo - v_vl_total);
                         END IF;
                         IF (v_vl_total > gvcg.vl_calculo) THEN
                            v_vl_calculo := v_vl_calculo - (v_vl_total - gvcg.vl_calculo);
                         END IF;
                      END IF;

                      IF (v_vl_calculo <> 0) THEN
                          BEGIN
                              v_qtd_linhas := v_qtd_linhas + 1;
                              INSERT INTO ca.dre_vl_calculo
                                          (ID_VL_CALCULO,
                                           NR_ANO,
                                           NR_MES,
                                           ID_PLANO_CONTAS,
                                           ID_ESTRUTURA_ORG_EX,
                                           VL_CALCULO,
                                           ID_VL_CALCULO_ORIGEM,
                                           NR_APROPRIACAO,
                                           ID_VL_APROPRIACAO_DIRETA,
                                           ID_VL_APROPRIACAO_INDIRETA
                                          )
                                   VALUES (ca.sq_dre_vl_calculo.nextval,
                                           gvcg.nr_ano,
                                           gvcg.nr_mes,
                                           gvcg.id_plano_contas,
                                           lpc.id_estrutura_org_ex,
                                           v_vl_calculo,
                                           gvcg.id_vl_calculo,
                                           i,
                                           null,
                                           null
                                          );
                          EXCEPTION
                                WHEN OTHERS THEN
                                        p_ds_msg := 'Mensagem: ' || sqlerrm;
                                        p_tp_mensagem := 'A';
                                        --p_status := 2;
                                        s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                          END;
                      END IF;
                   END IF;

                END LOOP;
                CLOSE c_ler_percentual_calculo;
                commit;

            END IF;

         END LOOP;
         CLOSE c_grava_vl_calculo_gra;
         commit;
   END LOOP;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizado rateio a partir da CA.DRE_VL_CALCULO e CA.DRE_GRADE_ALUNOS no ano ' ||
                            p_nr_ano || ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VL_CALCULO após rateio ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   v_qtd_linhas := 0;

   p_ds_msg := 'Gravar CA.DRE_VL_CALCULO para Pós-Graduação a partir do rateio por nivel da CA.DRE_VL_CALCULO e CA.DRE_GRADE_ALUNOS.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Gravar CA.DRE_VL_CALCULO para Pós-Graduação a partir do rateio por nivel da CA.DRE_APROPRIACAO_DIRETA e CA.DRE_GRADE_ALUNOS

   -- Busca maior nivel de granularidade da pós-graduação --
   v_max_nivel_pos := 0;
   BEGIN
       select max(nr_nivel)
         into v_max_nivel_pos
         from ca.dre_estrutura_org_ex eoe
        where eoe.cd_indicador_un_negocio = 2
          and eoe.nr_ano = p_nr_ano
          and eoe.nr_mes = p_nr_mes;
   EXCEPTION
         when no_data_found then
              v_mensagem := v_max_nivel_gra;
              p_ds_msg := 'Não existe nível de granularidade para pós-graduação ' || v_mensagem || '.';
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END;

   v_nr_apropriacao := v_max_nivel_pos - 1;

   FOR i IN 1..v_nr_apropriacao LOOP
         v_nr_apropriacao_ant := i - 1;

         OPEN c_grava_vl_calculo_pos;

         LOOP
            FETCH c_grava_vl_calculo_pos INTO gvcp;

            EXIT WHEN c_grava_vl_calculo_pos%NOTFOUND;

            IF  c_grava_vl_calculo_pos%FOUND THEN
                v_id_estrutura_org_pai_ex := gvcp.id_estrutura_org_ex;

                OPEN c_ler_percentual_calculo_pos;

                v_vl_total := 0;
                v_qtd_linhas_cursor :=0;
                BEGIN
                    select count(*)
                      into v_qtd_linhas_cursor
                      from ca.dre_estrutura_org_ex eoe --, ca.dre_grade_alunos ga
                     where 1=1 --eoe.id_estrutura_org_ex = ga.id_estrutura_org_ex and eoe.nr_ano = ga.nr_ano and eoe.nr_mes = ga.nr_mes
                       and eoe.nr_ano = p_nr_ano
                       and eoe.nr_mes = p_nr_mes
                       and eoe.id_estrutura_org_pai_ex = v_id_estrutura_org_pai_ex;
                EXCEPTION
                      WHEN OTHERS THEN
                           p_ds_msg := 'Mensagem: ' || sqlerrm;
                           p_tp_mensagem := 'A';
                           --p_status := 2;
                           s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                END;

                LOOP
                   FETCH c_ler_percentual_calculo_pos INTO lpc_pos;

                   EXIT WHEN c_ler_percentual_calculo_pos%NOTFOUND;

                   IF c_ler_percentual_calculo_pos%FOUND THEN
                      v_vl_calculo := gvcp.vl_calculo * lpc_pos.vl_percentual;-- /100;
                      v_vl_total := v_vl_total + v_vl_calculo;
                      IF (v_qtd_linhas_cursor = SQL%ROWCOUNT) THEN
                         IF (v_vl_total < gvcp.vl_calculo) THEN
                            v_vl_calculo := v_vl_calculo + (gvcp.vl_calculo - v_vl_total);
                         END IF;
                         IF (v_vl_total > gvcp.vl_calculo) THEN
                            v_vl_calculo := v_vl_calculo - (v_vl_total - gvcp.vl_calculo);
                         END IF;
                      END IF;

                      IF (v_vl_calculo <> 0) THEN
                          BEGIN
                              v_qtd_linhas := v_qtd_linhas + 1;

                              INSERT INTO ca.dre_vl_calculo
                                          (ID_VL_CALCULO,
                                           NR_ANO,
                                           NR_MES,
                                           ID_PLANO_CONTAS,
                                           ID_ESTRUTURA_ORG_EX,
                                           VL_CALCULO,
                                           ID_VL_CALCULO_ORIGEM,
                                           NR_APROPRIACAO,
                                           ID_VL_APROPRIACAO_DIRETA,
                                           ID_VL_APROPRIACAO_INDIRETA
                                          )
                                   VALUES (ca.sq_dre_vl_calculo.nextval,
                                           gvcp.nr_ano,
                                           gvcp.nr_mes,
                                           gvcp.id_plano_contas,
                                           lpc_pos.id_estrutura_org_ex,
                                           v_vl_calculo,
                                           gvcp.id_vl_calculo,
                                           i,
                                           null,
                                           null
                                          );
                          EXCEPTION
                                WHEN OTHERS THEN
                                        p_ds_msg := 'Mensagem: ' || sqlerrm;
                                        p_tp_mensagem := 'A';
                                        --p_status := 2;
                                        s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                          END;
                      END IF;
                   END IF;

                END LOOP;
                CLOSE c_ler_percentual_calculo_pos;
                commit;

            END IF;

         END LOOP;
         CLOSE c_grava_vl_calculo_pos;
         commit;
   END LOOP;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizado rateio a partir da CA.DRE_VL_CALCULO e CA.DRE_GRADE_ALUNOS no ano ' ||
                            p_nr_ano || ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VL_CALCULO após rateio ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_RATEIO_APROPRIACAO;

PROCEDURE P_GRAVA_VALORES_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                               p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                               p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                               p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_nr_ano                      VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)    := NULL;
    --v_nr_semestre               NUMBER   (1)    := 0;
    v_vl_dre                      NUMBER   (15,2) := 0;
    v_nr_nivel                    NUMBER   (3)    := 0;
    v_nr_nivel_cur                NUMBER   (3)    := 0;
    v_cd_indicador_un_negocio_cur NUMBER   (3)    := 0;
    v_mensagem                    VARCHAR2 (1000) := NULL;
    v_qtd_linhas                  NUMBER   (6)    := 0;
    v_id_dre_valor                NUMBER   (8)    := 0;
    v_fl_total                    VARCHAR2 (1)    := '0';
    p_id_plano_execucao           NUMBER   (8)    := 0;
    p_id_controle_execucao        NUMBER   (8)    := 0;
    p_ds_msg                      VARCHAR2 (500)  := NULL;
    p_tp_mensagem                 VARCHAR2 (1)    := NULL;
    p_status                      VARCHAR2 (1)    := NULL;

    cursor c_grava_dre_valor is
           select vc.nr_ano,vc.nr_mes,vc.id_plano_contas,vc.id_estrutura_org_ex,sum(vl_calculo) as v_vl_dre
               from ca.dre_vl_calculo vc, ca.dre_estrutura_org_ex eoe
              where vc.nr_ano = p_nr_ano
                and vc.nr_mes = p_nr_mes
                and vc.nr_ano = eoe.nr_ano
                and vc.nr_mes = eoe.nr_mes
                and vc.id_estrutura_org_ex = eoe.id_estrutura_org_ex
                and eoe.cd_indicador_un_negocio = v_cd_indicador_un_negocio_cur
                and eoe.nr_nivel = v_nr_nivel_cur
            group by vc.nr_ano,vc.nr_mes,vc.id_plano_contas,vc.id_estrutura_org_ex
            order by vc.nr_ano,vc.nr_mes,vc.id_plano_contas,vc.id_estrutura_org_ex;

    cursor c_qtd_niveis_un_negocio is
            select e.cd_indicador_un_negocio,max(e.nr_nivel) as v_nr_nivel
              from ca.dre_estrutura_org_ex e
             where e.cd_indicador_un_negocio is not null
               and e.nr_ano = p_nr_ano
               and e.nr_mes = p_nr_mes
          group by e.cd_indicador_un_negocio;

    cursor c_ler_estrutura is
           select *
              from ca.dre_estrutura_org_ex e
             where e.nr_ano = p_nr_ano
               and e.nr_mes = p_nr_mes
          order by id_estrutura_org_ex;

    cursor c_ler_plano is
           select *
              from ca.dre_plano_de_contas p
          order by id_plano_de_contas;

    gdv             c_grava_dre_valor%ROWTYPE;
    qnun            c_qtd_niveis_un_negocio%ROWTYPE;
    cle             c_ler_estrutura%ROWTYPE;
    clp             c_ler_plano%ROWTYPE;

BEGIN


   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_GRAVA_VALORES_DRE';


    s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                   p_nr_mes,
                                                   p_id_plano_execucao,
                                                   p_cd_estabelecimento,
                                                   p_nr_registro,
                                                   p_id_controle_execucao);


    p_status := 1;

   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));

   v_qtd_linhas := 0;

   p_ds_msg := 'Gravar CA.DRE_VALOR totalizando os valores da CA.DRE.VL_CALCULO por plano de conta e estrutura organizacioal.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Totalizar os valores da CA.DRE.VL_CALCULO de acordo com a conta do CA.PLANO_CONTAS gravando o resultado em CA.DRE_VALOR.

   OPEN c_qtd_niveis_un_negocio;
   LOOP
       FETCH c_qtd_niveis_un_negocio INTO qnun;

       EXIT WHEN c_qtd_niveis_un_negocio%NOTFOUND;

       v_cd_indicador_un_negocio_cur := qnun.cd_indicador_un_negocio;
       v_nr_nivel_cur := qnun.v_nr_nivel;

       IF c_qtd_niveis_un_negocio%FOUND THEN

           OPEN c_grava_dre_valor;

           LOOP
              FETCH c_grava_dre_valor INTO gdv;

              EXIT WHEN c_grava_dre_valor%NOTFOUND;

              IF  c_grava_dre_valor%FOUND THEN
                  BEGIN
                      v_qtd_linhas := v_qtd_linhas + 1;
                      INSERT INTO ca.dre_valor
                                  (ID_DRE_VALOR,
                                   NR_ANO,
                                   NR_MES,
                                   ID_PLANO_CONTAS,
                                   ID_ESTRUTURA_ORG_EX,
                                   VL_DRE,
                                   FL_TOTAL
                                  )
                           VALUES (ca.sq_dre_valor.nextval,
                                   gdv.nr_ano,
                                   gdv.nr_mes,
                                   gdv.id_plano_contas,
                                   gdv.id_estrutura_org_ex,
                                   gdv.v_vl_dre,
                                   v_fl_total
                                  );
                  EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

                  END;
              END IF;
           END LOOP;
           CLOSE c_grava_dre_valor;
           commit;
       END IF;
   END LOOP;
   CLOSE c_qtd_niveis_un_negocio;
   commit;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizada inclusão na tabela DRE_VALOR do ano ' || p_nr_ano || ' mês ' ||
                            p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VALOR ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   v_qtd_linhas := 0;

   p_ds_msg := 'Gravar CA.DRE_VALOR com valores zerados para plano de conta e estrutura organizacional que nao foram criados.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

   OPEN c_ler_estrutura;

   LOOP
      FETCH c_ler_estrutura INTO cle;

      EXIT WHEN c_ler_estrutura%NOTFOUND;

      IF  c_ler_estrutura%FOUND THEN

          OPEN c_ler_plano;

          LOOP
             FETCH c_ler_plano INTO clp;

             EXIT WHEN c_ler_plano%NOTFOUND;

             IF  c_ler_plano%FOUND THEN
                 BEGIN
                      v_id_dre_valor := 0;
                      select id_dre_valor
                        into v_id_dre_valor
                        from ca.dre_valor v
                       where v.nr_ano = p_nr_ano
                         and v.nr_mes = p_nr_mes
                         and v.id_estrutura_org_ex = cle.id_estrutura_org_ex
                         and v.id_plano_contas = clp.id_plano_de_contas;
                 EXCEPTION
                     when no_data_found then
                          BEGIN
                              v_qtd_linhas := v_qtd_linhas + 1;
                              INSERT INTO ca.dre_valor
                                          (ID_DRE_VALOR,
                                           NR_ANO,
                                           NR_MES,
                                           ID_PLANO_CONTAS,
                                           ID_ESTRUTURA_ORG_EX,
                                           VL_DRE,
                                           FL_TOTAL
                                          )
                                   VALUES (ca.sq_dre_valor.nextval,
                                           cle.nr_ano,
                                           cle.nr_mes,
                                           clp.id_plano_de_contas,
                                           cle.id_estrutura_org_ex,
                                           0,
                                           v_fl_total
                                          );
                          EXCEPTION
                                WHEN OTHERS THEN
                                     p_ds_msg := 'Mensagem: ' || sqlerrm;
                                     p_tp_mensagem := 'A';
                                     --p_status := 2;
                                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

                          END;
                 END;
             END IF;
          END LOOP;
          CLOSE c_ler_plano;
      END IF;
   END LOOP;
   CLOSE c_ler_estrutura;
   commit;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizada inclusão na tabela DRE_VALOR com valores zerados do ano ' || p_nr_ano || ' mês ' ||
                            p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VALOR com valores zerados ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_GRAVA_VALORES_DRE;

PROCEDURE P_TOTALIZA_NIVEIS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                 p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                 p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                 p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_max_nivel                  NUMBER   (3)    := 0;
    v_nr_nivel                   NUMBER   (3)    := 0;
    v_id_dre_valor               NUMBER   (8)    := 0;
    v_mensagem                   VARCHAR2 (1000) := NULL;
    v_qtd_linhas                 NUMBER   (6)    := 0;
    v_fl_total                   VARCHAR2 (1)    := '1';
    p_id_plano_execucao          NUMBER   (8)    := 0;
    p_id_controle_execucao       NUMBER   (8)    := 0;
    p_ds_msg                     VARCHAR2 (500)  := NULL;
    p_tp_mensagem                VARCHAR2 (1)    := NULL;
    p_status                     VARCHAR2 (1)    := NULL;

    cursor c_ler_dre_valor is
           select v.nr_ano,v.nr_mes,v.id_plano_contas,e.id_estrutura_org_pai_ex,v.vl_dre
             from ca.dre_valor v,
                  ca.dre_estrutura_org_ex e
            where v.nr_ano = p_nr_ano
              and v.nr_mes = p_nr_mes
              and v.id_estrutura_org_ex = e.id_estrutura_org_ex
              and e.nr_nivel = v_nr_nivel;

    ldv             c_ler_dre_valor%ROWTYPE;

BEGIN

     -- Busca código do plano de execução --
     select id_plano_execucao
       into p_id_plano_execucao
       from ca.dre_plano_execucao
      where nm_procedure = 'P_TOTALIZA_NIVEIS_DRE';


     s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                    p_nr_mes,
                                                    p_id_plano_execucao,
                                                    p_cd_estabelecimento,
                                                    p_nr_registro,
                                                    p_id_controle_execucao);


     p_status := 1;

     v_qtd_linhas := 0;

     p_ds_msg := 'Totaliza Níveis DRE.';
     p_tp_mensagem := 'A';
     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     -- Totaliza Níveis DRE.

     -- Busca maior nivel de granularidade da estrutura organizacional --
     v_max_nivel := 0;
     BEGIN
         select max(nr_nivel)
           into v_max_nivel
           from ca.dre_estrutura_org_ex eoe
          where eoe.nr_ano = p_nr_ano
            and eoe.nr_mes = p_nr_mes;
     EXCEPTION
           when no_data_found then
                v_mensagem := v_max_nivel;
                p_ds_msg := 'Não existe nível de granularidade ' || v_mensagem || '.';
                p_tp_mensagem := 'A';
                s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     BEGIN
        FOR i IN REVERSE 2..v_max_nivel LOOP
            v_nr_nivel := i;

            OPEN c_ler_dre_valor;

            LOOP
                FETCH c_ler_dre_valor INTO ldv;

                EXIT WHEN c_ler_dre_valor%NOTFOUND;

                IF  c_ler_dre_valor%FOUND THEN
                    BEGIN
                      v_id_dre_valor := 0;
                      select id_dre_valor
                        into v_id_dre_valor
                        from ca.dre_valor v,
                             ca.dre_estrutura_org_ex e
                       where v.nr_ano = p_nr_ano
                         and v.nr_mes = p_nr_mes
                         and v.id_estrutura_org_ex = e.id_estrutura_org_ex
                         and e.id_estrutura_org_ex = ldv.id_estrutura_org_pai_ex
                         and v.id_plano_contas = ldv.id_plano_contas;
                    EXCEPTION
                        when no_data_found then
                             BEGIN
                               INSERT INTO ca.dre_valor
                                           (ID_DRE_VALOR,
                                            NR_ANO,
                                            NR_MES,
                                            ID_PLANO_CONTAS,
                                            ID_ESTRUTURA_ORG_EX,
                                            VL_DRE,
                                            FL_TOTAL
                                           )
                                    VALUES (ca.sq_dre_valor.nextval,
                                            ldv.nr_ano,
                                            ldv.nr_mes,
                                            ldv.id_plano_contas,
                                            ldv.id_estrutura_org_pai_ex,
                                            ldv.vl_dre,
                                            v_fl_total
                                           );
                               v_qtd_linhas := v_qtd_linhas + 1;
                             EXCEPTION
                                 WHEN OTHERS THEN
                                         p_ds_msg := 'Mensagem: ' || sqlerrm;
                                         p_tp_mensagem := 'A';
                                         --p_status := 2;
                                         s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                             END;
                    END;
                    IF (v_id_dre_valor <> 0) THEN
                       BEGIN
                           update ca.dre_valor
                              set vl_dre = vl_dre + ldv.vl_dre, fl_total = v_fl_total
                            where id_dre_valor = v_id_dre_valor;
                           v_qtd_linhas := v_qtd_linhas + 1;
                       EXCEPTION
                           when others then
                              p_ds_msg := 'Mensagem: ' || sqlerrm;
                              p_tp_mensagem := 'A';
                              --p_status := 2;
                              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                       END;
                    END IF;
                END IF;
                commit;
            END LOOP;
            CLOSE c_ler_dre_valor;
            commit;
        END LOOP;
     END;

     IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada totalização dos níveis da DRE do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas/alteradas na tabela DRE_VALOR ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_TOTALIZA_NIVEIS_DRE;

PROCEDURE P_GERA_LINHAS_CALCULADAS_DRE (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                        p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                        p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                        p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_nr_ano                      VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                  VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                  VARCHAR2 (2)    := NULL;
    --v_nr_semestre               NUMBER   (1)    := 0;
    v_vl_dre                      NUMBER   (21,9) := 0;
    --v_nr_nivel                    NUMBER   (3)    := 0;
    --v_nr_nivel_cur                NUMBER   (3)    := 0;
    --v_cd_indicador_un_negocio_cur NUMBER   (3)    := 0;
    v_mensagem                    VARCHAR2 (1000) := NULL;
    v_qtd_linhas                  NUMBER   (6)    := 0;
    v_id_plano_de_contas          NUMBER   (8)    := 0;
    v_id_plano_de_contas_cal      NUMBER   (8)    := 0;
    --v_id_plano_de_contas_com      NUMBER   (8)    := 0;
    v_qtd_linhas_cursor           NUMBER   (6)    := 0;
    v_id_dre_valor                NUMBER   (8)    := 0;
    v_vl_dre_tab                  NUMBER   (8)    :=0;
    v_vl_dre_aux                  NUMBER   (8)    :=0;
    v_id_estrutura_org_ex_tab     NUMBER   (8)    := 0;
    v_fl_total                    VARCHAR2 (1)    := '0';
    p_id_plano_execucao           NUMBER   (8)    := 0;
    p_id_controle_execucao        NUMBER   (8)    := 0;
    p_ds_msg                      VARCHAR2 (500)  := NULL;
    p_tp_mensagem                 VARCHAR2 (1)    := NULL;
    p_status                      VARCHAR2 (1)    := NULL;

    cursor c_copia_grade_aluno is
           select *
             from ca.dre_grade_alunos
            where nr_ano = p_nr_ano
              and nr_mes = p_nr_mes;

    cursor c_ler_plano_contas_calculo is
           select distinct pcc.id_plano_de_contas
             from ca.dre_plano_de_contas_calculo pcc;

    cursor c_ler_dre_valor is
           select v.nr_ano,v.nr_mes,v.vl_dre,eoe.id_estrutura_org_ex,eoe.cd_estruturado,eoe.ds_estrutura_org,
                  pc.cd_estruturado pc_cd_estruturado,pc.ds_plano_contas,pcc.id_plano_de_contas,pcc.id_plano_contas_com,
                  pcc.ds_operador,pcc.nr_constante,pcc.nr_sequencia
             from ca.dre_valor v, ca.dre_estrutura_org_ex eoe, ca.dre_plano_de_contas pc, ca.dre_plano_de_contas_calculo pcc
            where v.nr_ano = p_nr_ano
              and v.nr_mes = p_nr_mes
              and v.nr_ano = eoe.nr_ano
              and v.nr_mes = eoe.nr_mes
              and v.id_estrutura_org_ex = eoe.id_estrutura_org_ex
              and v.id_plano_contas = pc.id_plano_de_contas
              and pcc.id_plano_de_contas = v_id_plano_de_contas_cal
              --and eoe.cd_estruturado = '01'
              and v.id_plano_contas = pcc.id_plano_contas_com
              --and not exists (select 1
              --                  from ca.dre_plano_de_contas_calculo pccc
              --                 where pccc.id_plano_de_contas = pcc.id_plano_contas_com)
         order by v.nr_ano,v.nr_mes,eoe.cd_estruturado,pcc.nr_sequencia;
         --order by v.nr_ano,v.nr_mes,eoe.cd_estruturado,pcc.id_plano_de_contas,pcc.id_plano_contas_com;

    cursor c_ler_dre_valor_calculado is
           select eoe.nr_ano,eoe.nr_mes,
                  nvl((select v.vl_dre
                         from ca.dre_valor v
                        where v.nr_ano = eoe.nr_ano
                          and v.nr_mes = eoe.nr_mes
                          and v.id_estrutura_org_ex = eoe.id_estrutura_org_ex
                          and v.id_plano_contas = pc.id_plano_de_contas),0) v_vl_dre_tab,
                  eoe.id_estrutura_org_ex,eoe.cd_estruturado,eoe.ds_estrutura_org,
                  pc.cd_estruturado pc_cd_estruturado,pc.ds_plano_contas,pcc.id_plano_de_contas,pcc.id_plano_contas_com,
                  pcc.ds_operador,pcc.nr_constante,pcc.nr_sequencia
             from ca.dre_estrutura_org_ex eoe,
                  ca.dre_plano_de_contas pc,
                  ca.dre_plano_de_contas_calculo pcc
            where eoe.nr_ano = p_nr_ano
              and eoe.nr_mes = p_nr_mes
              and pc.id_plano_de_contas = pcc.id_plano_contas_com
              and exists (select 1
                                from ca.dre_plano_de_contas_calculo pccc
                               where pccc.id_plano_de_contas = pcc.id_plano_contas_com)
         order by eoe.nr_ano,eoe.nr_mes,eoe.cd_estruturado,pcc.nr_sequencia;
         --order by eoe.nr_ano,eoe.nr_mes,eoe.cd_estruturado,pc.cd_estruturado,pcc.nr_sequencia;

    cursor c_ler_constantes is
           select *
             from ca.dre_plano_de_contas_calculo c
            where c.id_plano_contas_com is null
          order by c.id_plano_de_contas,nr_sequencia;

    cursor c_atu_dre_valor is
           select *
             from ca.dre_valor v
            where v.id_plano_contas = v_id_plano_de_contas
              and v.nr_ano = p_nr_ano
              and v.nr_mes = p_nr_mes
         order by v.nr_ano,v.nr_mes,v.id_plano_contas;

  ldv             c_ler_dre_valor%ROWTYPE;
  dvc             c_ler_dre_valor_calculado%ROWTYPE;
  cga             c_copia_grade_aluno%ROWTYPE;
  adv             c_atu_dre_valor%ROWTYPE;
  clc             c_ler_constantes%ROWTYPE;
  pcc             c_ler_plano_contas_calculo%ROWTYPE;

BEGIN

   -- Busca código do plano de execução --
   select id_plano_execucao
     into p_id_plano_execucao
     from ca.dre_plano_execucao
    where nm_procedure = 'P_GERA_LINHAS_CALCULADAS_DRE';


   s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                  p_nr_mes,
                                                  p_id_plano_execucao,
                                                  p_cd_estabelecimento,
                                                  p_nr_registro,
                                                  p_id_controle_execucao);


   p_status := 1;


   v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
   v_nr_ano_ebs := substr(v_nr_ano,3,2);
   v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));

   v_qtd_linhas := 0;

   p_ds_msg := 'Copiar as linhas da grade de alunos para DRE-G.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Gerar as linhas calculadas da DRE-G.

   BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '20.010';
    EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado de alunos no plano de contas: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END;

   IF (v_id_plano_de_contas <> 0) THEN
       OPEN c_copia_grade_aluno;

          LOOP
              FETCH c_copia_grade_aluno INTO cga;

              EXIT WHEN c_copia_grade_aluno%NOTFOUND;

              IF  c_copia_grade_aluno%FOUND THEN
                  v_id_dre_valor := 0;
                  BEGIN
                      select id_dre_valor
                        into v_id_dre_valor
                        from ca.dre_valor
                       where nr_ano = cga.nr_ano
                         and nr_mes = cga.nr_mes
                         and id_plano_contas = v_id_plano_de_contas
                         and id_estrutura_org_ex = cga.id_estrutura_org_ex;
                  EXCEPTION
                       WHEN no_data_found THEN
                             BEGIN
                                  v_qtd_linhas := v_qtd_linhas + 1;
                                  INSERT INTO ca.dre_valor
                                              (ID_DRE_VALOR,
                                               NR_ANO,
                                               NR_MES,
                                               ID_PLANO_CONTAS,
                                               ID_ESTRUTURA_ORG_EX,
                                               VL_DRE,
                                               FL_TOTAL
                                              )
                                       VALUES (ca.sq_dre_valor.nextval,
                                               cga.nr_ano,
                                               cga.nr_mes,
                                               v_id_plano_de_contas,
                                               cga.id_estrutura_org_ex,
                                               cga.qt_alunos,
                                               v_fl_total
                                              );
                             EXCEPTION
                                    WHEN OTHERS THEN
                                            p_ds_msg := 'Mensagem: ' || sqlerrm;
                                            p_tp_mensagem := 'A';
                                            --p_status := 2;
                                            s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                             END;
                  END;

                  IF (v_id_dre_valor <> 0) THEN
                      BEGIN
                            update ca.dre_valor
                               set vl_dre = cga.qt_alunos
                             where id_dre_valor = v_id_dre_valor;
                            v_qtd_linhas := v_qtd_linhas + 1;
                      EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                 s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                      END;
                  END IF;
             END IF;
       END LOOP;
       CLOSE c_copia_grade_aluno;
       commit;

       IF v_qtd_linhas = 0 THEN
          v_mensagem := sqlerrm;
          p_ds_msg := 'Nenhum registro incluído na grade de alunos do ano ' || p_nr_ano || ' mês ' ||
                                   p_nr_mes || '. Mensagem: ' || v_mensagem;
          p_tp_mensagem := 'A';
          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
       ELSE
          v_mensagem := v_qtd_linhas;
          p_ds_msg := 'Total de linhas incluídas na grade de alunos ' || v_mensagem;
          p_tp_mensagem := 'A';
          s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
       END IF;
   END IF;

   v_qtd_linhas := 0;

   p_ds_msg := 'Gerar as linhas calculadas da DRE-G.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Gerar as linhas calculadas da DRE-G.

   OPEN c_ler_plano_contas_calculo;

   LOOP
      FETCH c_ler_plano_contas_calculo INTO pcc;

      EXIT WHEN c_ler_plano_contas_calculo%NOTFOUND;

      IF c_ler_plano_contas_calculo%FOUND THEN

           v_id_plano_de_contas_cal := pcc.id_plano_de_contas;
           OPEN c_ler_dre_valor;

           LOOP
               FETCH c_ler_dre_valor INTO ldv;

               EXIT WHEN c_ler_dre_valor%NOTFOUND;

               IF c_ler_dre_valor%FOUND THEN
                  v_id_dre_valor := 0;
                  v_vl_dre := 0;

                  BEGIN
                      select id_dre_valor, vl_dre
                        into v_id_dre_valor, v_vl_dre
                        from ca.dre_valor
                       where nr_ano = ldv.nr_ano
                         and nr_mes = ldv.nr_mes
                         and id_plano_contas = ldv.id_plano_de_contas
                         and id_estrutura_org_ex = ldv.id_estrutura_org_ex;
                  EXCEPTION
                      WHEN no_data_found THEN
                           IF (ldv.ds_operador = '+') THEN
                               v_vl_dre := v_vl_dre + ldv.vl_dre;
                           END IF;
                           IF (ldv.ds_operador = '-') THEN
                               v_vl_dre := v_vl_dre - ldv.vl_dre;
                           END IF;
                           IF (ldv.ds_operador = '*') THEN
                               v_vl_dre := v_vl_dre * ldv.vl_dre;
                           END IF;
                           IF (ldv.ds_operador = '/' and ldv.vl_dre <> 0) THEN
                               v_vl_dre := v_vl_dre / ldv.vl_dre;
                           END IF;
                           IF (ldv.ds_operador = '/' and ldv.vl_dre = 0) THEN
                               v_vl_dre := 0;
                           END IF;

                           BEGIN
                                v_qtd_linhas := v_qtd_linhas + 1;
                                INSERT INTO ca.dre_valor
                                            (ID_DRE_VALOR,
                                             NR_ANO,
                                             NR_MES,
                                             ID_PLANO_CONTAS,
                                             ID_ESTRUTURA_ORG_EX,
                                             VL_DRE,
                                             FL_TOTAL
                                            )
                                     VALUES (ca.sq_dre_valor.nextval,
                                             ldv.nr_ano,
                                             ldv.nr_mes,
                                             ldv.id_plano_de_contas,
                                             ldv.id_estrutura_org_ex,
                                             v_vl_dre,
                                             v_fl_total
                                            );
                           EXCEPTION
                                WHEN OTHERS THEN
                                     p_ds_msg := 'Mensagem: ' || sqlerrm;
                                     p_tp_mensagem := 'A';
                                     --p_status := 2;
                                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                           END;
                  END;

                  IF (v_id_dre_valor <> 0) THEN
                     IF (ldv.ds_operador = '+') THEN
                         v_vl_dre := v_vl_dre + ldv.vl_dre;
                     END IF;
                     IF (ldv.ds_operador = '-') THEN
                         v_vl_dre := v_vl_dre - ldv.vl_dre;
                     END IF;
                     IF (ldv.ds_operador = '*') THEN
                         v_vl_dre := v_vl_dre * ldv.vl_dre;
                     END IF;
                     IF (ldv.ds_operador = '/' and ldv.vl_dre <> 0) THEN
                         v_vl_dre := v_vl_dre / ldv.vl_dre;
                     END IF;
                     IF (ldv.ds_operador = '/' and ldv.vl_dre = 0) THEN
                         v_vl_dre := 0;
                     END IF;

                     BEGIN
                          update ca.dre_valor
                             set vl_dre = v_vl_dre
                           where id_dre_valor = v_id_dre_valor;
                          v_qtd_linhas := v_qtd_linhas + 1;
                     EXCEPTION
                          WHEN OTHERS THEN
                               p_ds_msg := 'Mensagem: ' || sqlerrm;
                               p_tp_mensagem := 'A';
                               --p_status := 2;
                               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                     END;
                  END IF;
               END IF;
               commit;
           END LOOP;
           CLOSE c_ler_dre_valor;
           commit;
      END IF;
  END LOOP;
  CLOSE c_ler_plano_contas_calculo;
  commit;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizada inclusão na tabela DRE_VALOR do ano ' || p_nr_ano || ' mês ' ||
                            p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VALOR ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   v_qtd_linhas := 0;

   p_ds_msg := 'Gerar as linhas calculadas da DRE-G a partir de valores constantes.';
   p_tp_mensagem := 'A';
   s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


   -- Gerar as linhas calculadas da DRE-G a partir das linhas já calculadas.

    OPEN c_ler_constantes;

    LOOP
        FETCH c_ler_constantes INTO clc;

        EXIT WHEN c_ler_constantes%NOTFOUND;

        IF c_ler_constantes%FOUND THEN
           v_id_plano_de_contas := clc.id_plano_de_contas;

           OPEN c_atu_dre_valor;

           LOOP
               FETCH c_atu_dre_valor INTO adv;

               EXIT WHEN c_atu_dre_valor%NOTFOUND;

               IF c_atu_dre_valor%FOUND THEN

                  v_id_dre_valor := adv.id_dre_valor;
                  v_vl_dre := 0;

                  IF (clc.ds_operador = '+') THEN
                       v_vl_dre := adv.vl_dre + clc.nr_constante;
                   END IF;
                   IF (clc.ds_operador = '-') THEN
                       v_vl_dre := adv.vl_dre - clc.nr_constante;
                   END IF;
                   IF (clc.ds_operador = '*') THEN
                       v_vl_dre := adv.vl_dre * clc.nr_constante;
                   END IF;
                   IF (clc.ds_operador = '/' and clc.nr_constante <> 0) THEN
                       v_vl_dre := adv.vl_dre / clc.nr_constante;
                   END IF;
                   IF (clc.ds_operador = '/' and clc.nr_constante = 0) THEN
                       v_vl_dre := 0;
                   END IF;

                   BEGIN
                        update ca.dre_valor
                           set vl_dre = v_vl_dre
                         where id_dre_valor = v_id_dre_valor;
                        v_qtd_linhas := v_qtd_linhas + 1;
                   EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                   END;
               END IF;
               commit;
           END LOOP;
           CLOSE c_atu_dre_valor;
           commit;
        END IF;
        commit;
   END LOOP;
   CLOSE c_ler_constantes;

   IF v_qtd_linhas = 0 THEN
      v_mensagem := sqlerrm;
      p_ds_msg := 'Não foi realizada inclusão na tabela DRE_VALOR do ano ' || p_nr_ano || ' mês ' ||
                            p_nr_mes || '. Mensagem: ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   ELSE
      v_mensagem := v_qtd_linhas;
      p_ds_msg := 'Total de linhas incluídas na tabela DRE_VALOR ' || v_mensagem;
      p_tp_mensagem := 'A';
      s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
   END IF;

   s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_GERA_LINHAS_CALCULADAS_DRE;

PROCEDURE P_LANC_DIFERENCAS_DRE(p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_id_dre_valor                 NUMBER   (8)    := 0;
    v_mensagem                     VARCHAR2 (1000) := NULL;
    v_qtd_linhas                   NUMBER   (6)    := 0;
    v_fl_total                     VARCHAR2 (1)    := '1';
    v_total_ebs                    NUMBER   (15,2) := 0;
    v_total_dre                    NUMBER   (15,2) := 0;
    v_total                        NUMBER   (15,2) := 0;
    v_dt_folha                     DATE;
    v_nr_ano                       VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                   VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                   VARCHAR2 (2)    := NULL;
    v_id_plano_de_contas           NUMBER   (8)    := 0;
    v_id_plano_de_contas_desp      NUMBER   (8)    := 0;
    v_id_plano_de_contas_custo     NUMBER   (8)    := 0;
    v_id_plano_de_contas_custo_ind NUMBER   (8)    := 0;
    v_id_estrutura_org_ex          NUMBER   (8)    := 0;
    v_dre_valor_desp               NUMBER   (15,2) := 0;
    v_dre_valor_custo              NUMBER   (15,2) := 0;
    v_dre_valor_custo_ind          NUMBER   (15,2) := 0;
    p_id_plano_execucao            NUMBER   (8)    := 0;
    p_id_controle_execucao         NUMBER   (8)    := 0;
    p_ds_msg                       VARCHAR2 (500)  := NULL;
    p_tp_mensagem                  VARCHAR2 (1)    := NULL;
    p_status                       VARCHAR2 (1)    := NULL;
    v_total_ebs_retirar            NUMBER   (15,2) := 0;

BEGIN
     -- Busca código do plano de execução --
     select id_plano_execucao
       into p_id_plano_execucao
       from ca.dre_plano_execucao
      where nm_procedure = 'P_LANC_DIFERENCAS_DRE';


     s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                    p_nr_mes,
                                                    p_id_plano_execucao,
                                                    p_cd_estabelecimento,
                                                    p_nr_registro,
                                                    p_id_controle_execucao);


    p_status := 1;

     v_qtd_linhas := 0;

     p_ds_msg := 'Calcula e grava lançamento das diferenças entre CTB EBS x Folha Sispro.';
     p_tp_mensagem := 'A';
     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
     v_nr_ano_ebs := substr(v_nr_ano,3,2);
     v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
     v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

     -- Somatório de débitos e créditos das contas iniciadas por 5201, 6201 e 6401 --
     v_total_ebs := 0;
     v_total_ebs_retirar:=0;
     BEGIN
         select (sum(nvl(vl_debitos,0)) - sum(nvl(vl_creditos,0)))
           into v_total_ebs
           from ca.ebs_balancete_cc
          where nr_ano = v_nr_ano_ebs
            and nr_mes = v_nr_mes_ebs
            and ((cd_ccontabil_ebs like '5201%') or (cd_ccontabil_ebs like '6201%') or (cd_ccontabil_ebs like '6401%'));
         --select (sum(decode(vf.tipo_lancto,'DB',vf.valor,0)) - sum(decode(vf.tipo_lancto,'CR',vf.valor,0)))
         --  into v_total_ebs
         --  from ca.ebs_fp_verbas_funcionarios vf
         -- where vf.competencia = v_dt_folha
         --   and ((vf.cta_contabil like '5201%') or (vf.cta_contabil like '6201%') or (vf.cta_contabil like '6401%'));
         select (sum(nvl(vl_debitos,0)) - sum(nvl(vl_creditos,0)))
           into v_total_ebs_retirar
           from ca.ebs_balancete_cc
          where nr_ano = v_nr_ano_ebs
            and nr_mes = v_nr_mes_ebs
            and (    (cd_ccontabil_ebs  like '52010304001002%') 
                  or (cd_ccontabil_ebs  like '62010304001002%') 
                  or (cd_ccontabil_ebs  like '64010304001002%')
                )
            ;
         v_total_ebs := v_total_ebs - v_total_ebs_retirar;
     EXCEPTION
           when no_data_found then
                v_mensagem := v_total_ebs;
                p_ds_msg := 'Não existem débitos e créditos das contas iniciadas por 5201, 6201 e 6401 ' || v_mensagem || '.';
                p_tp_mensagem := 'A';
                --p_status := 2;
                s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_total_ebs := v_total_ebs * (-1);
     -- Busca id do plano de contas do custo de pessoal
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_custo
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.040.010';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado de custo de pessoal: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca id do plano de contas do custo indireto
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_custo_ind
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.040.015';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado de custo indireto: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca id do plano de contas da despesa de pessoal
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_desp
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.060.030';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado de despesas de pessoal: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca id do código estruturado da fundação.
     BEGIN
       v_id_estrutura_org_ex := 0;
       select id_estrutura_org_ex
         into v_id_estrutura_org_ex
         from ca.dre_estrutura_org_ex e
        where e.nr_ano = p_nr_ano
          and e.nr_mes = p_nr_mes
          and e.cd_estruturado = '01';
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado para Fundação: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca valor na dre do custo de pessoal para fundação
     BEGIN
       v_dre_valor_custo := 0;
       select vl_dre
         into v_dre_valor_custo
         from ca.dre_valor v
        where v.nr_ano = p_nr_ano
          and v.nr_mes = p_nr_mes
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_custo;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor de custo de pessoal para Fundação: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_custo;
     DBMS_OUTPUT.PUT_LINE('Custo: ' || v_mensagem);

     -- Busca valor na dre do custo indireto para fundação
     BEGIN
       v_dre_valor_custo_ind := 0;
       select vl_dre
         into v_dre_valor_custo_ind
         from ca.dre_valor v
        where v.nr_ano = p_nr_ano
          and v.nr_mes = p_nr_mes
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_custo_ind;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor de custo indireto para Fundação: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_custo_ind;
     DBMS_OUTPUT.PUT_LINE('Custo indireto: ' || v_mensagem);

     -- Busca valor na dre da despesa de pessoal para fundação
     BEGIN
       v_dre_valor_desp := 0;
       select vl_dre
         into v_dre_valor_desp
         from ca.dre_valor v
        where v.nr_ano = p_nr_ano
          and v.nr_mes = p_nr_mes
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_desp;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor de despesa de pessoal para Fundação: ' || v_mensagem;
              p_tp_mensagem := 'A';
              --p_status := 2;
              s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_desp;
     p_ds_msg := 'Despesa: ' || v_mensagem;
     p_tp_mensagem := 'A';
     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     -- Total DRE-G - Somatório das contas de custos de pessoal (10.040.010), custos indiretos (10.040.015) e despesas de pessoal (10.060.030)
     v_total_dre := v_dre_valor_custo + v_dre_valor_custo_ind + v_dre_valor_desp;
     v_mensagem := v_total_dre;
     p_ds_msg := 'Valor DRE: ' || v_mensagem;
     p_tp_mensagem := 'A';
     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     -- Subtrair EBS - DRE-G
     -- Se negativo lançar na Fundação (01) em 10.910 Lançamentos a reclassificar - Débito
     -- Se positivo lançar Fundação (01) em 10.900 Lançamentos a reclassificar - Crédito

     v_total := v_total_ebs - v_total_dre;
     IF v_total < 0 THEN
        -- Busca o código do plano de contas de lançamentos a reclassificar - débito
        BEGIN
           select id_plano_de_contas
             into v_id_plano_de_contas
             from ca.dre_plano_de_contas pc
            where pc.cd_estruturado = '10.910';
        EXCEPTION
             WHEN no_data_found THEN
                  v_mensagem := sqlerrm;
                  p_ds_msg := 'Não foi encontrado o código do plano de contas de lançamentos a reclassificar - débito: ' || v_mensagem;
                  p_tp_mensagem := 'A';
                  --p_status := 2;
                  s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
        END;
     ELSE
        -- Busca o código do plano de contas de lançamentos a reclassificar - crédito
        BEGIN
           select id_plano_de_contas
             into v_id_plano_de_contas
             from ca.dre_plano_de_contas pc
            where pc.cd_estruturado = '10.900';
        EXCEPTION
             WHEN no_data_found THEN
                  v_mensagem := sqlerrm;
                  p_ds_msg := 'Não foi encontrado o código do plano de contas de lançamentos a reclassificar - crédito: ' || v_mensagem;
                  p_tp_mensagem := 'A';
                  --p_status := 2;
                  s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
        END;
     END IF;

     IF (v_id_plano_de_contas <> 0) THEN
         -- Busca valor na dre do lançamento a reclassificar para fundação
         BEGIN
           v_id_dre_valor := 0;
           select id_dre_valor
             into v_id_dre_valor
             from ca.dre_valor v
            where v.nr_ano = p_nr_ano
              and v.nr_mes = p_nr_mes
              and v.id_estrutura_org_ex = v_id_estrutura_org_ex
              and v.id_plano_contas = v_id_plano_de_contas;
         EXCEPTION
              WHEN no_data_found THEN
                    BEGIN
                        INSERT INTO ca.dre_valor
                                    (ID_DRE_VALOR,
                                     NR_ANO,
                                     NR_MES,
                                     ID_PLANO_CONTAS,
                                     ID_ESTRUTURA_ORG_EX,
                                     VL_DRE,
                                     FL_TOTAL
                                    )
                             VALUES (ca.sq_dre_valor.nextval,
                                     p_nr_ano,
                                     p_nr_mes,
                                     v_id_plano_de_contas,
                                     v_id_estrutura_org_ex,
                                     v_total,
                                     v_fl_total
                                    );
                        v_qtd_linhas := v_qtd_linhas + 1;
                    EXCEPTION
                        WHEN OTHERS THEN
                             p_ds_msg := 'Mensagem: ' || sqlerrm;
                             p_tp_mensagem := 'A';
                             --p_status := 2;
                             s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                    END;
         END;
         IF (v_id_dre_valor <> 0) THEN
            BEGIN
                 update ca.dre_valor
                    set vl_dre = v_total
                  where id_dre_valor = v_id_dre_valor;
                  v_qtd_linhas := v_qtd_linhas + 1;
            EXCEPTION
                WHEN OTHERS THEN
                     p_ds_msg := 'Mensagem: ' || sqlerrm;
                     p_tp_mensagem := 'A';
                     --p_status := 2;
                     s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
            END;

         END IF;
     END IF;
     commit;

    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão de lançamentos a reclassificar na DRE do ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas de lancamentos a reclassificar na DRE' || v_mensagem;
       p_tp_mensagem := 'A';
       s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_LANC_DIFERENCAS_DRE;

PROCEDURE P_RESULTADO_DISCIPLINA_TURMA (p_nr_ano in ca.dre_vl_apropriacao_direta.nr_ano%type,
                                        p_nr_mes in ca.dre_vl_apropriacao_direta.nr_mes%type,
                                        p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                                        p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_id_dre_valor               NUMBER   (8)    := 0;
    v_mensagem                   VARCHAR2 (1000) := NULL;
    v_qtd_linhas                 NUMBER   (6)    := 0;
    v_fl_total                   VARCHAR2 (1)    := '1';
    v_total_ebs                  NUMBER   (15,2) := 0;
    v_total_dre                  NUMBER   (15,2) := 0;
    v_total                      NUMBER   (15,2) := 0;
    v_dt_folha                   DATE;
    v_nr_ano                     VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                 VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                 VARCHAR2 (2)    := NULL;
    v_id_estrutura_org_ex        NUMBER   (8)    := 0;
    v_semestre                   NUMBER   (3)    := 0;
    v_semestre_atual             NUMBER   (3)    := 0;
    p_id_plano_execucao          NUMBER   (8)    := 0;
    p_id_controle_execucao       NUMBER   (8)    := 0;
    p_ds_msg                     VARCHAR2 (500)  := NULL;
    p_tp_mensagem                VARCHAR2 (1)    := NULL;
    p_status                     VARCHAR2 (1)    := NULL;

    cursor c_custo_disciplinas is
           select turma.cd_disciplina cdDisciplina,
                  turma.cd_turma cdTurma,
                  --nvl(s_fi_receita_turma (turma.cd_disciplina, turma.cd_turma, 3, 172, NULL)/6.0,0) vlReceita,
                  nvl((select sum(grade.vl_custo)
                         from ca.dre_grade_disciplina_turma grade
                        where grade.cd_disciplina = turma.cd_disciplina
                          and grade.cd_turma = turma.cd_turma
                          and grade.dt_folha = v_dt_folha),0) custo,
                  nvl((select sum(custoFilhos)
                         from (select (select sum(gradedt.vl_custo)
                                         from ca.dre_grade_disciplina_turma gradedt
                                        where gradedt.cd_disciplina = req.cd_disciplina_req
                                          and gradedt.cd_turma = req.cd_turma_req
                                         and gradedt.dt_folha = v_dt_folha) custoFilhos
                                 from ca.co_requisito req
                                where req.cd_disciplina = turma.cd_disciplina
                                  and req.cd_turma = turma.cd_turma
                                  and req.periodo = v_semestre)),0) custoFilhos,
                              disc.nm_disciplina nmDisciplina
             from ca.v_mae turma, ca.disciplina disc
            where turma.cd_disciplina = disc.cd_disciplina;


    cursor c_hist_custo_disciplinas is
           select turma.cd_disciplina cdDisciplina,
                  turma.cd_turma cdTurma,
                  --nvl(s_fi_receita_turma (turma.cd_disciplina, turma.cd_turma, 3, 172, NULL)/6.0,0) vlReceita,
                  nvl((select sum(grade.vl_custo)
                         from ca.dre_grade_disciplina_turma grade
                        where grade.cd_disciplina = turma.cd_disciplina
                          and grade.cd_turma = turma.cd_turma
                          and grade.dt_folha = v_dt_folha),0) custo,
                  nvl((select sum(custoFilhos)
                         from (select (select sum(gradedt.vl_custo)
                                         from ca.dre_grade_disciplina_turma gradedt
                                        where gradedt.cd_disciplina = req.cd_disciplina_req
                                          and gradedt.cd_turma = req.cd_turma_req
                                         and gradedt.dt_folha = v_dt_folha) custoFilhos
                                 from ca.co_requisito req
                                where req.cd_disciplina = turma.cd_disciplina
                                  and req.cd_turma = turma.cd_turma
                                  and req.periodo = v_semestre)),0) custoFilhos,
                              disc.nm_disciplina nmDisciplina
             from ca.hist_turma turma, ca.disciplina disc
            where turma.cd_disciplina = disc.cd_disciplina
              and cd_periodo = v_semestre
              and not exists (SELECT b.cd_disciplina, b.cd_turma, b.cd_curso
                                from ca.turma b, ca.co_requisito a
                               where a.cd_disciplina = turma.cd_disciplina
                                 and a.cd_turma = turma.cd_turma
                                 and a.cd_disciplina = b.cd_disciplina
                                 AND a.cd_turma = b.cd_turma
                                 AND b.tp_turma = 2
                                 AND a.periodo = v_semestre);

    ccd             c_custo_disciplinas%ROWTYPE;
    hcd             c_hist_custo_disciplinas%ROWTYPE;


BEGIN
     -- Busca código do plano de execução --
    /* select id_plano_execucao
       into p_id_plano_execucao
       from ca.dre_plano_execucao
      where nm_procedure = 'P_RESULTADO_DISCIPLINA_TURMA';


     s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                    p_nr_mes,
                                                    p_id_plano_execucao,
                                                    p_cd_estabelecimento,
                                                    p_nr_registro,
                                                    p_id_controle_execucao);


     p_status := 1;
*/
     v_qtd_linhas := 0;

   --  p_ds_msg := 'Avalia o resultado por disciplina turma.';
   --  p_tp_mensagem := 'A';
   --  s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
     v_nr_ano_ebs := substr(v_nr_ano,3,2);
     v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
     v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;

     -- Busca semestre --
     BEGIN
          select f_calcula_periodo(p_dt_desejada => v_dt_folha,p_tipo => 4)
            into v_semestre
            from dual;
     EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               p_tp_mensagem := 'A';
               --p_status := 2;
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;


     -- Busca semestre atual --
     BEGIN
          select f_calcula_periodo(p_dt_desejada => sysdate,p_tipo => 4)
            into v_semestre_atual
            from dual;
     EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               p_tp_mensagem := 'A';
               --p_status := 2;
               s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;


     IF (v_semestre = v_semestre_atual) THEN
         OPEN c_custo_disciplinas;


              LOOP
                  FETCH c_custo_disciplinas INTO ccd;


                  EXIT WHEN c_custo_disciplinas%NOTFOUND;


                  IF  c_custo_disciplinas%FOUND THEN


                      BEGIN
                            INSERT INTO ca.dre_resultado_disciplina
                                        (ID_RESULTADO_DISCIPLINA,
                                         NR_ANO,
                                         CD_DISCIPLINA,
                                         VL_CUSTO,
                                         NR_MES,
                                         CD_TURMA
                                        )
                                 VALUES (ca.sq_dre_resultado_disciplina.nextval,
                                         p_nr_ano,
                                         ccd.cdDisciplina,
                                         ccd.custo + ccd.custoFilhos,
                                         p_nr_mes,
                                         ccd.cdTurma
                                        );
                            v_qtd_linhas := v_qtd_linhas + 1;
                      EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                      END;


                  END IF;
              END LOOP;
         CLOSE c_custo_disciplinas;
     ELSE
         OPEN c_hist_custo_disciplinas;


              LOOP
                  FETCH c_hist_custo_disciplinas INTO hcd;


                  EXIT WHEN c_hist_custo_disciplinas%NOTFOUND;


                  IF  c_hist_custo_disciplinas%FOUND THEN


                      BEGIN
                            INSERT INTO ca.dre_resultado_disciplina
                                        (ID_RESULTADO_DISCIPLINA,
                                         NR_ANO,
                                         CD_DISCIPLINA,
                                         VL_CUSTO,
                                         NR_MES,
                                         CD_TURMA
                                        )
                                 VALUES (ca.sq_dre_resultado_disciplina.nextval,
                                         p_nr_ano,
                                         hcd.cdDisciplina,
                                         hcd.custo + hcd.custoFilhos,
                                         p_nr_mes,
                                         hcd.cdTurma
                                        );
                            v_qtd_linhas := v_qtd_linhas + 1;
                      EXCEPTION
                            WHEN OTHERS THEN
                                 p_ds_msg := 'Mensagem: ' || sqlerrm;
                                 p_tp_mensagem := 'A';
                                 --p_status := 2;
                                --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
                      END;


                  END IF;
              END LOOP;
         CLOSE c_hist_custo_disciplinas;
     END IF;
     commit;


    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão disciplinas/turma na tabela de Resultado de Disciplina no ano ' || p_nr_ano ||
                            ' mês ' || p_nr_mes || '. Mensagem: ' || v_mensagem;
       p_tp_mensagem := 'A';
       --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas de disciplinas/turma na tabela de Resultado de Disciplina: ' || v_mensagem;
       p_tp_mensagem := 'A';
       --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    --s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_RESULTADO_DISCIPLINA_TURMA;

PROCEDURE P_OVERHEAD (p_dt_inicial in ca.dre_overhead.dt_inicial%type,
                      p_dt_final in ca.dre_overhead.dt_final%type,
                      p_cd_estabelecimento in ca.dre_controle_execucao.cd_estabelecimento%type,
                      p_nr_registro in ca.dre_controle_execucao.nr_registro%type) IS

    v_id_dre_valor                 NUMBER   (8)    := 0;
    v_mensagem                     VARCHAR2 (1000) := NULL;
    v_qtd_linhas                   NUMBER   (6)    := 0;
    v_fl_total                     VARCHAR2 (1)    := '1';
    v_total_ebs                    NUMBER   (15,2) := 0;
    v_total_dre                    NUMBER   (15,2) := 0;
    v_total                        NUMBER   (15,2) := 0;
    v_dt_folha                     DATE;
    v_nr_ano                       VARCHAR2 (4)    := NULL;
    v_nr_ano_ini                   VARCHAR2 (4)    := NULL;
    v_nr_ano_fim                   VARCHAR2 (4)    := NULL;
    v_nr_ano_ebs                   VARCHAR2 (2)    := NULL;
    v_nr_mes_ebs                   VARCHAR2 (2)    := NULL;
    v_nr_mes_ini                   VARCHAR2 (2)    := NULL;
    v_nr_mes_fim                   VARCHAR2 (2)    := NULL;
    v_id_plano_de_contas           NUMBER   (8)    := 0;
    v_id_plano_de_contas_desp      NUMBER   (8)    := 0;
    v_id_plano_de_contas_custo     NUMBER   (8)    := 0;
    v_id_plano_de_contas_custo_pes NUMBER   (8)    := 0;
    v_id_plano_de_contas_rec       NUMBER   (8)    := 0;
    v_id_plano_de_contas_dep       NUMBER   (8)    := 0;
    v_id_estrutura_org_ex          NUMBER   (8)    := 0;
    v_dre_valor_desp               NUMBER   (15,2) := 0;

    v_dre_valor_custo              NUMBER   (15,2) := 0;
    v_dre_valor_custo_pes          NUMBER   (15,2) := 0;
    v_dre_valor_custo_dis          NUMBER   (15,2) := 0;
    v_dre_valor_rec                NUMBER   (15,2) := 0;
    v_dre_valor_dep                NUMBER   (15,2) := 0;
    v_vl_percentual_overhead       NUMBER   (15,2) := 0;
    v_semestre                     NUMBER   (3)    := 0;
    v_semestre_atual               NUMBER   (3)    := 0;
    p_id_plano_execucao            NUMBER   (8)    := 0;
    p_id_controle_execucao         NUMBER   (8)    := 0;
    p_ds_msg                       VARCHAR2 (500)  := NULL;
    p_tp_mensagem                  VARCHAR2 (1)    := NULL;
    p_status                       VARCHAR2 (1)    := NULL;


BEGIN
     -- Busca código do plano de execução --
     --select id_plano_execucao
     --  into p_id_plano_execucao
     --  from ca.dre_plano_execucao
     -- where nm_procedure = 'P_OVERHEAD';


     --s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
     --                                               p_nr_mes,
     --                                               p_id_plano_execucao,
     --                                               p_cd_estabelecimento,
     --                                               p_nr_registro,
     --                                               p_id_controle_execucao);


     --p_status := 1;

     v_qtd_linhas := 0;

     p_ds_msg := 'Calcula o percentual do overhead do ano/semestre.';
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);
     --p_tp_mensagem := 'A';
     --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     --v_nr_ano     := trim(to_char(p_nr_ano,'9999'));
     --v_nr_ano_ebs := substr(v_nr_ano,3,2);
     --v_nr_mes_ebs := trim(to_char(p_nr_mes,'00'));
     --v_dt_folha := To_Date( '01/' ||v_nr_mes_ebs||'/'||v_nr_ano_ebs,'dd/mm/yy') ;
     v_nr_ano_ini := extract(year from p_dt_inicial); --select to_char(p_dt_inicial, 'YYYY') from dual;
     DBMS_OUTPUT.PUT_LINE(v_nr_ano_ini);
     v_nr_ano_fim := extract(year from p_dt_final); --select to_char(p_dt_final, 'YYYY') from dual;
      DBMS_OUTPUT.PUT_LINE(v_nr_ano_fim);
     v_nr_mes_ini := extract(month from p_dt_inicial); --select to_char(p_dt_inicial, 'MM') from dual;
      DBMS_OUTPUT.PUT_LINE(v_nr_mes_ini);
     v_nr_mes_fim := extract(month from p_dt_final); --select to_char(p_dt_final, 'MM') from dual;
      DBMS_OUTPUT.PUT_LINE(v_nr_mes_fim);

     -- Busca semestre --
     BEGIN
          select f_calcula_periodo(p_dt_desejada => p_dt_inicial,p_tipo => 4)
            into v_semestre
            from dual;
     EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               DBMS_OUTPUT.PUT_LINE(p_ds_msg);
               --p_tp_mensagem := 'E';
               --p_status := 2;
               --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;


     -- Busca semestre atual --
     BEGIN
          select ca.f_calcula_periodo(p_dt_desejada => sysdate,p_tipo => 4)
            into v_semestre_atual
            from dual;
     EXCEPTION
          WHEN OTHERS THEN--
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               DBMS_OUTPUT.PUT_LINE(p_ds_msg);
               --p_tp_mensagem := 'E';
               --p_status := 2;
               --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;


     -- Calcular o percentual do overhead do mês / ano - Somente uma vez, pois serve para todas as disciplinas.


     -- Busca id do código estruturado da fundação.
     BEGIN
       v_id_estrutura_org_ex := 0;
       select id_estrutura_org_ex
         into v_id_estrutura_org_ex
         from ca.dre_estrutura_org_ex e
        where e.nr_ano = v_nr_ano_ini
          and e.nr_mes = v_nr_mes_ini
          and e.cd_estruturado = '01';
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado para Fundação: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;


     -- Totalizar valor da Receita Operacional Bruta da tabela CA.DRE_VALOR
     p_ds_msg := 'Totalizar valor da Receita Operacional Bruta da tabela CA.DRE_VALOR.';
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);
     --p_tp_mensagem := 'A';
     --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


     -- Busca id do plano de contas para receita operacional bruta
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_rec
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.010';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado para receita operacional bruta: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca valor na dre da receita operacional bruta para fundação
     BEGIN
       v_dre_valor_rec  := 0;
       select sum(vl_dre)
         into v_dre_valor_rec
         from ca.dre_valor v
        where (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  >= to_char(p_dt_inicial, 'YYYYMM')
          and (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  <= to_char(p_dt_final, 'YYYYMM')
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_rec;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor de receita operacional bruta para Fundação: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_rec;
     DBMS_OUTPUT.PUT_LINE('Receita Operacional Bruta: ' || v_mensagem);

     --	Totalizar valor do Custos dos serviços prestados - Pessoal da tabela CA.DRE_VALOR
     p_ds_msg := 'Totalizar valor do Custos dos serviços prestados - Pessoal da tabela CA.DRE_VALOR.';
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);
     --p_tp_mensagem := 'A';
     --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     -- Busca id do plano de contas dos custos dos serviços prestados pessoal
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_custo_pes
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.040.015';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado dos custos dos serviços prestados pessoal: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca valor na dre dos custos dos serviços prestados pessoal
     BEGIN
       v_dre_valor_custo_pes := 0;
       select sum(vl_dre)
         into v_dre_valor_custo_pes
         from ca.dre_valor v
        where (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  >= to_char(p_dt_inicial, 'YYYYMM')
          and (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  <= to_char(p_dt_final, 'YYYYMM')
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_custo_pes;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor dos custos dos serviços pretsados pessoal: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_custo_pes;
     DBMS_OUTPUT.PUT_LINE('Custo Pessoal: ' || v_mensagem);

     /*
     --	Totalizar valor do Custos das disciplinas da tabela CA.DRE_GRADE_DISCIPLINA_TURMA
     p_ds_msg := 'Totalizar valor do Custos das disciplinas da tabela CA.DRE_GRADE_DISCIPLINA_TURMA.';
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);

     -- Busca valor dos custos na grade disciplina turma
     BEGIN
       v_dre_valor_custo_dis := 0;
       select sum(vl_custo)
         into v_dre_valor_custo_dis
         from ca.dre_grade_disciplina_turma g
        where g.dt_folha >= p_dt_inicial
          and g.dt_folha <= p_dt_final;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor dos custos na grade disciplina turma: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_custo_dis;
     DBMS_OUTPUT.PUT_LINE('Custo Disciplina: ' || v_mensagem);
     */

     --	Totalizar valor do Custos dos serviços prestados - Outros da tabela CA.DRE_VALOR
     p_ds_msg := 'Totalizar valor do Custos dos serviços prestados - Outros da tabela CA.DRE_VALOR.';
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);
     --p_tp_mensagem := 'A';
     --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


     -- Busca id do plano de contas dos custos dos serviços prestados outros
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_custo
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.040.020';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado dos custos dos serviços prestados outros: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;


     -- Busca valor na dre dos custos dos serviços prestados outros
     BEGIN
       v_dre_valor_custo := 0;
       select sum(vl_dre)
         into v_dre_valor_custo
         from ca.dre_valor v
        where (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  >= to_char(p_dt_inicial, 'YYYYMM')
          and (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  <= to_char(p_dt_final, 'YYYYMM')
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_custo;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor dos custos dos serviços pretsados outros: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_custo;
     DBMS_OUTPUT.PUT_LINE('Custo: ' || v_mensagem);


     --	Totalizar valor das Despesas operacionais da tabela CA.DRE_VALOR
     p_ds_msg := 'Totalizar valor das Despesas operacionais da tabela CA.DRE_VALOR.';
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);
     --p_tp_mensagem := 'A';
     --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


     -- Busca id do plano de contas das despesas operacionais
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_desp
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.060';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado das despesas operacionais: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca valor na dre das despesas operacionais para fundação
     BEGIN
       v_dre_valor_desp := 0;
       select sum(vl_dre)
         into v_dre_valor_desp
         from ca.dre_valor v
        where (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  >= to_char(p_dt_inicial, 'YYYYMM')
          and (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  <= to_char(p_dt_final, 'YYYYMM')
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_desp;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor das despesas operacionais para Fundação: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_desp;
     DBMS_OUTPUT.PUT_LINE('Despesa: ' || v_mensagem);


     -- Totalizar valor da Depreciação e amortização da tabela CA.DRE_VALOR
     p_ds_msg := 'Totalizar valor da Depreciação e amortização da tabela CA.DRE_VALOR.';
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);
     --p_tp_mensagem := 'A';
     --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);


     -- Busca id do plano de contas da Depreciação e amortização
     BEGIN
       select id_plano_de_contas
         into v_id_plano_de_contas_dep
         from ca.dre_plano_de_contas pc
        where pc.cd_estruturado = '10.080';
     EXCEPTION
         WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado código estruturado da Depreciação e amortização: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;

     -- Busca valor na dre da Depreciação e amortização para fundação
     BEGIN
       v_dre_valor_dep := 0;
       select sum(vl_dre)
         into v_dre_valor_dep
         from ca.dre_valor v
        where (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  >= to_char(p_dt_inicial, 'YYYYMM')
          and (trim(to_char(v.nr_ano,'9999')) || trim(to_char(v.nr_mes,'00')))  <= to_char(p_dt_final, 'YYYYMM')
          and v.id_estrutura_org_ex = v_id_estrutura_org_ex
          and v.id_plano_contas = v_id_plano_de_contas_dep;
     EXCEPTION
          WHEN no_data_found THEN
              v_mensagem := sqlerrm;
              p_ds_msg := 'Não foi encontrado valor da Depreciação e amortização para Fundação: ' || v_mensagem;
              DBMS_OUTPUT.PUT_LINE(p_ds_msg);
              --p_tp_mensagem := 'E';
              --p_status := 2;
              --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
     END;
     v_mensagem := v_dre_valor_dep;
     DBMS_OUTPUT.PUT_LINE('Depreciação e amortização: ' || v_mensagem);


     -- Calcular percentual do Overhead
     v_vl_percentual_overhead := ((v_dre_valor_custo_pes + v_dre_valor_custo + v_dre_valor_desp + v_dre_valor_dep) /
                                   v_dre_valor_rec) * 100;
     v_mensagem := v_vl_percentual_overhead;
     p_ds_msg := 'Percentual do Overhead: ' || v_mensagem;
     DBMS_OUTPUT.PUT_LINE(p_ds_msg);
     --p_tp_mensagem := 'A';
     --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

     BEGIN
          INSERT INTO ca.dre_overhead
                      (ID_OVERHEAD,
                       NR_ANO,
                       NR_SEMESTRE,
                       VL_PERCENTUAL_OVERHEAD,
                       DT_INICIAL,
                       DT_FINAL
                      )
               VALUES (ca.sq_dre_overhead.nextval,
                       v_nr_ano_ini,
                       v_semestre,
                       v_vl_percentual_overhead,
                       p_dt_inicial,
                       p_dt_final
                      );
          v_qtd_linhas := v_qtd_linhas + 1;
    EXCEPTION
          WHEN OTHERS THEN
               p_ds_msg := 'Mensagem: ' || sqlerrm;
               DBMS_OUTPUT.PUT_LINE(p_ds_msg);
               --p_tp_mensagem := 'E';
               --p_status := 2;
               --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END;


    commit;


    IF v_qtd_linhas = 0 THEN
       v_mensagem := sqlerrm;
       p_ds_msg := 'Não foi realizada inclusão disciplinas/turma na tabela de Resultado de Disciplina no ano ' || v_nr_ano_ini ||
                            ' mês ' || v_nr_mes_ini || '. Mensagem: ' || v_mensagem;
       DBMS_OUTPUT.PUT_LINE(p_ds_msg);
       --p_tp_mensagem := 'A';
       --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    ELSE
       v_mensagem := v_qtd_linhas;
       p_ds_msg := 'Total de linhas incluidas de disciplinas/turma na tabela de Resultado de Disciplina: ' || v_mensagem;
       DBMS_OUTPUT.PUT_LINE(p_ds_msg);
       --p_tp_mensagem := 'A';
       --s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
    END IF;

    --s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END P_OVERHEAD;

PROCEDURE P_INSERE_EST_ORG_EX (P_NR_ANO IN CA.DRE_ESTRUTURA_ORG_EX.NR_ANO%TYPE,
                               P_NR_MES IN CA.DRE_ESTRUTURA_ORG_EX.NR_MES%TYPE,
                               P_CD_ESTABELECIMENTO IN CA.DRE_PERIODO.CD_ESTABELECIMENTO%TYPE,
                               P_NR_REGISTRO IN CA.DRE_PERIODO.NR_REGISTRO%TYPE) IS

  L_ID_ESTRUTURA_ORG_EX CA.DRE_ESTRUTURA_ORG_EX.ID_ESTRUTURA_ORG_EX%TYPE;
  L_ID_ESTRUTURA_ORG_PAI_EX CA.DRE_ESTRUTURA_ORG_EX.ID_ESTRUTURA_ORG_EX%TYPE;
  L_CD_ESTRUTURADO_PAI CA.DRE_ESTRUTURA_ORG.CD_ESTRUTURADO%TYPE;
  CURSOR CR_DRE_ESTRUTURA_ORG_EX (P_NR_ANO IN CA.DRE_ESTRUTURA_ORG_EX.NR_ANO%TYPE,
                                  P_NR_MES IN CA.DRE_ESTRUTURA_ORG_EX.NR_MES%TYPE) IS
  SELECT
    ID_ESTRUTURA_ORG_EX
  FROM CA.DRE_ESTRUTURA_ORG_EX
  WHERE NR_ANO = P_NR_ANO AND NR_MES = P_NR_MES;
  ST_DRE_ESTRUTURA_ORG_EX CR_DRE_ESTRUTURA_ORG_EX%ROWTYPE;

  CURSOR CR_DRE_ESTRUTURA_ORG IS
  SELECT
    ID_ESTRUTURA_ORG,
    CD_ESTRUTURADO,
    DS_ESTRUTURA_ORG,
    DS_ESTRUTURA_ORG_RESUMIDA,
    NR_NIVEL,
    ID_ESTRUTURA_ORG_PAI,
    CD_INDICADOR_UN_NEGOCIO
  FROM CA.DRE_ESTRUTURA_ORG
  ORDER BY CD_ESTRUTURADO;
  ST_DRE_ESTRUTURA_ORG CR_DRE_ESTRUTURA_ORG%ROWTYPE;

  p_id_plano_execucao          NUMBER   (8)    := 0;
  p_id_controle_execucao       NUMBER   (8)    := 0;
  p_ds_msg                     VARCHAR2 (500)  := NULL;
  p_tp_mensagem                VARCHAR2 (1)    := NULL;
  p_status                     VARCHAR2 (1)    := NULL;

BEGIN

  -- Busca código do plano de execução --
  select id_plano_execucao
    into p_id_plano_execucao
    from ca.dre_plano_execucao
   where nm_procedure = 'P_INSERE_EST_ORG_EX';


  s_DRE_ANALISE_GERENCIAL.P_INICIO_EXECUCAO_DRE (p_nr_ano,
                                                 p_nr_mes,
                                                 p_id_plano_execucao,
                                                 p_cd_estabelecimento,
                                                 p_nr_registro,
                                                 p_id_controle_execucao);


  p_status := 1;

  -- Verifica se ja existe algum registro do exercicio informado
  OPEN CR_DRE_ESTRUTURA_ORG_EX(P_NR_ANO, P_NR_MES);
  FETCH CR_DRE_ESTRUTURA_ORG_EX INTO ST_DRE_ESTRUTURA_ORG_EX;
  IF CR_DRE_ESTRUTURA_ORG_EX%NOTFOUND THEN
  -- Se nao existe nenhum registro referente ao exercicio informado

    -- Pesquisa todos os registros da tabela de estrutura organizacional
    OPEN CR_DRE_ESTRUTURA_ORG;
    LOOP
      FETCH CR_DRE_ESTRUTURA_ORG INTO ST_DRE_ESTRUTURA_ORG;
      EXIT WHEN CR_DRE_ESTRUTURA_ORG%NOTFOUND;

        -- Guarda o id da estrutura organizacional do exercicio
        -- para inserir o registro e os itens (composicao)
        L_ID_ESTRUTURA_ORG_EX := CA.SQ_DRE_ESTRUTURA_ORG_EX.NEXTVAL;

        -- Pesquisa o id pai da estrutura organizacional do exercicio
        IF ST_DRE_ESTRUTURA_ORG.ID_ESTRUTURA_ORG_PAI IS NOT NULL THEN
          SELECT CD_ESTRUTURADO
          INTO L_CD_ESTRUTURADO_PAI
          FROM CA.DRE_ESTRUTURA_ORG
          WHERE ID_ESTRUTURA_ORG = ST_DRE_ESTRUTURA_ORG.ID_ESTRUTURA_ORG_PAI;

          SELECT ID_ESTRUTURA_ORG_EX
          INTO L_ID_ESTRUTURA_ORG_PAI_EX
          FROM CA.DRE_ESTRUTURA_ORG_EX
          WHERE CD_ESTRUTURADO = L_CD_ESTRUTURADO_PAI
            AND NR_ANO = P_NR_ANO
            AND NR_MES = P_NR_MES;
        ELSE
          L_CD_ESTRUTURADO_PAI := NULL;
        END IF;

        -- insere o registro da estrutura organizacional do exercicio
        INSERT INTO CA.DRE_ESTRUTURA_ORG_EX
          (ID_ESTRUTURA_ORG_EX,
          CD_ESTRUTURADO,
          DS_ESTRUTURA_ORG,
          DS_ESTRUTURA_ORG_RESUMIDA,
          NR_NIVEL,
          ID_ESTRUTURA_ORG_PAI_EX,
          CD_INDICADOR_UN_NEGOCIO,
          NR_ANO,
          NR_MES)
        VALUES
          (L_ID_ESTRUTURA_ORG_EX,
          ST_DRE_ESTRUTURA_ORG.CD_ESTRUTURADO,
          ST_DRE_ESTRUTURA_ORG.DS_ESTRUTURA_ORG,
          ST_DRE_ESTRUTURA_ORG.DS_ESTRUTURA_ORG_RESUMIDA,
          ST_DRE_ESTRUTURA_ORG.NR_NIVEL,
          L_ID_ESTRUTURA_ORG_PAI_EX,
          ST_DRE_ESTRUTURA_ORG.CD_INDICADOR_UN_NEGOCIO,
          P_NR_ANO,
          P_NR_MES);

        -- insere os itens da estrutura organizacional do exercicio
        INSERT INTO CA.DRE_ESTRUTURA_ORG_ITENS_EX
          (ID_ESTRUTURA_ORG_ITENS_EX,
          ID_ESTRUTURA_ORG_EX,
          CD_CENTRO_CUSTO_EBS)
        SELECT
          CA.SQ_DRE_ESTRUTURA_ORG_ITENS_EX.NEXTVAL,
          L_ID_ESTRUTURA_ORG_EX,
          CD_CENTRO_CUSTO_EBS
        FROM CA.DRE_ESTRUTURA_ORG_ITENS
        WHERE ID_ESTRUTURA_ORG = ST_DRE_ESTRUTURA_ORG.ID_ESTRUTURA_ORG;

      END LOOP;
    CLOSE CR_DRE_ESTRUTURA_ORG;
    COMMIT;

    --P_FL_ERRO := 'N';
    --P_DS_MENSAGEM_RETORNO := 'A estrutura organizacional do exercício foi inserida com sucesso.';
    p_ds_msg := 'A estrutura organizacional do exercício foi inserida com sucesso.';
    p_tp_mensagem := 'A';
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);

  ELSE
    --P_FL_ERRO := 'S';
    --P_DS_MENSAGEM_RETORNO := 'Já existe uma estrutura organizacional para o exercício informado.';
    p_ds_msg := 'Já existe uma estrutura organizacional para o exercício informado.';
    p_tp_mensagem := 'E';
    p_status := 2;
    s_DRE_ANALISE_GERENCIAL.P_LOG_EXECUCAO_DRE (p_id_controle_execucao,p_ds_msg,p_tp_mensagem);
  END IF;
  CLOSE CR_DRE_ESTRUTURA_ORG_EX;


  s_DRE_ANALISE_GERENCIAL.P_TERMINO_EXECUCAO_DRE (p_id_controle_execucao,p_status);

END;

PROCEDURE P_INSERE_PERIODO (P_ID_PERIODO_DRE OUT CA.DRE_PERIODO.ID_PERIODO_DRE%TYPE,
                                P_NR_ANO IN CA.DRE_PERIODO.NR_ANO%TYPE,
                                P_NR_MES IN CA.DRE_PERIODO.NR_MES%TYPE,
                                P_CD_ESTABELECIMENTO IN CA.DRE_PERIODO.CD_ESTABELECIMENTO%TYPE,
                                P_NR_REGISTRO IN CA.DRE_PERIODO.NR_REGISTRO%TYPE,
                                P_FL_ERRO OUT VARCHAR2,
                                P_DS_MENSAGEM_RETORNO OUT VARCHAR2) IS

CURSOR CR_PERIODO (P_NR_ANO in CA.DRE_PERIODO.nr_ano%type,
                   P_NR_MES in CA.DRE_PERIODO.nr_mes%type) IS
SELECT *
FROM CA.DRE_PERIODO
WHERE NR_ANO = P_NR_ANO
AND NR_MES = P_NR_MES;

CURSOR CR_PERIODO_ANTERIOR (P_NR_ANO in CA.DRE_PERIODO.nr_ano%type,
                            P_NR_MES in CA.DRE_PERIODO.nr_mes%type) IS
SELECT *
FROM CA.DRE_PERIODO
WHERE NR_ANO = P_NR_ANO
AND NR_MES = P_NR_MES;

ST_PERIODO CR_PERIODO%ROWTYPE;
ST_PERIODO_ANTERIOR CR_PERIODO_ANTERIOR%ROWTYPE;
L_NR_ANO CA.DRE_PERIODO.NR_ANO%TYPE;
L_NR_MES CA.DRE_PERIODO.NR_MES%TYPE;
L_ID_PERIODO_DRE CA.DRE_PERIODO.ID_PERIODO_DRE%TYPE;
L_DATA_PERIODO DATE;

BEGIN
  L_DATA_PERIODO := to_date(P_NR_ANO ||'-'||P_NR_MES||'-01', 'YYYY-MM-DD');


  -- Só pode abrir período atual ou do mes anterior
  IF L_DATA_PERIODO > SYSDATE THEN
    P_FL_ERRO := 'S';
    P_DS_MENSAGEM_RETORNO := 'Só é permitido abrir o período atual ou anterior.';
  ELSE


    -- validar se ja existe
    OPEN CR_PERIODO(P_NR_ANO, P_NR_MES);
    FETCH CR_PERIODO INTO ST_PERIODO;
    IF CR_PERIODO%NOTFOUND THEN


      SELECT MIN(ID_PERIODO_DRE) INTO L_ID_PERIODO_DRE
      FROM CA.DRE_PERIODO;


      IF L_ID_PERIODO_DRE IS NOT NULL THEN
        -- validar se o anterior existe
        IF P_NR_MES = 1 THEN
          L_NR_MES := 12;
          L_NR_ANO := P_NR_ANO - 1;
        ELSE
          L_NR_MES := P_NR_MES - 1;
          L_NR_ANO := P_NR_ANO;
        END IF;
        OPEN CR_PERIODO_ANTERIOR(L_NR_ANO, L_NR_MES);
        FETCH CR_PERIODO_ANTERIOR INTO ST_PERIODO_ANTERIOR;
        IF CR_PERIODO_ANTERIOR%NOTFOUND THEN
          P_FL_ERRO := 'S';
          P_DS_MENSAGEM_RETORNO := 'Período anterior não existe.';
        ELSE
          -- validar se o anterior esta fechado
          IF ST_PERIODO_ANTERIOR.STATUS = '1' THEN
            SELECT CA.SQ_DRE_ESTRUTURA_ORG.NEXTVAL INTO P_ID_PERIODO_DRE FROM DUAL;
            INSERT INTO CA.DRE_PERIODO
                (ID_PERIODO_DRE,
                NR_ANO,
                NR_MES,
                STATUS,
                CD_ESTABELECIMENTO,
                NR_REGISTRO)
            VALUES
                (P_ID_PERIODO_DRE,
                P_NR_ANO,
                P_NR_MES,
                '0',
                P_CD_ESTABELECIMENTO,
                P_NR_REGISTRO);


            P_FL_ERRO := 'N';
            P_DS_MENSAGEM_RETORNO := 'Período aberto com sucesso.';
          ELSE
            P_FL_ERRO := 'S';
            P_DS_MENSAGEM_RETORNO := 'Período anterior está aberto.';
          END IF;
        END IF;
        CLOSE CR_PERIODO_ANTERIOR;
      ELSE
        -- Tabela vazia
        SELECT CA.SQ_DRE_ESTRUTURA_ORG.NEXTVAL INTO P_ID_PERIODO_DRE FROM DUAL;
        INSERT INTO CA.DRE_PERIODO
            (ID_PERIODO_DRE,
            NR_ANO,
            NR_MES,
            STATUS,
            CD_ESTABELECIMENTO,
            NR_REGISTRO)
        VALUES
            (P_ID_PERIODO_DRE,
            P_NR_ANO,
            P_NR_MES,
            '0',
            P_CD_ESTABELECIMENTO,
            P_NR_REGISTRO);


        P_FL_ERRO := 'N';
        P_DS_MENSAGEM_RETORNO := 'Período aberto com sucesso.';
      END IF;


    ELSE
      P_FL_ERRO := 'S';
      P_DS_MENSAGEM_RETORNO := 'Período já cadastrado.';
    END IF;
    CLOSE CR_PERIODO;


  END IF;

END;

PROCEDURE P_ALTERA_PERIODO (P_ID_PERIODO_DRE IN CA.DRE_PERIODO.ID_PERIODO_DRE%TYPE,
                            P_CD_ESTABELECIMENTO IN CA.DRE_PERIODO.CD_ESTABELECIMENTO%TYPE,
                            P_NR_REGISTRO IN CA.DRE_PERIODO.NR_REGISTRO%TYPE,
                            P_FL_ERRO OUT VARCHAR2,
                            P_DS_MENSAGEM_RETORNO OUT VARCHAR2) IS
	CURSOR CR_PERIODO (P_NR_ANO in CA.DRE_PERIODO.nr_ano%type,
                     P_NR_MES in CA.DRE_PERIODO.nr_mes%type) IS
  SELECT *
  FROM CA.DRE_PERIODO
  WHERE NR_ANO = P_NR_ANO
  AND NR_MES = P_NR_MES;
  L_STATUS CA.DRE_PERIODO.STATUS%TYPE;
  L_NR_ANO CA.DRE_PERIODO.NR_ANO%TYPE;
  L_NR_MES CA.DRE_PERIODO.NR_MES%TYPE;
  L_NR_ANO_ANT CA.DRE_PERIODO.NR_ANO%TYPE;
  L_NR_MES_ANT CA.DRE_PERIODO.NR_MES%TYPE;  
  L_ID_PERIODO_DRE CA.DRE_PERIODO.ID_PERIODO_DRE%TYPE;
  ST_PERIODO CR_PERIODO%ROWTYPE;
  L_STATUS_CONTROLE CA.DRE_CONTROLE_EXECUCAO.STATUS%TYPE;
BEGIN

	SELECT STATUS,NR_MES,NR_ANO
  INTO L_STATUS,L_NR_MES,L_NR_ANO
  FROM CA.DRE_PERIODO
  WHERE ID_PERIODO_DRE = P_ID_PERIODO_DRE;

  SELECT MIN(ID_PERIODO_DRE) INTO L_ID_PERIODO_DRE
  FROM CA.DRE_PERIODO
  WHERE NOT ID_PERIODO_DRE = P_ID_PERIODO_DRE;

  IF L_STATUS = '0' THEN -- FECHAMENTO DE PERIODO
    IF L_ID_PERIODO_DRE IS NOT NULL THEN
      -- validar se o periodo anterior esta fechado
      IF L_NR_MES = 1 THEN
        L_NR_MES_ANT := 12;
        L_NR_ANO_ANT:= L_NR_ANO - 1;
      ELSE
        L_NR_MES_ANT := L_NR_MES - 1;
      END IF;
      OPEN CR_PERIODO(L_NR_ANO_ANT, L_NR_MES_ANT);
      FETCH CR_PERIODO INTO ST_PERIODO;
      IF NOT CR_PERIODO%NOTFOUND THEN
        IF ST_PERIODO.STATUS = '0' THEN
          P_FL_ERRO := 'S';
          P_DS_MENSAGEM_RETORNO := 'Período anterior está aberto.';
        END IF;
      END IF;
      CLOSE CR_PERIODO;
    END IF;
    IF P_FL_ERRO IS NULL THEN
      -- validar se a ultima rotina foi completada sem erro
      SELECT CONTROLE.STATUS INTO L_STATUS_CONTROLE
      FROM CA.DRE_CONTROLE_EXECUCAO CONTROLE
      WHERE CONTROLE.NR_ANO = L_NR_ANO
      AND CONTROLE.NR_MES = L_NR_MES
      AND CONTROLE.ID_PLANO_EXECUCAO = (
      SELECT PLANO.ID_PLANO_EXECUCAO
      FROM CA.DRE_PLANO_EXECUCAO PLANO
      WHERE PLANO.NR_SEQ_EXECUCAO = (SELECT MAX(NR_SEQ_EXECUCAO) FROM CA.DRE_PLANO_EXECUCAO));

      IF L_STATUS_CONTROLE is not null and L_STATUS_CONTROLE = 1 THEN
        UPDATE CA.DRE_PERIODO SET
          STATUS = '1',
          CD_ESTABELECIMENTO = P_CD_ESTABELECIMENTO,
          NR_REGISTRO = P_NR_REGISTRO
        WHERE ID_PERIODO_DRE = P_ID_PERIODO_DRE;
        P_FL_ERRO := 'N';
        P_DS_MENSAGEM_RETORNO := 'Período fechado com sucesso.';
      ELSE
        P_FL_ERRO := 'S';
        P_DS_MENSAGEM_RETORNO := 'Período só pode ser fechado quando as rotinas forem completadas sem erro.';
      END IF;
    END IF;
	ELSE -- ABERTURA DE PERIODO

    IF L_ID_PERIODO_DRE IS NOT NULL THEN
      -- Validar se o periodo seguinte esta aberto
      IF L_NR_MES = 12 THEN
        L_NR_MES := 1;
        L_NR_ANO := L_NR_ANO + 1;
      ELSE
        L_NR_MES := L_NR_MES + 1;
      END IF;
      OPEN CR_PERIODO(L_NR_ANO, L_NR_MES);
      FETCH CR_PERIODO INTO ST_PERIODO;
      IF NOT CR_PERIODO%NOTFOUND THEN
        IF ST_PERIODO.STATUS = '1' THEN
          P_FL_ERRO := 'S';
          P_DS_MENSAGEM_RETORNO := 'Período seguinte está fechado.';
        END IF;
      END IF;
      CLOSE CR_PERIODO;
    END IF;

    IF P_FL_ERRO IS NULL THEN
      UPDATE CA.DRE_PERIODO SET
        STATUS = '0',
        CD_ESTABELECIMENTO = P_CD_ESTABELECIMENTO,
        NR_REGISTRO = P_NR_REGISTRO
      WHERE ID_PERIODO_DRE = P_ID_PERIODO_DRE;
      P_FL_ERRO := 'N';
      P_DS_MENSAGEM_RETORNO := 'Período aberto com sucesso.';
    END IF;

	END IF; -- ABERTURA OU FECHAMENTO DE PERIODO

  COMMIT;

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN
    P_FL_ERRO := 'S';
    P_DS_MENSAGEM_RETORNO := 'Período só pode ser fechado quando as rotinas forem completadas sem erro.';
  WHEN OTHERS
  THEN
    P_FL_ERRO := 'S';
    P_DS_MENSAGEM_RETORNO := 'Erro ao alterar status do período.'||SQLCODE||' -ERROR- '||SQLERRM;

END;

PROCEDURE P_PROCESSO_DRE (P_NR_ANO in CA.DRE_CONTROLE_EXECUCAO.nr_ano%type,
                          P_NR_MES in CA.DRE_CONTROLE_EXECUCAO.nr_mes%type,
                          P_ID_PLANO_EXECUCAO in CA.DRE_CONTROLE_EXECUCAO.id_plano_execucao%type,
                          P_CD_ESTABELECIMENTO in CA.DRE_CONTROLE_EXECUCAO.cd_estabelecimento%type,
                          P_NR_REGISTRO in CA.DRE_CONTROLE_EXECUCAO.nr_registro%type,
                          P_FL_ERRO OUT VARCHAR2,
                          P_DS_MENSAGEM_RETORNO OUT VARCHAR2) IS

CURSOR CR_CONTROLE_EXECUCAO (P_NR_ANO in CA.DRE_CONTROLE_EXECUCAO.nr_ano%type,
                             P_NR_MES in CA.DRE_CONTROLE_EXECUCAO.nr_mes%type,
                             P_ID_PLANO_EXECUCAO in CA.DRE_CONTROLE_EXECUCAO.id_plano_execucao%type) IS
SELECT *
FROM CA.DRE_CONTROLE_EXECUCAO
WHERE NR_ANO = P_NR_ANO
AND NR_MES = P_NR_MES
AND ID_PLANO_EXECUCAO = P_ID_PLANO_EXECUCAO;

CURSOR CR_CONTROLE_PREDECESSOR (P_NR_ANO in CA.DRE_CONTROLE_EXECUCAO.nr_ano%type,
                                P_NR_MES in CA.DRE_CONTROLE_EXECUCAO.nr_mes%type,
                                P_ID_PLANO_EXECUCAO in CA.DRE_CONTROLE_EXECUCAO.id_plano_execucao%type) IS
SELECT *
FROM CA.DRE_CONTROLE_EXECUCAO
WHERE NR_ANO = P_NR_ANO
AND NR_MES = P_NR_MES
AND ID_PLANO_EXECUCAO = P_ID_PLANO_EXECUCAO;

CURSOR CR_PLANO (P_ID_PLANO_EXECUCAO in CA.DRE_CONTROLE_EXECUCAO.id_plano_execucao%type) IS
SELECT *
FROM CA.DRE_PLANO_EXECUCAO
WHERE ID_PLANO_EXECUCAO = P_ID_PLANO_EXECUCAO;

CURSOR CR_PREDECESSOR (P_ID_PLANO_EXECUCAO in CA.DRE_CONTROLE_EXECUCAO.id_plano_execucao%type) IS
SELECT *
FROM CA.DRE_PLANO_EXECUCAO
WHERE ID_PLANO_EXECUCAO = P_ID_PLANO_EXECUCAO;

CURSOR CR_PERIODO (P_NR_ANO in CA.DRE_PERIODO.nr_ano%type,
                   P_NR_MES in CA.DRE_PERIODO.nr_mes%type) IS
SELECT *
FROM CA.DRE_PERIODO
WHERE NR_ANO = P_NR_ANO
AND NR_MES = P_NR_MES;

ST_PERIODO CR_PERIODO%ROWTYPE;
ST_CONTROLE_EXECUCAO CR_CONTROLE_EXECUCAO%ROWTYPE;
ST_CONTROLE_PREDECESSOR CR_CONTROLE_PREDECESSOR%ROWTYPE;
ST_PLANO CR_PLANO%ROWTYPE;
ST_PREDECESSOR CR_PREDECESSOR%ROWTYPE;
DRE_NR_JOB BINARY_INTEGER;
QT_JOBS_AGENDADOS NUMBER;

BEGIN


  SELECT COUNT(*) INTO QT_JOBS_AGENDADOS
  FROM user_jobs
  where what like 'BEGIN S_DRE_ANALISE_GERENCIAL%';


  IF QT_JOBS_AGENDADOS > 0 THEN
    P_FL_ERRO := 'S';
    P_DS_MENSAGEM_RETORNO := 'Já existe um processo agendado. Aguarde.';
  ELSE

  -- validar se o periodo existe
  OPEN CR_PERIODO(P_NR_ANO, P_NR_MES);
  FETCH CR_PERIODO INTO ST_PERIODO;
  IF CR_PERIODO%NOTFOUND THEN
    P_FL_ERRO := 'S';
    P_DS_MENSAGEM_RETORNO := 'Período não está cadastrado.';
  ELSE
    IF ST_PERIODO.STATUS = '0' THEN

      --Valida se o processo já foi executado
      OPEN CR_CONTROLE_EXECUCAO(P_NR_ANO, P_NR_MES, P_ID_PLANO_EXECUCAO);
      FETCH CR_CONTROLE_EXECUCAO INTO ST_CONTROLE_EXECUCAO;
      IF CR_CONTROLE_EXECUCAO%NOTFOUND OR ST_CONTROLE_EXECUCAO.STATUS = '3' THEN


        --Consulta plano de execução
        OPEN CR_PLANO(P_ID_PLANO_EXECUCAO);
        FETCH CR_PLANO INTO ST_PLANO;


        -- Valida se o plano de execucao foi encontrado
        IF CR_PLANO%NOTFOUND THEN
          P_FL_ERRO := 'S';
          P_DS_MENSAGEM_RETORNO := 'Plano de execução não encontrado.';
        ELSE


          --Valida se o processo anterior foi executado com sucesso
          IF ST_PLANO.ID_PREDECESSOR IS NOT NULL THEN
            OPEN CR_CONTROLE_PREDECESSOR(P_NR_ANO, P_NR_MES, ST_PLANO.ID_PREDECESSOR);
            FETCH CR_CONTROLE_PREDECESSOR INTO ST_CONTROLE_PREDECESSOR;
            IF CR_CONTROLE_PREDECESSOR%NOTFOUND THEN
              P_FL_ERRO := 'S';
              P_DS_MENSAGEM_RETORNO := 'Processo predecessor não executado.';
            ELSE
              IF ST_CONTROLE_PREDECESSOR.STATUS = '0' THEN
                P_FL_ERRO := 'S';
                P_DS_MENSAGEM_RETORNO := 'Processo predecessor está em andamento.';
              ELSE
                IF ST_CONTROLE_PREDECESSOR.STATUS = '2' THEN
                  P_FL_ERRO := 'S';
                  P_DS_MENSAGEM_RETORNO := 'Processo predecessor foi completado com erro.';
                END IF;
              END IF;
            END IF;
            CLOSE CR_CONTROLE_PREDECESSOR;
          END IF;


          IF P_FL_ERRO IS NULL THEN
            -- Executar processo

            CASE
            WHEN ST_PLANO.NM_PROCEDURE = 'P_INSERE_EST_ORG_EX' THEN
               dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_INSERE_EST_ORG_EX('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_CRIA_GRADE_ALUNO' THEN
               dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_CRIA_GRADE_ALUNO('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_CRIA_GRADE_DISCIPLINA_TURMA' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_CRIA_GRADE_DISCIPLINA_TURMA('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_APURA_VERBA' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_APURA_VERBA('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_APURA_VERBA_DOCENCIA_POS' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_APURA_VERBA_DOCENCIA_POS('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_APURA_VERBA_ADM' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_APURA_VERBA_ADM('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_CRIA_GRADE_ALOCACAO_DOCENTE' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_CRIA_GRADE_ALOCACAO_DOCENTE('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_ATU_GRADE_DISCIPLINA_TURMA' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_ATU_GRADE_DISCIPLINA_TURMA('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_PROPORCIONALIZA_VERBAS' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_PROPORCIONALIZA_VERBAS('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_APURA_CUSTO_SISPRO' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_APURA_CUSTO_SISPRO('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_VL_APROPRIACAO_DIRETA' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_VL_APROPRIACAO_DIRETA('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_RATEIO_APROPRIACAO' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_RATEIO_APROPRIACAO('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_GRAVA_VALORES_DRE' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_GRAVA_VALORES_DRE('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_TOTALIZA_NIVEIS_DRE' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_TOTALIZA_NIVEIS_DRE('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_GERA_LINHAS_CALCULADAS_DRE' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_GERA_LINHAS_CALCULADAS_DRE('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_LANC_DIFERENCAS_DRE' THEN
              dbms_job.submit ( DRE_NR_JOB,
                                    'BEGIN S_DRE_ANALISE_GERENCIAL.P_LANC_DIFERENCAS_DRE('||p_nr_ano||','||p_nr_mes||','
                                        ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                    sysdate,
                                    null,
                                    TRUE,
                                    0,
                                    FALSE );
            WHEN ST_PLANO.NM_PROCEDURE = 'P_RESULTADO_DISCIPLINA_TURMA' THEN
          		dbms_job.submit ( DRE_NR_JOB,
                                'BEGIN S_DRE_ANALISE_GERENCIAL.P_RESULTADO_DISCIPLINA_TURMA('||p_nr_ano||','||p_nr_mes||','
                                    ||p_cd_estabelecimento||','||p_nr_registro||'); END;',
                                sysdate,
                                null,
                                TRUE,
                                0,

                                FALSE );
            END CASE;


            P_FL_ERRO := 'N';
            P_DS_MENSAGEM_RETORNO := 'Processo agendado com sucesso.';
          END IF;


        END IF;
        CLOSE CR_PLANO;


      ELSE
        P_FL_ERRO := 'S';
        P_DS_MENSAGEM_RETORNO := 'Processo já foi executado.';
      END IF;


      CLOSE CR_CONTROLE_EXECUCAO;


    ELSE
      P_FL_ERRO := 'S';
      P_DS_MENSAGEM_RETORNO := 'O período está fechado.';
    END IF;
  END IF;
  CLOSE CR_PERIODO;


  END IF;

END;

END P_DRE_ANALISE_GERENCIAL;
/
