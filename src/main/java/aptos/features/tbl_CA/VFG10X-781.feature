@VFG10X-781 @CashManagement @Regression
Feature: VFG10X-781 Cash Management _PAID IN_ Reason Code - Team Meals

  Scenario: Cash Management _PAID IN_ Reason Code - Team Meals

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #PAID IN Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Paid in" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant assign enter the amount 10
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant selects "TEAM MEALS" as reason code
    And the sales assistant clicks on proceed button
    And the sales assistant sign for the transaction
    And the sales assistant logout from the application

