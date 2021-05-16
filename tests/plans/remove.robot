***Settings***
Documentation       Remoção de planos

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Admin Session
# Suite Setup         Start Admin Session (com Reload)
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Remover plano cadastrado

    &{plan}      Create Dictionary   title=Plano Gama  duration=6   price=10
    Insert Plan                     ${plan}
    Go To Plans
    Search Plan By Title            ${plan.title}
    Request Removal By Title        ${plan.title}
    Confirm Removal
    Toaster Text Should Be          Plano removido com sucesso
    Plan Should Not Visible         ${plan.title}

    [Teardown]                      Thinking And Take Screenshot  2

Cenario: Desistir da exclusão

    &{plan}      Create Dictionary   title=Plano Hepta  duration=3   price=15
    Insert Plan                     ${plan}
    Go To Plans

    Search Plan By Title            ${plan.title}
    Request Removal By Title        ${plan.title}
    Cancel Removal
    Plan Should Be Visible          ${plan.title}