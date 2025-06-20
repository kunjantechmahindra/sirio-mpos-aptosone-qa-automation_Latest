@VFG10X-605 @CashManagement @Regression @TillOut
Feature: VFG10X-605 Cash Management _ Till OUT _On or Above Security level

  Scenario: Cash Management _ Till OUT _On or Above Security level

  #Login and add item to basket
    Given the sales assistant logs in to the application with "above" security level
    When the sales assistant clicks on Start Basket button

    #Store Operations TILL OUT Above Security
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Till out" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on counted amount
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

