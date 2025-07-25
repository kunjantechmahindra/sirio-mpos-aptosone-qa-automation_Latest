@VFG10X-1892 @Customer @Regression @Loyalty
Feature: VFG10X-1892 Customer Management_Verify Customer details on customer Profile screen

  Scenario: Customer Management_Verify Customer details on customer Profile screen

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 7
    And the sales assistant validate loyalty type
    And the sales assistant navigates to basket from page from loyalty page
    And the sales assistant saves the loyalty points
    And the sales assistant navigates to basket from page from loyalty page

  # Add Products
    Then the sales assistant add 1 items from "General" product to the basket

  # Validate Membership Rewards
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant validate available rewards

  # Payment transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Email button
    And the sales assistant enter continue without entering mailID
    And the sales assistant logout from the application