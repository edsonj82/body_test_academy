***Settings***
Documentation       Remoção de alunos

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Admin Session
# Suite Setup         Start Admin Session (com Reload)
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Desistir da exclusão

    &{student}      Create Dictionary   name=Edson José dos Santos  email=edson@theotokus.com   age=39  weight=81   feet_tall=1.82
    
    Insert Student                  ${student}
    Go To Students
    # Reload
    Search Student By Name          ${student.name}
    Request Removal By Email        ${student.email}
    Cancel Removal
    Student Should Be Visible       ${student.email}

Cenario: Remover aluno cadastrado

    &{student}      Create Dictionary   name=Edson José dos Santos  email=edson@theotokus.com   age=39  weight=81   feet_tall=1.82
    
    Insert Student                  ${student}
    Go To Students
    Search Student By Name          ${student.name}
    Request Removal By Email        ${student.email}
    Confirm Removal
    Toaster Text Should Be          Aluno removido com sucesso.
    Student Should Not Visible      ${student.email}

    [Teardown]                      Thinking And Take Screenshot  2