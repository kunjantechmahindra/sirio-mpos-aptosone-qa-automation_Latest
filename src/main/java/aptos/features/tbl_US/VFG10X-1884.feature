@VFG10X-1884 @Customer @Regression @Loyalty
Feature: VFG10X-1884 Perform a sale Transaction using the created loyalty customer and use Rewards + CASH as Tender

  Scenario: Perform a sale Transaction using the created loyalty customer and use Rewards + CASH as Tender

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer and add products
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 7
    Then the sales assistant add 2 items from "HigherPrice" product to the basket
    And the sales assistant saves the loyalty points
    And the sales assistant navigates to basket from page from loyalty page

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 350
    And the sales assistant validate membership reward applied
    And the sales assistant clicks on back button from membership rewards
    And the sales assistant validate if partial payment was success
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant validate the loyalty points in physical receipt

  # Search Customer and Logout
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search recently assigned customer
    And the sales assistant save the customer details
    And the sales assistant saves the loyalty points
    And the sales assistant navigates to basket from page from loyalty page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

  # Cheetah Validation
    And the sales assistant launch the browser and navigate to Cheetah Application
    And the sales assistant search customer with email
    And the sales assistant validate customer details
    And the sales assistant closes the browser window.