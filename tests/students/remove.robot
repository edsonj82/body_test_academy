***Settings***
Documentation       Remoção de alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Remover aluno cadastrado
    &{student}      Create Dictionary   name=Cintia Rodrigues  email=cintia@xpto.com   age=30  weight=60   feet_tall=1.71
    
    Insert Student                 ${student}
    Go To Students
    Request Removal By Email       ${student.email}
    Confirm Removal
    Toaster Text Should Be         Aluno removido com sucesso.
    Student Should Not Visible      ${student.email}

    [Teardown]                  Thinking And Take Screenshot  2
