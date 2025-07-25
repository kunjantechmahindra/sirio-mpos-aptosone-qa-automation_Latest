@VFG10X-1787 @Regression @GiftCard @SmokeDCK
Feature: VFG10X-1787 Gift Card _Legacy_TopUP_Manually entering Gift card number

  Scenario: Gift Card _Legacy_TopUP_Manually entering Gift card number

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Top Up Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on add value button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "GIFT_CARD_RELOAD" in EJ
    And the sales assistant logout from EJViewer

    #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate the payment details on e-receipt
    And the sales assistant validate details "GIFT_CARD_RELOAD" in E-receipt
    And the sales assistant closes the browser window.



