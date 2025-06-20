@VFG10X-139 @CashManagement @Regression @TillOut @SmokeTesting
Feature: VFG10X-139 Cash Management _ Till OUT_ Cash to Safe

  Scenario: Cash Management _ Till OUT_ Cash to Safe

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Till out" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on counted amount for till out
    And the sales assistant enters the quantity as 100 on first index
    And the sales assistant assign click on done
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button from variance in amount
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant selects "EOD - Cash to Safe" as reason code
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer
    And the sales assistant clicks on GO to basket button
    And the sales assistant logout from the application

