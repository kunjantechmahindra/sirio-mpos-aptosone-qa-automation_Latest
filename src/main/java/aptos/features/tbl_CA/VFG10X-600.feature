@VFG10X-600 @CashManagement @Regression @SmokeTBL
Feature: VFG10X-600 Cash Management _ Paid OUT _On or Above Security level

  Scenario: Cash Management _ Paid OUT _On or Above Security level

  #Login and add item to basket
    Given the sales assistant logs in to the application with "above" security level
    When the sales assistant clicks on Start Basket button

  #PAID OUT Store Operations above security level
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Paid out" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant assign enter the amount 10
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant selects "POSTAGE" as reason code
    And the sales assistant clicks on proceed button
    And the sales assistant sign for the transaction
    And the sales assistant select the printer
    And the sales assistant logout from the application

