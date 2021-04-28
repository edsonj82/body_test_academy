***Settings***

Documentation       Ações de features de gestão de alunos

**Keywords***
Go to Students
    Click                       css=a[href$=alunos]
    Wait For elements State     css=h1 >> text=Gestão de Alunos     visible         5

Go to Form Student
    Click                       css=a[href$="alunos/new"]
    Wait For elements State     css=h1 >> text=Novo aluno     visible         5

New Student
    [Arguments]     ${name}     ${email}        ${age}      ${weight}       ${feet_tall}
    Fill Text                   css=input[name=name]            ${name}
    Fill Text                   css=input[name=email]           ${email}
    Fill Text                   css=input[name=age]             ${age}
    Fill Text                   css=input[name=weight]          ${weight}
    Fill Text                   css=input[name=feet_tall]       ${feet_tall}
    Click                       css=button[form$=Student]