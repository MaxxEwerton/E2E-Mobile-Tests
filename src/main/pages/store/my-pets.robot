*** Comments ***
Documentation
... Suite with my pets variables

*** Settings ***
Resource    ../../support/base.robot

*** Variables ***
#Tela Inicial
${MyPetsTitle}      //*[@*='MEUS PETS' or @*='br.com.petz:id/text_title_menu_start']
${MyPetsRegisterANewPet}      //*[@*='Cadastrar novo pet' or @*='br.com.petz:id/bt_contained_button']
${MyPetsFirstPet}      cachorrona
${MsgNoPetsRegistered}      //*[@*='Você não cadastrou nenhum pet' or @*='br.com.petz:id/tv_title_no_content']
${MsgRegisterANewPetWithNoPets}      //*[@*='Cadastre agora e receba dicas e sugestões de produtos feitos especialmente pra ele.' or @*='br.com.petz:id/tv_message_no_content']

#Lstagem
${MyPetsPetAvatar}      //*[@*='Filó' or @*='Filó']
${MyPetsLAyoutTitle}      //*[@*='' or @*='br.com.petz:id/title']
${MyPetsLAyoutName}      //*[@*='' or @*='br.com.petz:id/petName']
${MyPetsSpecies}      //*[@*='Pet' or @*='br.com.petz:id/item_species']
${MyPetsGender}      //*[@*='Sexo' or @*='br.com.petz:id/item_gender']
${MyPetsCastration}      //*[@*='Castrado' or @*='br.com.petz:id/item_castration']
${MyPetsDateBirth}      //*[@*='Data de nascimento' or @*='br.com.petz:id/item_birth']
${MyPetsWeight}      //*[@*='Peso' or @*='br.com.petz:id/item_weight']
${MyPetsChangeRegistration}      //*[@*='Alterar cadastro' or @*='br.com.petz:id/bt_change_registration']
${MyPetsDeletePet}      //*[@*='Excluir cadastro' or @*='br.com.petz:id/bt_delete_my_pet']

#Edicao
# solicitcar insercao de id nos campos onde pode digitar
${MyPetsEditionChangeRegisterTitle}      //*[@*='ALTERAR CADASTRO' or @*='br.com.petz:id/text_title_menu_start']
${MyPetsEditionChangePicture}      //*[@*='Alterar foto' or @*='']
${MyPetsEditionName}      //*[@*='Nome' or @*='br.com.petz:id/ipt_name']
${MyPetsEditionSex}      //*[@*='Sexo' or @*='br.com.petz:id/idd_gender']
${MyPetsEditionSpecies}      //*[@*='Pet' or @*='br.com.petz:id/idd_species']
${MyPetsEditionBreed}      //*[@*='Raça' or @*='br.com.petz:id/idd_breed']
${MyPetsEditionWeight}      //*[@*='Peso (kg)' or @*='br.com.petz:id/ipt_weight']
${MyPetsEditionDateBirth}      //*[@*='Data de nascimento' or @*='br.com.petz:id/ipt_birthday']
${MyPetsEditionLessThanAYear}      //*[@*='Não sei, mas tem menos de um ano' or @*='br.com.petz:id/rb_puppy']
${MyPetsEditionMoreThanAYear}      //*[@*='Não sei, mas tem mais de um ano' or @*='br.com.petz:id/rb_adult']
${MyPetsEditionSwitchCastration}      //*[@*='' or @*='br.com.petz:id/swt_pet_castration']
${MyPetsEditionSavePetEdition}      //*[@*='Salvar' or @*='br.com.petz:id/bt_save_edit_pet']
${DogSpecie}            //*[@*='Cachorro' or @*='Cachorro']

${ContinueButton}      //*[@*='br.com.petz:id/bt_contained_button' or @*='br.com.petz:id/bt_contained_button']
${NewPetName}      //*[@*='br.com.petz:id/edt_pet_name' or @*='br.com.petz:id/edt_pet_name']
${GenderMale}           //*[@*='br.com.petz:id/rb_male' or @*='br.com.petz:id/rb_male'] 	
${CastradoTrue}         //*[@*='br.com.petz:id/container_yes_castration' or @*='br.com.petz:id/container_yes_castration'] 
${ChooseBreedButton}          //*[@*='br.com.petz:id/tv_choose_the_breed_in_fragment' or @*='br.com.petz:id/tv_choose_the_breed_in_fragment']
${Breed}                //*[@*='SRD GRDE PELO CURTO' or @*='SRD GRDE PELO CURTO']
${AdultAge}             	//*[@*='br.com.petz:id/rb_adult' or @*='br.com.petz:id/rb_adult']
${Weight}              //*[@*='br.com.petz:id/edt_weight' or @*='br.com.petz:id/edt_weight']
${JumpButton}           	//*[@*='br.com.petz:id/bt_text_button_left_content' or @*='br.com.petz:id/bt_text_button_left_content']
${SaveButton}               //*[@*='Salvar' or @*='Salvar']
${RegisterSuccessNotify}               //*[@*='Cadastro realizado' or @*='Cadastro realizado']
${CloseRegisterSuccessNotify}               //*[@*='Fechar' or @*='Fechar']

# Variaveis de cadastro de pets
${RegisterNewPetOnServices}             //*[@*='Cadastrar pet' or @*='Cadastrar novo pet']
${RegisterANewPetDog}              //*[@*='nameTitleLabel' or @*='Cachorro']
${RegisterANewPetCat}              //*[@*='nameTitleLabel' or @*='Gato']
${RegisterANewPetFish}              //*[@*='nameTitleLabel' or @*='Peixe']
${RegisterANewPetBird}              //*[@*='nameTitleLabel' or @*='Ave']
${RegisterANewPetRodent}              //*[@*='nameTitleLabel' or @*='Roedor']
${RegisterANewPetRabbit}              //*[@*='nameTitleLabel' or @*='Coelho']
${RegisterANewPetReptile}              //*[@*='nameTitleLabel' or @*='Réptil']
${RegisterANewPetHeader}              //*[@*='nameTitleLabel' or @*='CADASTRAR NOVO PET']
${RegisterANewPetTypeOfPetTitle}              //*[@*='nameTitleLabel' or @*='Conta pra gente, qual seu pet?']
${RegisterANewPeTNameOfPetTitle}              //*[@*='nameTitleLabel' or @*='Legal! Qual é o nome?']
${RegisterANewPetNameTextField}              //*[@*='nameTitleLabel' or @*='Digite o nome']
${RegisterANewPetMalePet}              //*[@*='nameTitleLabel' or @*='Macho']
${RegisterANewPetFemalePet}              //*[@*='nameTitleLabel' or @*='Fêmea']
${RegisterANewPetYesCastration}              //*[@*='nameTitleLabel' or @*='br.com.petz:id/container_yes_castration']
${RegisterANewPetNoCastration}              //*[@*='nameTitleLabel' or @*='br.com.petz:id/container_no_castration']
${RegisterANewPetMaleOrFemaleTitle}              //*[@*='nameTitleLabel' or @*='Certo! É macho ou fêmea?']
${RegisterANewPetCastrationTitle}              //*[@*='nameTitleLabel' or @*='Já passou por castração?']
${RegisterANewPetBreedTitle}              //*[@*='nameTitleLabel' or @*='Qual é a raça?']
${RegisterANewPetSelectBreed}              //*[@*='nameTitleLabel' or @*='Escolha a raça']
${RegisterANewPetSearchBreedTextField}              //*[@*='nameTitleLabel' or @*='Pesquisar']
${RegisterANewPetFirstBreedDog}              //*[@*='nameTitleLabel' or @*='SRD GRDE PELO CURTO']
${RegisterANewPetFirstBreedCat}              //*[@*='nameTitleLabel' or @*='ABISSINIO']
${RegisterANewPetDateBirthTitle}              //*[@*='nameTitleLabel' or @*='Lembra a data de nascimento?']
${RegisterANewPetSubTitle}              //*[@*='nameTitleLabel' or @*='A data aproximada nos ajuda a indicar produtos e serviços de acordo com a idade do pet.']
${RegisterANewPetDateBirthTextField}              //*[@*='nameTitleLabel' or @*='00/00/0000']
${RegisterANewPetLessThanAYear}              //*[@*='nameTitleLabel' or @*='Não sei, mas tem menos de um ano']
${RegisterANewPetMoreThanAYear}              //*[@*='nameTitleLabel' or @*='Não sei, mas tem mais de um ano']
${RegisterANewPetWeightTextField}              //*[@*='nameTitleLabel' or @*='']
${RegisterANewPetTitle}              //*[@*='nameTitleLabel' or @*='']
${RegisterANewPetJumpStep}              //*[@*='nameTitleLabel' or @*='Pular']
${RegisterANewPetPhotoTitle}              //*[@*='nameTitleLabel' or @*='Agora é só escolher a melhor foto e finalizar em grande estilo (opcional)']
${RegisterANewPetSwitchPhotoButton}              //*[@*='nameTitleLabel' or @*='Alterar foto']
${RegisterANewPetConfirmationTitle}              //*[@*='nameTitleLabel' or @*='Adoramos conhecer seu pet!']
${RegisterANewPetConfirmationSubTitle}              //*[@*='nameTitleLabel' or @*='Todos os dados estão corretos?']
${RegisterANewPetConfirmationName}              //*[@*='nameTitleLabel' or @*='Nome']
${RegisterANewPetConfirmationPet}              //*[@*='nameTitleLabel' or @*='Pet']
${RegisterANewPetConfirmationSex}              //*[@*='nameTitleLabel' or @*='Sexo']
${RegisterANewPetConfirmationCastration}              //*[@*='nameTitleLabel' or @*='Castrado']
${RegisterANewPetConfirmationBreed}              //*[@*='nameTitleLabel' or @*='Raça']
${RegisterANewPetConfirmationDateBirth}              //*[@*='nameTitleLabel' or @*='Data de nascimento']
${RegisterANewPetConfirmationWeight}              //*[@*='nameTitleLabel' or @*='Peso']
${RegisterANewPetConfirmationSaveButton}              //*[@*='nameTitleLabel' or @*='Salvar']
${RegisterANewPetConfirmationCameraIcon}              //*[@*='nameTitleLabel' or @*='br.com.petz:id/iv_camera']
${RegisterANewPetConfirmationSuccessTitle}              //*[@*='nameTitleLabel' or @*='Cadastro realizado']
${RegisterANewPetConfirmationPetRegisteredSuccess}              //*[@*='nameTitleLabel' or @*='O pet foi cadastrado.']
${RegisterANewPetConfirmationModalCloseButton}              //*[@*='nameTitleLabel' or @*='Fechar']
#${RegisterANewPetConfirmation}              //*[@*='nameTitleLabel' or @*='']
${ServicesCancelButton}                     //*[@*='Cancelar' or @*='']
${typeOfPet}                     //*[@*='Cachorro' or @*='Cachorro']
${BreedOfPet}                       //*[@*='CALOPSITA' or @*='']
${ManterButton}                //*[@*='br.com.petz:id/bt_primary' or @*='']
${ExcluirButton}                //*[@*='br.com.petz:id/bt_secondary' or @*='Excluir']
${RegisteredSuccessTitle}                     //*[@*='Cadastro excluído' or @*='br.com.petz:id/tv_title']
${RegisteredSuccessDescription}                     //*[@*='O cadastro do Filó foi excluído.' or @*='br.com.petz:id/tv_description']
${EntendiDeleteButton}                         //*[@*='Entendi' or @*='']
#edit fields screen

${EditGender}                      //android.widget.EditText[@text="0"]
${SelectEditGender}                //*[@*='Salvar' or @*='']
#${nameFieldUpdate}            //android.widget.LinearLayout[@resource-id="br.com.petz:id/input_layout"])[1]/android.widget.FrameLayout/android.widget.EditText

*** Keywords ***
Validate My Pets Screen with pets
    Sleep    4
    Validate Element    ${LeftMenu}
    Validate Element   ${MyPetsTitle} 
    Validate Element   ${MyPetsRegisterANewPet}
    Validate Element   ${MyPetsPetAvatar}

Validate My Pets Screen without pets
    Sleep               6
    Validate Element   ${MyPetsTitle} 
    Validate Element    ${LeftMenu}
    Validate Element   ${MyPetsRegisterANewPet}
    Validate Element    ${MsgNoPetsRegistered}
    Validate Element    ${MsgRegisterANewPetWithNoPets}

Validate My Pets Details Of Pet Screen
    Validate Element    ${LeftMenu}
    Validate Element   ${MyPetsTitle} 
    Validate Element   ${MyPetsPetAvatar}  
    Validate Element   ${MyPetsLAyoutTitle} 
    Validate Element   ${MyPetsLAyoutName} 
    Validate Element   ${MyPetsSpecies} 
    Validate Element   ${MyPetsGender} 
    Validate Element   ${MyPetsCastration} 
    Validate Element   ${MyPetsDateBirth} 
    Validate Element   ${MyPetsWeight} 
    Validate Element   ${MyPetsChangeRegistration} 
    Validate Element   ${MyPetsDeletePet}

Validate My Pets Edition Screen
    Validate Element    ${LeftMenu}
    Validate Element    ${MyPetsEditionChangeRegisterTitle}
    Validate Element    ${CancelButton}
    Validate Element    ${MyPetsEditionChangeRegisterTitle}   
    Validate Element    ${MyPetsEditionChangePicture} 
    Validate Element    ${MyPetsEditionName} 
    Validate Element    ${MyPetsEditionSex} 
    Validate Element    ${MyPetsEditionSpecies} 
    Validate Element    ${MyPetsEditionBreed} 
    Swipe Until Element is Visible    ${MyPetsEditionWeight} 
    Swipe Until Element is Visible    ${MyPetsEditionDateBirth} 
    Validate Element    ${MyPetsEditionLessThanAYear} 
    Validate Element    ${MyPetsEditionMoreThanAYear} 
    Validate Element    ${MyPetsEditionSwitchCastration} 
    Swipe Until Element is Visible    ${MyPetsEditionSavePetEdition}

Validate Register a new pet type on pet screen
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${ContinueButton}
    Validate Element    ${RegisterANewPetDog}
    Validate Element    ${RegisterANewPetCat}
    Validate Element    ${RegisterANewPetFish}
    Validate Element    ${RegisterANewPetBird}
    Validate Element    ${RegisterANewPetRodent}
    Validate Element    ${RegisterANewPetRabbit}
    Validate Element    ${RegisterANewPetReptile}
    Validate Element    ${RegisterANewPetTypeOfPetTitle}
 
Validate Register a new pet name screen
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${ContinueButton}
    Validate Element    ${RegisterANewPeTNameOfPetTitle}
    Validate Element    ${RegisterANewPetNameTextField}
 
Validate Register a new pet sex and castration screen
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${ContinueButton}
    Validate Element    ${RegisterANewPetMalePet}
    Validate Element    ${RegisterANewPetFemalePet}
    Validate Element    ${RegisterANewPetYesCastration}
    Validate Element    ${RegisterANewPetNoCastration}
    Validate Element    ${RegisterANewPetMaleOrFemaleTitle}
    Validate Element    ${RegisterANewPetCastrationTitle}   
 
Validate Register a new pet breed screen
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${ContinueButton}
    Validate Element    ${RegisterANewPetBreedTitle}
    Validate Element    ${RegisterANewPetSelectBreed}   
 
Validate Register a new pet date birth screen
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${ContinueButton}
    Validate Element    ${RegisterANewPetDateBirthTitle}
    Validate Element    ${RegisterANewPetSubTitle}
    Validate Element    ${RegisterANewPetDateBirthTextField}
    Validate Element    ${RegisterANewPetLessThanAYear}
    Validate Element    ${RegisterANewPetMoreThanAYear}
 
Validate Register a new pet Weight screen
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${ContinueButton}
    Validate Element   ${RegisterANewPetJumpStep}
    Validate Element    ${RegisterANewPetWeightTextField}
    Validate Element    ${RegisterANewPetTitle}
    Validate Element    ${RegisterANewPetSubTitle}
 
Validate Register a new pet Photo screen
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${ContinueButton}
    Validate Element   ${RegisterANewPetJumpStep}
    Validate Element   ${RegisterANewPetPhotoTitle}
    
Validate Register a new pet Confirmation screen
    Validate Element    ${ServicesCancelButton}
    Validate Element    ${RegisterANewPetHeader}
    Validate Element    ${RegisterANewPetSwitchPhotoButton}
    Validate Element    ${RegisterANewPetConfirmationTitle}
    Validate Element    ${RegisterANewPetConfirmationSubTitle}
    Validate Element    ${RegisterANewPetConfirmationName}
    Validate Element    ${RegisterANewPetConfirmationPet}
    Validate Element    ${RegisterANewPetConfirmationSex}
    Validate Element    ${RegisterANewPetConfirmationCastration}
    Validate Element    ${RegisterANewPetConfirmationBreed}
    Validate Element    ${RegisterANewPetConfirmationDateBirth}
    Validate Element    ${RegisterANewPetConfirmationWeight}
    Validate Element    ${RegisterANewPetConfirmationSaveButton}
    Validate Element    ${RegisterANewPetConfirmationCameraIcon}

Register a new pet
    Swipe Until Element is Visible    ${RegisterNewPetOnServices}
    Validate and Click    ${RegisterNewPetOnServices}
    Validate Register a new pet type on pet screen
    Sleep             3
    Validate and Click    ${TypeOfPet}
    Validate and Click    ${ContinueButton}
    Validate Register a new pet name screen
    Validate and Click    ${RegisterANewPetNameTextField}
    Input Text Into Current Element    Filó
    Hide Keyboard
    Validate and Click    ${ContinueButton}
    Validate Register a new pet sex and castration screen
    Sleep             2
    Validate and Click    ${RegisterANewPetMalePet}
    Validate and Click    ${RegisterANewPetYesCastration}
    Validate and Click    ${ContinueButton}
    Validate Register a new pet breed screen
    Sleep             2
    Validate and Click    ${RegisterANewPetSelectBreed}
    Validate and Click    ${RegisterANewPetSearchBreedTextField}
    Validate and Click    ${BreedOfPet}
    Validate and Click    ${ContinueButton}
    Validate Register a new pet date birth screen
    Sleep             2
    Validate and Click    ${DateOfBirthTextField}
    Press Keycode    8
    Press Keycode    7
    Press Keycode    8
    Press Keycode    7
    Press Keycode    9
    Press Keycode    7
    Press Keycode    8
    Press Keycode    7  
    Hide Keyboard
    Sleep    1
    Validate and Click    ${ContinueButton}
    Validate and Click    ${RegisterANewPetJumpStep}
    Validate Register a new pet Photo screen
    Validate and Click    ${ContinueButton}
    Validate Register a new pet Confirmation screen
    Validate and Click    ${RegisterANewPetConfirmationSaveButton}
    Validate Element    ${RegisterANewPetConfirmationSuccessTitle}       
    Validate Element    ${RegisterANewPetConfirmationPetRegisteredSuccess}
    Validate and Click                 ${RegisterANewPetConfirmationModalCloseButton}

Update a pet registered
    Validate and Click                      ${MyPetsPetAvatar}
    Validate My Pets List Screen
    Validate and Click                      ${MyPetsChangeRegistration}
    Validate and Input Text          ${EditGender}            1
    Validate and Click                      ${MyPetsEditionSavePetEdition}
    #Validate My Pets Edit Screen


delete a pet registered
    Validate and Click                      ${MyPetsPetAvatar}
    Validate My Pets List Screen
    Validate and Click                      ${MyPetsDeletePet}
    Sleep                    1
    Validate Element                        ${ManterButton}
    Validate and Click                      ${ExcluirButton}
    Sleep                 5
    Validate and Click                      ${EntendiDeleteButton}
    #Validate Element                        ${MsgNoPetsRegistered}
    

Validate My Pets List Screen
    Validate Element                  ${MyPetsPetAvatar}
    Validate Element                  ${MyPetsLAyoutTitle}
    Validate Element                  ${MyPetsLAyoutName} 
    Validate Element                  ${MyPetsSpecies} 
    Validate Element                  ${MyPetsGender} 
    Validate Element                  ${MyPetsCastration}
    Validate Element                  ${MyPetsDateBirth}
    Validate Element                  ${MyPetsWeight} 
    Validate Element                  ${MyPetsChangeRegistration}
    Validate Element                  ${MyPetsDeletePet} 

Validate My Pets Edit Screen
    Validate Element                  ${MyPetsPetAvatar}
    Validate Element                  ${MyPetsLAyoutTitle}
    Validate Element                  ${MyPetsLAyoutName} 
    Validate Element                  ${MyPetsSpecies} 
    Validate Element                  ${MyPetsGender} 
    Validate Element                  ${MyPetsCastration}
    Validate Element                  ${MyPetsDateBirth}
    Validate Element                  ${MyPetsWeight} 
    Validate Element                  ${MyPetsChangeRegistration}
    Validate Element                  ${MyPetsDeletePet} 
