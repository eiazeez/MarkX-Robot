*** Settings ***
Documentation        Elementos e ações da tela de minhas tarefas

Library    AppiumLibrary

*** Variables ***
${newTaskInput}    xpath=//*[contains(@text, "nova tarefa")]
${createButton}    xpath=//android.view.ViewGroup[@resource-id="createTask"]  

*** Keywords ***
Create a new task
    [Arguments]    ${task_name}
    
    Wait Until Element Is Visible    ${new_task_input}

    Input Text            ${new_task_input}    ${task_name}     
    Click Element         ${create_button}

Should have task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible
    ...    xpath=//*[@resource-id="taskText"][@text="${task_name}"]    5

Delete task by name
    [Arguments]    ${task_name}

    Click Element                       xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    ${yes_button}    Set Variable       xpath=//android.widget.Button[@text="SIM"]

    Wait Until Element Is Visible       ${yes_button} 
    Click Element                       ${yes_button}

Finish task by name
    [Arguments]    ${task_name}

    Click Element        xpath=//*[@text="${task_name}"]/..
Task should be done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView


