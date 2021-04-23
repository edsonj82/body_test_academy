***Settings***

Documentation       Ações do menu superior de navegador

***Keywords***
User Should Be Logged In
    [Arguments]     ${user_name}
    Get Text        css=aside strong            should be       ${user_name}