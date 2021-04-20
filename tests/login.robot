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