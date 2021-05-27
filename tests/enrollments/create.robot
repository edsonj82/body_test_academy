***Settings***
Documentation       Gestão de Matriculas

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Deve exibir data inicial e final conforme o plano escolhido
    Go To Enrolls
    Go To Form Enroll
    Select Student      John Connor
    Select Plan         Plano Lisiex

    # ${code}         Get Page Source
    # Log             ${code}         