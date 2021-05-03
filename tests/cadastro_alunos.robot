***Settings***
Documentation       Cadastro de alunos

Resource            ../resources/base.robot

Suite Setup         Start Admin Session

Library             Collections

***Test Cases***
Novo aluno

    &{student}      Create Dictionary   name=Edson José dos Santos  email=edson@theotokus.com   age=39  weight=81   feet_tall=1.82  
    
    Remove Student              ${student.email}
    Go to Students
    Go to Form Student
    #ações do cenário
    New Student                 ${student}
    #validação
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot  2

Não deve permitir email duplicado
    [tags]  duplicado
    &{student}      Create Dictionary   name=Ricardo de Mauro  email=ricardo@theotokus.com   age=34  weight=98   feet_tall=1.75  
        
    Insert Student              ${student}

    Go to Students
    Go to Form Student
    New Student                 ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]                  Thinking And Take Screenshot  2

Todos os campos devem ser obrigatórios
    [Tags]  fail
    # &{student}      Create Dictionary   name=${EMPTY}  email=${EMPTY}   age=${EMPTY}  weight=${EMPTY}   feet_tall=${EMPTY}  
    @{expected_alerts}          Set variable    Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório        a Altura é obrigatória     
    @{got_alerts}               Create List

    Go to Students
    Go to Form Student
    Submit Student Form

       # FOR     ${alert}    IN      @{expected_alerts}
    #     Alert Text Should Be    ${alert}
    # END
    # Alert Text Should Be        Nome é obrigatório
    # Alert Text Should Be        O e-mail é obrigatório
    # Alert Text Should Be        idade é obrigatória
    # Alert Text Should Be        o peso é obrigatório
    # Alert Text Should Be        a Altura é obrigatória

    FOR     ${index}        IN RANGE   1   6
        ${span}             Get Required Alerts     ${index} 
        Append To List      ${got_alerts}           ${span}
    END

    Log     ${expected_alerts}
    Log     ${got_alerts}

    List Should Be Equal        ${expected_alerts}      ${got_alerts}

Validate Number Type
    [Tags]              temp
    [Template]          Check Numeric Field On Student Form     
    css=input[name=age]
    css=input[name=weight]
    css=input[name=feet_tall]

# Check Age Numeric Field
#     [Tags]  temp
#     Go to Students
    
# Check Weight Numeric Field
#     [Tags]  temp
#     Go to Students
#     Go to Form Student
#     Field Should Be Number          css=input[name=weight]

# Check Feet Tall Numeric Field
#     [Tags]  temp
#     Go to Students
#     Go to Form Student
#     Field Should Be Number          css=input[name=feet_tall]

# Check Weight Numeric Field
#     [Tags]  temp
#     Go to Students
#     Go to Form Student
#     Field Should Be Number          css=input[name=weight]

# Check Feet Tall Numeric Field
#     [Tags]  temp
#     Go to Students
#     Go to Form Student
#     Field Should Be Number          css=input[name=feet_tall]

**Keywords***
Check Numeric Field On Student Form
    [Arguments]         ${element}
    Go to Students
    Go to Form Student
    Field Should Be Number      ${element}