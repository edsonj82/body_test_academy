***Settings***
Documentation       Cadastro de alunos

Resource    ../resources/base.robot

Suite Setup     Start Admin Session

***Test Cases***
Novo aluno

    &{student}      Create Dictionary   name=Edson José dos Santos  email=edson@theotokus.com   age=39  weight=81   feet_tall=1.82  
    
    Remove Student          ${student.email}
    Go to Students
    Go to Form Student
    #ações do cenário
    New Student  ${student}
    #validação
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot  2