***Settings***
Documentation       Cadastro de alunos

Resource            ../resources/base.robot

Suite Setup         Start Admin Session

***Test Cases***
Novo aluno

    &{student}      Create Dictionary   name=Edson José dos Santos  email=edson@theotokus.com   age=39  weight=81   feet_tall=1.82  
    
    Remove Student              ${student.email}
    Go to Students
    Go to Form Student
    #ações do cenário
    New Student                 ${student}
    #validação
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot  2

Não deve permitir email duplicado
    [tags]  duplicado
    &{student}      Create Dictionary   name=Ricardo de Mauro  email=ricardo@theotokus.com   age=34  weight=98   feet_tall=1.75  
    Insert Student              $(student)

    Go to Students
    Go to Form Student
    New Student                 ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]                  Thinking And Take Screenshot  2