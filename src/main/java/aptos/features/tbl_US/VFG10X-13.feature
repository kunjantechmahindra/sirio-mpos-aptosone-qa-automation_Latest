@VFG10X-13 @SaleTransaction @Regression @Card @Master @SmokeTesting
Feature: VFG10X-13 Sale Transaction _Single Item with Bag Fee_ Void Payment by Credit Card and complete by Cash_ Existing customer

  Scenario: Sale Transaction _Single Item with Bag Fee_ Void Payment by Credit Card and complete by Cash_ Existing customer

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer and Add item
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 1 items from "General" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant validates cash option is disabled or not
    And the sales assistant adds 1 bag to the order
    And the sales assistant validate if bag quantity is "1"
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction

  # Payment Void and Complete transaction
    And the sales assistant voids the partial payment

  # Payment transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application