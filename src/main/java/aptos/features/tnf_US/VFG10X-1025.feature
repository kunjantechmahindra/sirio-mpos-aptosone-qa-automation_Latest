@VFG10X-1025 @StoreSelling @Regression
Feature: VFG10X-1025 Store Selling Functions _Validation of receipt Header- Store details

  Scenario: Store Selling Functions _Validation of receipt Header- Store details

    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Assign customer and Add item
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Get store details from information page
    And the sales assistant navigate to information page
    And the sales assistant save the store details from information page
    And the sales assistant clicks on Basket button from header

      #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email and Print button
    And the sales assistant enter the email
    And the sales assistant select the printer

    #Physical receipt validation
    And the sales assistant validate store details are in physical receipt
    And the sales assistant logout from the application

