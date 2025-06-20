@VFG10X-1370 @Regression @StoreSelling
Feature: VFG10X-1370  Store Selling Functions _Validation if item images are not displayed to item lines within the virtual receipt

  Scenario: Store Selling Functions _Validation if item images are not displayed to item lines within the virtual receipt

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application

    #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate item images are not displayed to item lines within the virtual receipt
    And the sales assistant closes the browser window.