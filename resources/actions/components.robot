***Settings***

Documentation       Ações de componentes genéricos

***Keywords***
Toaster Text Should Be
    [Arguments]     ${expect_text}
    Wait For Elements State         css=.Toastify__toast-body >> text=${expect_text}        visible     5

Alert Text Should Be
    [Arguments]     ${expect_text}
    Wait For Elements State         css=form span >> text=${expect_text}                    visible     5

Get Required Alerts 
    [Arguments]     ${index}
    ${span}         Get Text        xpath=(//form//span)[${index}])
    [Return]    ${span}

Field Should Be Number
    [Arguments]     ${element}
        ${attr}     Get Attribute       ${element}     type
    Should Be Equal     ${attr}     number