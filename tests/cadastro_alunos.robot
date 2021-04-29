***Settings***
Documentation       Cadastro de alunos

Resource    ../resources/base.robot

Suite Setup     Start Admin Session

***Test Cases***
Novo aluno
    Remove Student          edson@theotokus.com
    Go to Students
    Go to Form Student
    #ações do cenário
    New Student  Edson José dos Santos  edson@theotokus.com  39  81  1.82
    #validação
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot  2