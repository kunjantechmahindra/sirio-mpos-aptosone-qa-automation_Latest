@VFG10X-2323 @DetailedCalculation @Regression
Feature: VFG10X-2323 Exchange Transaction_Blind Exchange transaction with Single and Same item with Tax Override on the return item_Payment by Cash_Existing loyalty Customer Assigned

  Scenario: Exchange Transaction_Blind Exchange transaction with Single and Same item with Tax Override on the return item_Payment by Cash_Existing loyalty Customer Assigned

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product for blind return
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

  #Apply Tax override
    And the sales assistant save sale amount details
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 8
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 8%" is applied to item
    And the sales assistant validate the sales amount after "8%" of "Tax-override" is applied to the item at index 1
    And the sales assistant lands on Basket Page

  #Add exchange item
    And the sales assistant add same return items to the basket
    And the sales assistant validate total transaction amount

  #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 3

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer