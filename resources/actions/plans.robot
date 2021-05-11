***Settings***

Documentation       Ações de features de gestão de alunos

***Variables***
${TITLE_FIELD}      id=title
${DURATION_FIELD}   id=duration
${PRICE_FIELD}      css=input[name=price]
${TOTAL_FIELD}      css=input[name=total]

**Keywords***
## Forms
Submit Plan Form
    Click                       xpath=//button[contains(text(), "Salvar")]

Fill Plan Forms
    [Arguments]                 ${plan}
    Fill Text                   ${TITLE_FIELD}            ${plan.title}
    Fill Text                   ${DURATION_FIELD}           ${plan.duration}
    Fill Text                   ${PRICE_FIELD}             ${plan.price}


##Links & Buttons
Go To Form Plan
    Click                       css=a[href$="planos/new"]
    Wait For elements State     css=h1 >> text=Novo plano     visible         5

## Validations
Total Plan Should Be
    [Arguments]     ${total}
    Get Attribute       ${TOTAL_FIELD}      value       ==      ${total}