@VFG10X-1001 @CashManagement @Regression
Feature: VFG10X-1001 Cash Management _PAID IN_Void Paid In Transaction.

  Scenario: Cash Management _PAID IN_Void Paid In Transaction

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Paid in" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant assign enter the amount 50
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant selects "Supplies/Postage" as reason code
    And the sales assistant void the transaction from till operation page
    And the sales assistant clicks on store operations from header
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application

