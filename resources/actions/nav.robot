***Settings***

Documentation       Ações do menu superior de navegação

***Keywords***
Go to Students
    Click                       css=a[href$=alunos]
    Wait For elements State     css=h1 >> text=Gestão de Alunos     visible         5

Go To Plans
    Click                       css=a[href$=planos]
    Wait For elements State     css=h1 >> text=Gestão de Planos     visible         5

User Should Be Logged In
    [Arguments]                 ${user_name}
    Get Text                    css=aside strong            should be       ${user_name}