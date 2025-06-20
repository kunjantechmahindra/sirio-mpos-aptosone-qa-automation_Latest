@VFG10X-1611 @SaleTransaction @Regression @GiftCard @SmokeDCK
Feature: VFG10X-1611 Validate sale transaction by adding Gift Receipt Option at Line level

  Scenario: Validate sale transaction by adding Gift Receipt Option at Line level

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

    #Validates item level gift receipt button is enabled
    And the sales assistant selects the product at index 1
    And the sales assistant validate gift receipt option at line level is enable

    #Transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
