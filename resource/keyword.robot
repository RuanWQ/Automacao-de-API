*** Settings ***
Resource    main.robot

*** Keywords ***
Pegar todos os produtos
    Create Session    api    ${API}
    ${resp}=    GET On Session    api    /products
   
Pegar um produto
    Create Session    api    ${API}
    ${resp}=    GET On Session    api    /products/${PRODUTO_ID}

Criar um produto
    Create Session    api    ${API}
    &{body}=    Create Dictionary
    ...    id=100
    ...    title=Produto bom
    ...    price=100
    ...    description=Produto bom pracalvice
    ...    category=Industrial

    ${resp}=    POST On Session    api    /products    json=${body}

Deletar um produto
    Create Session    api    ${API}
    ${resp}=    DELETE On Session    api    /products/${PRODUTO_ID}

Atualizar um produto
    Create Session    api    ${API}

    &{body}=    Create Dictionary
    ...    id=10
    ...    title=Produto bom
    ...    price=100
    ...    description=Produto bom pracalvice
    ...    category=Industrial

    ${resp}=    PUT On Session    api    /products/${PRODUTO_ID}    json=${body}