@VFG10X-1716 @SaleTransaction @Regression @DetailedCalculation
Feature: VFG10X-1716 Sale Transaction _Payment with USD (Exact Amount)_Canadian Store

  Scenario: Sale Transaction _Payment with USD (Exact Amount)_Canadian Store

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Product
    Then the sales assistant add 1 items from "General" product to the basket without customer
    And the sales assistant validate total transaction amount

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on US Dollar
    And the sales assistant clicks on US Dollar Tender
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application