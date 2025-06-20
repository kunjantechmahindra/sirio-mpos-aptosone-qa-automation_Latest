@VFG10X-1576 @SaleTransaction @Regression

Feature: VFG10X-1576 Non Merchandise Options
  Scenario: Sale Transaction _Non Merchandise Items_ Bag Fee

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Non Merch
    And the sales assistant clicks on Non-Merch button
    And the sales assistant validate Non-Merch item list
    And the sales assistant select shipping
    And the sales assistant enter the shipping amount as 40
    And the sales assistant clicks on Apply button
    And the sales assistant clicks on Skip button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
