@VFG10X-1005 @CashManagement @Regression @TillOut
Feature: VFG10X-1005 Cash Management _Void Till out Transaction.

  Scenario: Cash Management _Void Till out Transaction.

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
    And the sales assistant clicks on Till out back button
    And sales assistant clicks on till out button from variance in amount
    And the sales assistant clicks on till operations back button
    And the sales assistant clicks on store operations back button
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application


