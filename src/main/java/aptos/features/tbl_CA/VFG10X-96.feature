@VFG10X-96 @StoreSelling @Regression
Feature: VFG10X-96 Store Selling System _Resume Functionality

  Scenario: Store Selling System _Resume Functionality

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer
    And the sales assistant saves the UPC before suspending at index 1

  # Suspend and Resume Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant select the printer
    And the sales assistant clicks on Resume button
#    And the sales assistant navigate to basket page
    And the sales assistant clicks on Basket button from header
    And the sales assistant clicks on Resume button
    And the sales assistant select the transaction to be resumed
    And the sales assistant proceed without selecting the customer
    And the sales assistant validates correct products are added to the basket at index 1

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