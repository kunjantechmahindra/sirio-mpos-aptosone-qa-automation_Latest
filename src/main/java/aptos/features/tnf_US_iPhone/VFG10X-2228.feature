@VFG10X-2228 @SaleTransaction @Regression @Card @Amex
Feature: VFG10X-2228 Sale Transaction _Single Item _Payment by Amex Card_ Existing customer

  Scenario: Sale Transaction _Single Item _Payment by Amex Card_ Existing customer

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer and Add item
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 3
    Then the sales assistant add 1 items from "General" product to the basket

  # Payment transaction with card
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "Amex" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
