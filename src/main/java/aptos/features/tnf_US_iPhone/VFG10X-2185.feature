@VFG10X-2185 @CashManagement @Regression
Feature: VFG10X-2185 Cash Management _ Till IN_ SOD-open drawer

  Scenario: Cash Management _ Till IN_ SOD-open drawer

    #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Store Operations Till in SOD
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
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer
    And the sales assistant clicks on GO to basket button
    And the sales assistant logout from the application

