***Settings***
Documentation           Suite de testes de Login do Administrador

Resource    ../resources/base.robot

Suite Setup     Start Browser Session
Test Teardown   Take Screenshot            

***Test Cases***
Login do Administrador
    Go To Login Pages
    Login With                  admin@bodytest.com  pwd123
    User Should Be Logged In    Administrador   
    
    [Teardown]                  Clean Local Storage And Take Screenshot

Senha incorreta
    Go To Login Pages
    Login With                  admin@bodytest.com  abc123
    Toaster Text Should Be      Usuário e/ou senha inválidos.

    [Teardown]                  Thinking And Take Screenshot  2

Email não cadastrado
    Go To Login Pages
    Login With                  edson@gmail.com  abc123
    Toaster Text Should Be      Usuário e/ou senha inválidos.

    [Teardown]                  Thinking And Take Screenshot  2

Email incorreto
    Go To Login Pages
    Login With                  admin&bodytest.com  abc123    
    Alert Text Should Be        Informe um e-mail válido

Senha não informada
    Go To Login Pages
    Login With                  admin@bodytest.com  ${EMPTY}
    Alert Text Should Be        A senha é obrigatória

Email não informado
    Go To Login Pages
    Login With                  ${EMPTY}  pwd123
    Alert Text Should Be        O e-mail é obrigatório

Email e Senha não informados
56    Go To Login Pages
    Login With                  ${EMPTY}  ${EMPTY}
    Alert Text Should Be        O e-mail é obrigatório
    Alert Text Should Be        A senha é obrigatória
