@VFG10X-38 @SaleTransaction @Regression
Feature: VFG10X-38 Sale Transaction _Multiple Items with Bag Fee_ Payment by Cash_ No customer

  Scenario: Sale Transaction _Multiple Items with Bag Fee_ Payment by Cash_ No customer

    # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant validate if bag quantity is "1"
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
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