***Settings***
Documentation           Tudo começa aqui, meu arquivo base do projeto de automação

Library     Browser
Library     Collections
Library     OperatingSystem
Library     DateTime
Library     libs/DeloreanLibrary.py

Resource    actions/auth.robot
Resource    actions/plans.robot
Resource    actions/enrolls.robot
Resource    actions/nav.robot
Resource    actions/students.robot
Resource    actions/components.robot

**Keywords***
Start Browser Session
    New Browser     chromium    false
    New Page        about:blank

Start Admin Session
    Start Browser Session
    Go To Login Pages
    Login With                  admin@bodytest.com  pwd123
    User Should Be Logged In    Administrador  

Clean Local Storage And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]     ${timeout}
    Sleep           ${timeout}
    Take Screenshot  

###Helpers
Get JSON
    [Arguments]         ${file_name}
  
    ${file}=            Get File        ${EXECDIR}/resources/fixtures/${file_name}
    ${json_object}      Evaluate        json.loads($file)     json

    [Return]        ${json_object}

