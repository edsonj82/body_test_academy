***Settings***

Documentation       Ações de features de gestão de alunos

***Variables***
${NAME_FIELD}                   css=input[name=name]
${EMAIL_FIELD}                  css=input[name=email] 
${AGE_FIELD}                    css=input[name=age]
${WEIGTH_FIELD}                 css=input[name=weight]
${FEET_TALL_FIELD}              css=input[name=feet_tall]

**Keywords***

## Forms

Submit Student Form
    Click                       css=button[form$=Student]

New Student
    [Arguments]     ${student}
    Fill Text                   ${NAME_FIELD}            ${student.name}
    Fill Text                   ${EMAIL_FIELD}           ${student.email}
    Fill Text                   ${AGE_FIELD}             ${student.age}
    Fill Text                   ${WEIGTH_FIELD}          ${student.weight}
    Fill Text                   ${FEET_TALL_FIELD}       ${student.feet_tall}
    Submit Student Form

Update a Student
    [Arguments]                 ${student}
    Fill Text                   ${NAME_FIELD}            ${student['name']}
    Fill Text                   ${EMAIL_FIELD}           ${student['email']}
    Fill Text                   ${AGE_FIELD}             ${student['age']}
    Fill Text                   ${WEIGTH_FIELD}          ${student['weight']}
    Fill Text                   ${FEET_TALL_FIELD}       ${student['feet_tall']}
    Submit Student Form

Search Student By Name
    [Arguments]                 ${name}
    Fill Text                   css=input[placeholder="Buscar aluno"]       ${name}

##Links & Buttons

Go to Form Student
    Click                       css=a[href$="alunos/new"]
    Wait For elements State     css=h1 >> text=Novo aluno     visible         5

Go To Student Update Form
    [Arguments]                 ${email}
    Click                       xpath=//td[contains(text(),'${email}')]/..//a[@class='edit']
    Wait For elements State     css=h1 >> text=Edição de aluno     visible         5

Request Removal By Email
    [Arguments]                 ${email}
    Click                       xpath=//td[contains(text(),"${email}")]/../td/button[@id="trash"]

Confirm Removal
    Click                       text=SIM, pode apagar!

Cancel Removal
    Click                       text=NÃO

##Validation

Check Type Field On Student Form
    [Arguments]                     ${element}      ${type}
    Go to Students
    Go to Form Student
    Field Should Be Type            ${element}      ${type}

Student Should Be Visible
    [Arguments]                 ${email}
    Wait For Elements State     xpath=//td[contains(text(),"${email}")]   visible    5

Student Should Not Visible
    [Arguments]                 ${email}
    Wait For Elements State     xpath=//td[contains(text(),"${email}")]   detached    5