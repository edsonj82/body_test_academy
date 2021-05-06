***Settings***
Documentation       Buscar alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Busca exata

     &{student}      Create Dictionary   name=Steve Jobs  email=jobs@yahoo.com   age=51  weight=78   feet_tall=1.52 

    Remove Student By Name      ${student.name}
    Insert Student              ${student}
    Go To Students     
    Search Student By Name      ${student.name}
    Student Should Be Visible   ${student.name}
    Total Items Should Be       1
    

Cenario: Registro Não Encontrado
    ${name}                  Set Variable       Barão Zemo  
    Remove Student By Name          ${name}
    Go to Students
    Search Student By Name          ${name}
    Register Should Not Be Found
