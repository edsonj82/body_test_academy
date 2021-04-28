***Settings***
Documentation       Cadastro de alunos

Resource    ../resources/base.robot

Suite Setup     Start Browser Session


***Test Cases***
Novo aluno
    #pré condição
    Go To Login Pages
    Login With                  admin@bodytest.com  pwd123
    User Should Be Logged In    Administrador  

    Click                       css=a[href$=alunos]
    Wait For elements State     css=h1 >> text=Gestão de Alunos     visible         5
    
    Click                       css=a[href$="alunos/new"]
    Wait For elements State     css=h1 >> text=Novo aluno     visible         5

    #ações do cenário
    Fill Text                   css=input[name=name]            Edson José dos Satos
    Fill Text                   css=input[name=email]           edson@theotokus.com
    Fill Text                   css=input[name=age]             39
    Fill Text                   css=input[name=weight]          81
    Fill Text                   css=input[name=feet_tall]       1.82
    Click                       css=button[form$=Student]

    #validação
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot  2