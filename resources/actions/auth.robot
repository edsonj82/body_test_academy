***Settings***
Documentation           Ações de Autorização


***Keywords***
Login With
    [Arguments]     ${email}        ${pass}

    Fill Text       css=input[name=email]       ${email}
    Fill Text       css=input[name=password]    ${pass}
    Click           text=Entrar