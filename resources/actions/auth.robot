***Settings***
Documentation           Ações de Autorização

***Keywords***
Go To Login Pages
    Go To             https://theotokus-bodytest-web.herokuapp.com/
    # New Browser     chromium    true
    # New Page        https://theotokus-bodytest-web.herokuapp.com/

Login With
    [Arguments]     ${email}        ${pass}
    Fill Text       css=input[name=email]       ${email}
    Fill Text       css=input[name=password]    ${pass}
    Click           text=Entrar

Toaster Text Should Be
    [Arguments]     ${expect_text}
    Wait For Elements State         css=.Toastify__toast-body >> text=${expect_text}        visible     5

Alert Text Should Be
    [Arguments]     ${expect_text}
    Wait For Elements State         css=form span >> text=${expect_text}                    visible     5