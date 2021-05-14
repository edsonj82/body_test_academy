***Settings***

Documentation       Ações de componentes genéricos

***Keywords***

##Validations

Toaster Text Should Be
    [Arguments]                     ${expect_text}
    Wait For Elements State         css=.Toastify__toast-body >> text=${expect_text}        visible     5

Alert Text Should Be
    [Arguments]                     ${expect_text}
    Wait For Elements State         css=form span >> text=${expect_text}                    visible     5
Field Should Be Type
    [Arguments]                     ${element}          ${type}
        ${attr}                     Get Attribute       ${element}     type
    Should Be Equal                 ${attr}             ${type}

Total Items Should Be
    [Arguments]                     ${number}
    ${element}                      Set Variable        css=#pagination .total  

    Wait For Elements State         ${element}          visible             5
    Get Text                        ${element}          ==          Total: ${number}

Register Should Not Be Found
    Wait For Elements State         css=div >> text=Nenhum registro Encontrado.    visible     5
    Wait For Elements State         css=table                               detached    5

Student Name Should Be Visible
    [Arguments]                     ${name}
    Wait For Elements State         css=table tbody tr >> text=${name}      visible     5

Plan Title Should Be Visible
    [Arguments]                     ${title}
    Wait For Elements State         css=table tbody tr >> text=${title}      visible     5

## Return Elements
Get Required Alerts 
    [Arguments]                     ${index}
    ${span}                         Get Text        xpath=(//form//span)[${index}]
    [return]                        ${span}