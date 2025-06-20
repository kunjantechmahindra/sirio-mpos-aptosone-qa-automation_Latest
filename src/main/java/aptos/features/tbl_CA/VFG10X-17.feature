@VFG10X-17 @SaleTransaction @Regression @Card @Visa @SmokeTesting
Feature: VFG10X-17 Sale Transaction _Single Item with Bag Fee_ Void Payment by Reward Card and complete by Cash_ New customer

  Scenario: Sale Transaction _Single Item with Bag Fee_ Void Payment by Reward Card and complete by Cash_ New customer

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer


  #Create Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Newsletter
    And the sales assistant clicks on Save button

  # Payment transaction23
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "swipe" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction

  # Payment Void and Complete transaction
    And the sales assistant voids the partial payment

  # Payment transaction
    And the sales assistant enter extra amount
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer
