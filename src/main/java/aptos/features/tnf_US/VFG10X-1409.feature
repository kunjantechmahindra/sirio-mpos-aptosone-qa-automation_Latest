@VFG10X-1409 @CashManagement @Regression
Feature: VFG10X-1409 Cash Management _ Void Till IN_ Starting Bank Void Initialize the Drawer

  Scenario: Cash Management _ Void Till IN_ Starting Bank Void Initialize the Drawer

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Store Operations Void Till in
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Till in" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on counted amount for till in
    And the sales assistant enters the quantity as 100 on first index
    And the sales assistant assign click on done
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button from variance in amount
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant selects "SOD - Open Drawer" as reason code
    And the sales assistant clicks on Till in back button
    And sales assistant clicks on till in button from variance in amount
    And the sales assistant clicks on till operations back button
    And the sales assistant clicks on store operations back button
    And the sales assistant navigate from store operation to basket page
    And the sales assistant logout from the application

