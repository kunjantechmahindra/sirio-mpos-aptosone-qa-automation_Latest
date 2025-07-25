@VFG10X-1885 @ReturnTransaction @Regression @Cheetah
Feature: VFG10X-1885 Perform a receipted return of a sale transaction using the created customer and sale transaction_Validate verified return Tenders as Rewards + CASH

  Scenario: Perform a receipted return of a sale transaction using the created customer and sale transaction_Validate verified return Tenders as Rewards + CASH

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 6
    Then the sales assistant add 2 items from "HigherPrice" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 50
    And the sales assistant validate membership reward applied
    And the sales assistant clicks on back button from membership rewards
    And the sales assistant validate if partial payment was success
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on "Ok" button to assign customer
    And the sales assistant saves the loyalty points
    And the sales assistant navigates to basket from page from loyalty page

  # Refund
    And the sales assistant clicks on Pay button
    And the sales assistant select membership reward card for refund
    And the sales assistant validate if partial refund was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant validate the loyalty points in physical receipt

  # Search customer and Logouts
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search recently assigned customer
    And the sales assistant save the customer details
    And The sales assistant ensures loyalty points are saved before logging out.
    And the sales assistant navigates to basket from page from loyalty page
    #And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

  # Cheetah Validation
    And the sales assistant launch the browser and navigate to Cheetah Application
    And the sales assistant search customer with email
    And the sales assistant validate customer details
    And the sales assistant closes the browser window.