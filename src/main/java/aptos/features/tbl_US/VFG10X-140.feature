@VFG10X-140 @CashManagement @Regression @SmokeTesting
Feature: VFG10X-140 Cash Management _ Safe to Till _ On and Above Security level

  Scenario: Cash Management _ Safe to Till _ On and Above Security level

  #Login and add item to basket
    Given the sales assistant logs in to the application with "above" security level
    When the sales assistant clicks on Start Basket button

    #Safe to till Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Safe to till" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant enter the amount
    And the sales assistant enters the quantity as 100 on first index
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button
    And the sales assistant logout from the application

