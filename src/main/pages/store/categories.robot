*** Comments ***
Documentation
... Suite with categories variables


*** Settings ***
Resource                   ../../support/base.robot


*** Variables ***
#Categorias
${IdCategory}               accessibility_id=
${TitlePageCategory}        id=br.com.petz:id/text_title_custom_menu_start
${ImageProduct}             xpath=(//*[@resource-id="br.com.petz:id/image_product"])
${TextNameProduct}          xpath=(//*[@*="br.com.petz:id/text_title"])
${ProductPageName}          //*[@*="br.com.petz:id/tv_name"]
${CategoryName}             //*[@*="br.com.petz:id/category_title" and @text="{text}"]


*** Keywords ***


Click Home Category
    [Arguments]    ${id}
    Validate and Click       accessibility_id=${id}
    Validate Element Text    ${TitlePageCategory}  	  CATEGORIAS


I Click On Category
    [Arguments]    ${Text}
    Swipe Until Element is Visible    ${CategoryName.format(text='${Text}')}
    Validate and Click                ${CategoryName.format(text='${Text}')}     
    Validate Element Text             ${TitlePageCategory}    ${Text}


I Click On The First Product Displayed On The Page
    Validate Element           ${TextNameProduct}
    ${NameProduct}    Get Text     ${TextNameProduct}\[1]
    Set Test Variable          ${NameProduct}               
    Validate and Click Text    ${NameProduct}


I Should Be Redirected To The Product Detail Page
    Validate Text              DETALHES    
    Validate Element Text      ${ProductPageName}    ${NameProduct}


Validate Dog Category
    Validate Element    ${CategoryName.format(text='RAÇÃO')}       
    Validate Element    ${CategoryName.format(text='PETISCOS E OSSOS')}
    Validate Element    ${CategoryName.format(text='TAPETES, FRALDAS E BANHEIROS')}
    Validate Element    ${CategoryName.format(text='FARMÁCIA')}
    Validate Element    ${CategoryName.format(text='BRINQUEDOS')}
    Validate Element    ${CategoryName.format(text='COLEIRAS, GUIAS E PEITORAIS')}
    Swipe Until Element is Visible    ${CategoryName.format(text='ACESSÓRIOS DE TRANSPORTE')}
    Validate Element    ${CategoryName.format(text='BELEZA E LIMPEZA')}
    Validate Element    ${CategoryName.format(text='CAMAS E COBERTORES')}
    Validate Element    ${CategoryName.format(text='CASAS E TOCAS')}
    Validate Element    ${CategoryName.format(text='ACESSÓRIOS DE ALIMENTAÇÃO')}
    Validate Element    ${CategoryName.format(text='ACESSÓRIOS DE TRANSPORTE')}
    Swipe Until Element is Visible    ${CategoryName.format(text='RAÇAS')}
    Validate Element    ${CategoryName.format(text='PORTÕES, GRADES E ESCADAS')}
    Validate Element    ${CategoryName.format(text='ROUPAS')}
    Validate Element    ${CategoryName.format(text='ADESTRAMENTO E COMPORTAMENTO')}
    Validate Element    ${CategoryName.format(text='RAÇAS')}
    Swipe To the Top    ${CategoryName.format(text='RAÇÃO')}   


Validate Cat Category
    Validate Element    ${CategoryName.format(text='RAÇÃO')}
    Validate Element    ${CategoryName.format(text='PETISCOS')}
    Validate Element    ${CategoryName.format(text='AREIAS E BANHEIROS')} 
    Validate Element    ${CategoryName.format(text='FARMÁCIA')}
    Validate Element    ${CategoryName.format(text='ARRANHADORES E BRINQUEDOS')}
    Validate Element    ${CategoryName.format(text='BELEZA E LIMPEZA')}
    Swipe Until Element is Visible    ${CategoryName.format(text='RAÇAS')} 
    Validate Element    ${CategoryName.format(text='COLEIRAS E PEITORAIS')}
    Validate Element    ${CategoryName.format(text='ACESSÓRIOS DE ALIMENTAÇÃO')}        
    Validate Element    ${CategoryName.format(text='ACESSÓRIOS DE TRANSPORTE')}
    Validate Element    ${CategoryName.format(text='CAMAS, ALMOFADAS E TOCAS')}
    Validate Element    ${CategoryName.format(text='ROUPAS')}    
    Validate Element    ${CategoryName.format(text='RAÇAS')}
    Swipe To the Top    ${CategoryName.format(text='RAÇÃO')}


Validate Birds Category
    Validate Element    ${CategoryName.format(text='ALIMENTAÇÃO')}
    Validate Element    ${CategoryName.format(text='GAIOLAS E VIVEIROS')}
    Validate Element    ${CategoryName.format(text='BRINQUEDOS E POLEIROS')}  
    Validate Element    ${CategoryName.format(text='ACESSÓRIOS')}
    Validate Element    ${CategoryName.format(text='FARMÁCIA')}


Validate Fish Category
    Validate Element    ${CategoryName.format(text='ALIMENTAÇÃO')}
    Validate Element    ${CategoryName.format(text='EQUIPAMENTOS E ACESSÓRIOS')}
    Validate Element    ${CategoryName.format(text='AQUÁRIOS E BETEIRAS')}  
    Validate Element    ${CategoryName.format(text='TRATAMENTO DE ÁGUA')}
    Validate Element    ${CategoryName.format(text='DECORAÇÃO')}
    Validate Element    ${CategoryName.format(text='FARMÁCIA')}


Validate Other Pets Category
    Validate Element    ${CategoryName.format(text='COELHOS')}
    Validate Element    ${CategoryName.format(text='HAMSTER E TWISTER')}  
    Validate Element    ${CategoryName.format(text='PORQUINHO DA ÍNDIA')}
    Validate Element    ${CategoryName.format(text='CHINCHILAS')}
    Validate Element    ${CategoryName.format(text='GERBIL')}
    Swipe Until Element is Visible    ${CategoryName.format(text='LAGARTOS')}
    Validate Element    ${CategoryName.format(text='FURÃO')}
    Validate Element    ${CategoryName.format(text='TARTARUGAS')}
    Validate Element    ${CategoryName.format(text='LAGARTOS')}


Validate Home and Garden Category
    Validate Element    ${CategoryName.format(text='JARDIM')}
    Validate Element    ${CategoryName.format(text='PISCINA')}
    Validate Element    ${CategoryName.format(text='CONTROLE DE PRAGAS')}  
    Validate Element    ${CategoryName.format(text='CASA E AMBIENTE')}
    Validate Element    ${CategoryName.format(text='LIVROS E PRESENTES')}
    Validate Element    ${CategoryName.format(text='CONVENIÊNCIA')}