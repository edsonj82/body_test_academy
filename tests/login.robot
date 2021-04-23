***Settings***

Documentation           Suite de testes de Login do Administrador
Resource    ../resources/base.robot

***Test Cases***
Login do Administrador
    auth.Go To Login Pages
    # New Browser     chromium    False
    # New Page        https://theotokus-bodytest-web.herokuapp.com/

    auth.Login With  admin@bodytest.com  pwd123
    # Fill Text       css=input[name=email]       admin@bodytest.com
    # Fill Text       css=input[name=password]    pwd123
    # Click           text=Entrar

    Get Text        css=aside strong            should be       Administrador
    Take Screenshot

Senha incorreta
    auth.Go To Login Pages
    # New Browser     chromium    False
    # New Page        https://theotokus-bodytest-web.herokuapp.com/
    auth.Login With  admin@bodytest.com  abc123
    # Fill Text       css=input[name=email]       admin@bodytest.com
    # Fill Text       css=input[name=password]    abc123
    # Click           text=Entrar
    # Wait For Elements State         css=.Toastify__toast-body       visible         5     
    # Get text                        css=.Toastify__toast-body       should be       Usuário ou senha inválido

    Wait For Elements State         css=.Toastify__toast-body >> text=Usuário ou senha inválido         visible         5

Email incorreto
    auth.Go To Login Pages
    # New Browser     chromium    False
    # New Page        https://theotokus-bodytest-web.herokuapp.com/
    auth.Login With  admin&bodytest.com  abc123    
    # Fill Text       css=input[name=email]       admin&bodytest.com
    # Fill Text       css=input[name=password]    abc123
    # Click           text=Entrar

    Wait For Elements State         css=form span >> text=Informe um e-mail válido         visible         5

Senha não informada
    auth.Go To Login Pages
    # New Browser     chromium    False
    # New Page        https://theotokus-bodytest-web.herokuapp.com/
    auth.Login With  admin@bodytest.com  ${EMPTY}
    # Fill Text       css=input[name=email]       admin@bodytest.com
    # Fill Text       css=input[name=password]    ${EMPTY}
    # Click           text=Entrar
    Wait For Elements State         css=form span >> text=A senha é obrigatória          visible         5

Email não informado
    auth.Go To Login Pages
    # New Browser     chromium    False
    # New Page        https://theotokus-bodytest-web.herokuapp.com/
    auth.Login With  ${EMPTY}  pwd123
    # Fill Text       css=input[name=email]       ${EMPTY}
    # Fill Text       css=input[name=password]    pwd123
    # Click           text=Entrar
    Wait For Elements State         css=form span >> text=O e-mail é obrigatório          visible         5

Email e Senha não informados
    [tags]          temp
    auth.Go To Login Pages
    # New Browser     chromium    False
    # New Page        https://theotokus-bodytest-web.herokuapp.com/
    auth.Login With  ${EMPTY}  ${EMPTY}
    # Fill Text       css=input[name=email]       ${EMPTY}
    # Fill Text       css=input[name=password]    ${EMPTY}
    # Click           text=Entrar
    Wait For Elements State         css=form span >> text=O e-mail é obrigatório          visible         5
    Wait For Elements State         css=form span >> text=A senha é obrigatória          visible         5

