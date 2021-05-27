***Settings***
Documentation       Gestão de MAtriculas

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Deve exibir data inicial e final conforme o plano escolhido
    Go To Enrolls
    Go To Form Enroll

    Fill Text       css=input[aria-label="student_id"]      John Connor
    sleep           5
    ${code}         Get Page Source
    Log             ${code}         