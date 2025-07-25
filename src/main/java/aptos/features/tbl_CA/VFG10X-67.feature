@VFG10X-67 @SaleTransaction @Regression @Card @DiscoverAndDebit @SmokeTesting
Feature: VFG10X-67 Sale Transaction _Multiple Payments of Multiple credit card _Visa debit Insert and Discover Tap

  Scenario: Sale Transaction _Multiple Payments of Multiple credit card _Visa debit Insert and Discover Tap

    # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    # Partial Payment transaction with card and card
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters 40% of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa debit" card using a "insert" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant wait for robot to reach the starting position
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "discover" card using a "insert" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer