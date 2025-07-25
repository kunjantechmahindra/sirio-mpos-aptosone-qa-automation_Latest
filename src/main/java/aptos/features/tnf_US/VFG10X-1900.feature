@VFG10X-1900 @DetailedCalculation @Regression
Feature: VFG10X-1900 Validation of default Tax rates for particular stores

  Scenario: Validation of default Tax rates for particular stores

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "HigherPrice" product to the basket without customer

    #Default tax rate
    #Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant stores Current tax rate
    And the sales assistant stores price of first product
    And the sales assistant validate default tax rate applied correctly

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