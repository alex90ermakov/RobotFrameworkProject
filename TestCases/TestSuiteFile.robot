*** Settings ***
Library  Selenium2Library
Library     Selenium2Library
Library     DateTime
*** Variables ***
${browser}  chrome
${url}    https://amd-uat.test.gosuslugi.ru/
${File_Path}    C:\\Users\\aleksey.ermakov\\PycharmProjects\\TestFiles\\Селеванов.xml
*** Test Cases ***
LoginTest
    open browser    ${url}      ${browser}
    maximize browser window
    set selenium speed      0.2seconds
    LoginToApplications

CreateDocumentTest
#Создание нового документа
    NewDocument
    MainData
    PatientPersonalData
    UploadFile
    CreateDocument

CheckingDataTest
    click element   xpath://*[@id="root"]/section/main/div[2]/div/div[1]/div[1]/div/button[2]
    #click element



#Сведения о лечении
#Результат лечения
#Документ
#Подписи
#Подтверждение создания документа

*** Keywords ***
LoginToApplications
    input text    id:username       admin
    input text    id:password       HQsJCeEhU8
    click button  xpath:/html/body/div[1]/section/div[1]/section/form/div/div[3]/div[1]/div[4]/div/div/span/button

NewDocument
    click element   xpath://*[@id="root"]/section/main/div[2]/div/div[1]/div[1]/div/button[2]

MainData
    click element   xpath://*[@id="DocumentManifest_type"]/div[1]
    click element   xpath://*[@id="DocumentManifest_type"]/div[2]/div[1]/span/input
    input text      xpath://*[@id="DocumentManifest_type"]/div[2]/div[1]/span/input   Исполнение ИПРА
    click element   xpath://*[@id="DocumentManifest_type"]/div[2]/div[3]/ul/li
    click element   xpath://*[@id="medicalOrganization"]/div[1]
    click element   xpath://*[@id="medicalOrganization"]/div[2]/div[1]/span/input
    input text      xpath://*[@id="medicalOrganization"]/div[2]/div[1]/span/input     ООО
    click element   xpath://*[@id="medicalOrganization"]/div[2]/div[3]/ul/li
    click element   xpath://*[@id="organizationalUnit"]/div[1]
    click element   xpath://*[@id="organizationalUnit"]/div[2]/div[1]/span/input
    input text      xpath://*[@id="organizationalUnit"]/div[2]/div[1]/span/input     ООО
    click element   xpath://*[@id="organizationalUnit"]/div[2]/div[3]/ul/li
    click element   xpath://*[@id="DocumentManifest_created"]/div[1]/input
    click element   xpath://*[@id="DocumentManifest_created"]/div[2]/div/div/div/div/div[2]/div[2]/table/tbody/tr[2]/td[1]/div
    click element   xpath://*[@id="documentDescription"]
    input text      id:documentDescription      тест

PatientPersonalData
    click element   id:SNILS
    input text      id: SNILS       12345678901
    click element   id:INP
    input text      id:INP          1234567890123456
    click element   id:surname
    input text      id:surname      Иванов
    click element   id:name
    input text      id:name         Иван
    click element   id:patronymic
    input text      id:patronymic   Иванович
    click element   xpath://*[@id="dateOfBirth"]/div[1]/input
    click element   xpath://*[@id="dateOfBirth"]/div[2]/div/div/div/div/div[2]/div[1]/div/a[1]
    click element   xpath://*[@id="dateOfBirth"]/div[2]/div/div/div/div/div[2]/div[2]/table/tbody/tr[1]/td[4]/div
    click element   xpath://*[@id="gender"]/div[1]
    click element   xpath://*[@id="gender"]/div[2]/div[3]/ul/li[3]

UploadFile
    choose file  id:fileList  ${File_Path}

CreateDocument
    click button    xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/form/div/div[17]/div/button


