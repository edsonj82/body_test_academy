***Settings***
Documentation       Cadastro de Planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Calcular Preço Total do Plano
    
    &{plan}         Create Dictionary       title=Edson Teste       duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Forms         ${plan}
    Total Plan Should Be    ${plan.total}