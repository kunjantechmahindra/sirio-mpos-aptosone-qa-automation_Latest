@VFG10X-1747 @SaleTransaction @Regression @SmokeTNF
Feature: VFG10X-1747 Sale transaction - Split payment - use cash option first and then apply rewards - User is stuck at payment screen and cannot proceed.

  Scenario: Sale transaction (Only iPad Issue) - Split payment - use cash option first and then apply rewards - User is stuck at payment screen and cannot proceed.

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer and add product
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 3
    Then the sales assistant add 1 items from "General" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enter the amount for cash tender
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 25
    And the sales assistant enter the Drawer ID
    And the sales assistant store the applied reward price
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer and add product
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 3
    Then the sales assistant add 1 items from "General" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant validate reward balance
    And the sales assistant clicks on back button from membership rewards
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application