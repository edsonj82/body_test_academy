***Settings***
Documentation       Cadastro de alunos

Resource            ../../resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot



***Test Cases***
Cenario: Novo aluno

    &{student}      Create Dictionary   name=Edson José dos Santos  email=edson@theotokus.com   age=39  weight=81   feet_tall=1.82  
    
    Remove Student              ${student.email}
    Go to Students
    Go to Form Student
    #ações do cenário
    New Student                 ${student}
    #validação
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot  2

Cenario: Não deve permitir email duplicado
    [tags]  duplicado
    &{student}      Create Dictionary   name=Ricardo de Mauro  email=ricardo@theotokus.com   age=34  weight=98   feet_tall=1.75  
        
    Insert Student              ${student}

    Go to Students
    Go to Form Student
    New Student                 ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]                  Thinking And Take Screenshot  2

Cenario: Todos os campos devem ser obrigatórios
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
        ${span}                     Get Required Alerts     ${index} 
        Append To List              ${got_alerts}           ${span}
    END

    Log     ${expected_alerts}
    Log     ${got_alerts}

    List Should Be Equal            ${expected_alerts}      ${got_alerts}

Cenario: Validação dos Campos Numéricos
    [Tags]  temp
    [Template]                      Check Type Field On Student Form     
    ${AGE_FIELD}                    number
    ${WEIGTH_FIELD}                 number
    ${FEET_TALL_FIELD}              number

Cenario: Validação dos Campos do Tipo E-mail
    [Tags]  temp
    [Template]                      Check Type Field On Student Form    
    ${EMAIL_FIELD}                  email
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
Cenario: Menor de 14 anos não pode fazer cadastro
    &{student}      Create Dictionary   name=Livia da Silva  email=livia@theotokus.com   age=13  weight=50   feet_tall=1.65  
    
    Go to Students
    Go to Form Student
    New Student                 ${student}
    Alert Text Should Be        A idade deve ser maior ou igual 14 anos

    # [Teardown]                  Thinking And Take Screenshot  2


**Keywords***
Check Type Field On Student Form
    [Arguments]                     ${element}      ${type}
    Go to Students
    Go to Form Student
    Field Should Be Type            ${element}      ${type}