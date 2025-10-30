@VFG10X-735 @Regression @StoreSelling
Feature: VFG10X-735 Store Selling Functions _ Validation of customer name  is printed on the receipt

  Scenario: Store Selling Functions _ Validation of customer name  is printed on the receipt

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0
    Then the sales assistant add 1 items from "General" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

  # Validate Customer name is printed and logout
    And the sales assistant validate the customer name of index 0 appears on the printed receipt
    And the sales assistant logout from the application