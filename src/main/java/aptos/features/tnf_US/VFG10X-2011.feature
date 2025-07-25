@VFG10X-2011 @ReturnTransaction @Regression

Feature: VFG10X-2011 Return Transaction _ Refund _Sale transaction paid using Reward_Reward points deducted on refund

  Scenario: Return Transaction _ Refund _Sale transaction paid using Reward_Reward points deducted on refund

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    And the sales assistant saves the loyalty points
    And the sales assistant navigates to basket from page from loyalty page
    Then the sales assistant add 2 items from "HigherPrice" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Damaged/Defective" as reason code
    And the sales assistant clicks on "Ok" button to assign customer

  # Refund
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

  # Validate Loyalty Points and Logout
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign recently assigned customer
    And the sales assistant validate loyalty points after refund
    And the sales assistant navigates to basket from page from loyalty page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application