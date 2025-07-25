@VFG10X-942 @ExchangeTransaction @Regression @GiftCard
Feature: VFG10X-942 Exchange Transaction_Blind Exchange transaction with Single and Same item with Tax Override on the return item_Payment by Cash_Existing loyalty Customer Assigned

  Scenario: Exchange Transaction_Blind Exchange transaction with Single and Same item with Tax Override on the return item_Payment by Cash_Existing loyalty Customer Assigned

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

  # Add Product
    Then the sales assistant add an items from "UniqueProduct" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant navigate to basket page from return mode page
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 5
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 5%" is applied to item
    And the sales assistant lands on Basket Page
    Then the sales assistant add 1 items from "UniqueProduct" product to the basket

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 9
    #And the sales assistant saves the loyalty points
    #And the sales assistant navigates to basket from page from loyalty page

  # Payment by cash
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer