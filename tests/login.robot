***Settings***

Documentation           Suite de testes de Login do Administrador
Library     Browser

***Test Cases***
Login do Administrador
    New Browser     chromium    False
    New Page        https://theotokus-bodytest-web.herokuapp.com/

    Fill Text       css=input[name=email]       admin@bodytest.com
    Fill Text       css=input[name=password]    pwd123
    Click           text=Entrar
    Get Text        css=aside strong            should be       Administrador
    Take Screenshot

Senha incorreta
    [tags]          temp
    New Browser     chromium    False
    New Page        https://theotokus-bodytest-web.herokuapp.com/
    Fill Text       css=input[name=email]       admin@bodytest.com
    Fill Text       css=input[name=password]    abc123
    Click           text=Entrar

    # Wait For Elements State         css=.Toastify__toast-body       visible         5     
    # Get text                        css=.Toastify__toast-body       should be       Usuário ou senha inválido

    Wait For Elements State         css=.Toastify__toast-body >> text=Usuário ou senha inválido         visible         5