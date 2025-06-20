@VFG10X-977 @StoreSelling @Regression

Feature: VFG10X-977 Store Selling Functions _ Validation of the Suspend functionality - User should not be able to skip reference

  Scenario: Store Selling Functions _ Validation of the Suspend functionality - User should not be able to skip reference

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer
    And then sales assistant clicks on Suspend button
    And the sales assistant click done button without entering Reference ID
    And the sales assistant validates proper Error message is shown that Reference Id is required
    And the sales assistant clicks on cancel button on suspend page

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer
