***Settings***
Documentation           Ações de Autorização

***Keywords***
Go To Login Pages
    Go To               https://theotokus-bodytest-web.herokuapp.com/
    # New Browser       chromium    true
    # New Page          https://theotokus-bodytest-web.herokuapp.com/

Login With
    [Arguments]         ${email}        ${pass}
    Fill Text           css=input[name=email]       ${email}
    Fill Text           css=input[name=password]    ${pass}
    Click               text=Entrar
