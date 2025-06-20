@VFG10X-993 @Customer @Regression
Feature: VFG10X-993 _Removing customer from a Sale

  Scenario: Customer _Removing customer from a Sale

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0

  # Add Product
    Then the sales assistant add 2 items from "General" product to the basket

  # Remove the customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant removes the customer from the transaction

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application