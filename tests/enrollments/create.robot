***Settings***
Documentation       Gestão de Matriculas

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Deve exibir data inicial e final conforme o plano escolhido
    ${fixture}                  Get JSON            enroll-dates.json 
    
    ${student_enroll}           Set Variable        ${fixture['student']}
    ${plan_enroll}              Set Variable        ${fixture['plan']}

    Insert Student              ${student_enroll}
    Insert Plan                 ${plan_enroll}      

    Go To Enrolls
    Go To Form Enroll
    Select Student              ${student_enroll['name']}
    Select Plan                 ${plan_enroll['title']}
    Start Date Should Today
    End Date Should Be          ${fixture['days']}

Cenario: Deve matricular um aluno em um plano
    ${fixture}                  Get JSON            enroll-create.json 
    
    ${student_enroll}           Set Variable        ${fixture['student']}
    ${plan_enroll}              Set Variable        ${fixture['plan']}

    Insert Student              ${student_enroll}
    Insert Plan                 ${plan_enroll}      

    Go To Enrolls
    Go To Form Enroll
    Select Student              ${student_enroll['name']}
    Select Plan                 ${plan_enroll['title']}
    Submit Enrolls Form         
    Toaster Text Should Be      Matrícula cadastrada com sucesso

    [Teardown]          Thinking And Take Screenshot  5