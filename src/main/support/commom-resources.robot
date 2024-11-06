*** Comments ***
Documentation
... Suite with common system features
... Resources used in all scenarios

*** Settings ***
Resource    base.robot
Library     BrowserstackLibrary    username=${UserName}    access_key=${AccessKey}

*** Variables ***
#Android
${Url}                              http://localhost:4723/wd/hub
${DeviceName}                       Google Pixel 4
${Apk}                              ${EXECDIR}/src/main/support/app/superapp.apk
${AndroidAutomationName}            UIAutomator2  
${AndroidPlatformName}              android
${AndroidUdid}                      emulator-5554
${AndroidBuild}                     e2e prod automation
${AndroidOsVersion}                 10.0
${AndroidPlatformVersion}           10.0

#Ios
${DeviceIOS}                       iPhone 13
${App}                             ${EXECDIR}/src/main/support/app/superapp.ipa
${IosUdid}                         76E4E6C2-F44F-414D-9FEC-FA772D875CEE
${IosPlatformVersion}              16.0
${IosPlatformName}                 iOS
${IosAutomationName}               XCUITest
${IosOsVersion}                    13.0
${IosBuild}                        Set Build

# Browserstack
${device}
${UserName}                        inform_user
${AccessKey}                       inform_access_key
${AppId}                           bs://afd3f80d7934d2b74223b2d289836b7c89aa7f23
${TestName}                        Petz prd
${Project}                         e2e prd automation
${IosDevice}                       Iphone 11
${AndroidDevice}                   Android Emulator

*** Keywords ***
Open App
    Set Appium Timeout    90
    IF    "${device}" == "android"    Start Android
    IF    "${device}" == "ios"    Start IOS
    IF    "${device}" == "browserstack-android"    Start Browserstack Android
    IF    "${device}" == "browserstack-ios"    Start Browserstack Ios
    # Start Screen Recording

Close App
    # Sleep    50000
    Sleep    5
    Capture Page Screenshot
    # Stop Screen Recording
    Run Keyword If      '${device}' == 'browserstack-android'    Update Test Case Status in BrowserStack
...    ELSE IF          '${device}' == 'browserstack-ios'        Update Test Case Status in BrowserStack 
    Close Application

Start Android
    Open Application    ${Url}
    ...    automationName=${AndroidAutomationName}
    ...    platformName=${AndroidPlatformName}
    ...    deviceName=${DeviceName}
    ...    app=${Apk}
    ...    udid=${AndroidUdid}
    ...    autoGrantPermissions=true

Start IOS
        Open Application     ${Url}
        ...    automationName=${IosAutomationName} 
        ...    platformName=${IosPlatformName}    
        ...    platformVersion=${IosPlatformVersion}
        ...    deviceName=${DeviceIOS} 
        ...    app=${App} 
        ...    udid=${IosUdid}  
        ...    autoGrantPermissions=true

Start Browserstack Android
    Set Appium Timeout    600
    Open Application    https://${UserName}:${AccessKey}@hub-cloud.browserstack.com/wd/hub
    ...    platformName=${AndroidPlatformName}
    ...    app=${AppId}
    ...    deviceName=${DeviceName}
    ...    platformVersion=${AndroidPlatformVersion}
    ...    os_version=${AndroidOsVersion}
    ...    project=${Project}
    ...    build=${AndroidBuild}
    ...    name=${TestName}
    ...    autoGrantPermissions=true

Start Browserstack Ios
    Set Appium Timeout    600
    Open Application    https://${UserName}:${AccessKey}@hub-cloud.browserstack.com/wd/hub
    ...    automationName=${IosAutomationName}
    ...    platformName=${IosPlatformName}
    ...    platformVersion=${IosPlatformVersion}
    ...    DeviceName=${DeviceIOS}
    ...    Device=${IosDevice}
    ...    os_version=${IosOsVersion}
    ...    project=${Project}
    ...    build=${IosBuild}
    ...    name=${TestName}
    ...    udid=${IosUdid}
    ...    autoGrantPermissions=true