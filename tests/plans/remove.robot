***Settings***
Documentation       Remoção de planos

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Admin Session
# Suite Setup         Start Admin Session (com Reload)
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Desistir da exclusão

    &{plan}      Create Dictionary   title=Plano Loyola  duration=12   price=19.99
    Insert Plan                     ${plan}
    Go To Plans

    Search Plan By Title            ${plan.title}
    Request Removal By Title        ${plan.title}
    Cancel Removal
    Plan Should Be Visible          ${plan.title}

Cenario: Remover plano cadastrado

    &{plan}      Create Dictionary   title=Plano Loyola  duration=12   price=19.99
    Insert Plan                     ${plan}
    Go To Plans
    Search Plan By Title            ${plan.title}
    Request Removal By Title        ${plan.title}
    Confirm Removal
    Toaster Text Should Be          Plano removido com sucesso
    Plan Should Not Visible         ${plan.title}

    [Teardown]                      Thinking And Take Screenshot  2