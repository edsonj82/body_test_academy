***Settings****
Documentation           Ações de Gestão de Matrículas

***Keywords***

##Links & Buttons
Select Student
    [Arguments]                 ${name}
    Fill Text       css=input[aria-label="student_id"]      ${name}
    Click           css=div[id*=option] >> text=${name}    

Select Plan
    [Arguments]                 ${title}
    Fill Text       css=input[aria-label="plan_id"]      ${title}
    Click           css=div[id*=option] >> text=${title}    

Go To Form Enroll
    Click                       css=a[href$="matriculas/new"]
    Wait For elements State     css=h1 >> text=Nova matrícula     visible         5

