@VFG10X-1367 @Regression @StoreSelling
Feature: VFG10X-1367 Store Selling Functions _Validation of Items line display on both Virtual and Physical  Receipts _when more than one of same item is added

  Scenario: Store Selling Functions _Validation of Items line display on both Virtual and Physical  Receipts _when more than one of same item is added

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer
    And the sales assistant add same items to the basket

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email and Print button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant validate both same item appear on different line item in physical receipt
    And the sales assistant logout from the application

    #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate both same item appear on different line items in e-receipt
    And the sales assistant closes the browser window.