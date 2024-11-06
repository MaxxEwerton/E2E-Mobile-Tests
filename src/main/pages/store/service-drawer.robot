*** Comments ***
Documentation
... Suite with categories variables


*** Settings ***
Resource                   ../../support/base.robot


*** Keywords ***
I Click On The Services Drawer Menu
    Validate and Click    ${Ecosystems}
    Validate Element      ${EcosystemsTitleText}

I Should Be Redirected To Store Page
    Validate Store Home

I Should Be Redirected To Grooming Page
    Validate Grooming Home

I Should Be Redirected To Seres Page
    Validate Seres Home

I Should Be Redirected To Blog Page
    Validate Blog Home