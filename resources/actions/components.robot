***Settings***

Documentation       Ações de componentes genéricos

***Keywords***
Toaster Text Should Be
    [Arguments]     ${expect_text}
    Wait For Elements State         css=.Toastify__toast-body >> text=${expect_text}        visible     5
