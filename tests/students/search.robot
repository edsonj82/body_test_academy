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

Cenario: Busca alunos por um único termo
    [Tags]  temp
    # David Bowie, David Guetta, David Beckham

    ${fixtures}         Get JSON        students-search.json
    ${students}         Set Variable        ${fixtures['students']}
    ${word}             Set Variable        ${fixtures['word']}
    ${total}             Set Variable        ${fixtures['total']}
    # Remove Student By Name      David

    FOR     ${item}     IN      @{students}
        Insert Student      ${item}
    END

    Go to Students
    Search Student By Name          ${word}

    FOR     ${item}     IN      @{students}
        Student Name Should Be Visible  ${item['name']}
    END
    Total Items Should Be  ${total}