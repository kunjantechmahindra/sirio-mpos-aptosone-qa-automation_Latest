@VFG10X-2205 @ExchangeTransaction @Regression
Feature: VFG10X-2205 Even Exchange with multiple items _Use customer search for return _Existing Customer

  Scenario: Even Exchange with multiple items _Use customer search for return _Existing Customer

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

  # Add Product
    Then the sales assistant add 2 items from "EvenExchange" product to the basket

  # Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

  # Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant clicks on customer search button
    And the sales assistant search a customer using email at index 1
    And the sales assistant assign customer on the return customer search
    And the sales assistant select the transaction to be returned
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code

  # Add Product
    And the sales assistant lands on Basket Page
    Then the sales assistant add 2 items from "EvenExchange" product to the basket

  # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application