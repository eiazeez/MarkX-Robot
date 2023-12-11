*** Settings ***
Documentation     Suite de testes do cadastro de tarefas

Resource          ${EXECDIR}/resources/base.resource

Test Setup        Start session
Test Teardown     Finish session 

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    
    ${TASK}    Set Variable        Estudar XPath
    Remove task from database      ${TASK}    

    Do login

    Create a new task   ${TASK}
    Should have task    ${TASK}

Deve poder remover uma tarefa indesejada
    [Tags]    remove

    ${TASK}    Set Variable        Comprar refrigerante
    Remove task from database      ${TASK}    

    Do login

    Create a new task    ${TASK}
    Should have task     ${TASK}

    Delete task by name  ${TASK}
    Wait Until Page Does Not Contain    ${TASK}

Deve poder concluir uma tarefa
    [Tags]    done

    ${TASK}    Set Variable        Estudar Appium
    Remove task from database      ${TASK}    

    Do login

    Create a new task    ${TASK}
    Should have task     ${TASK}

    Finish task by name  ${TASK}

    Task should be done  ${TASK}
