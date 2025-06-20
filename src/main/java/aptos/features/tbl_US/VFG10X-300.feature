@VFG10X-300 @StoreSelling @Regression
Feature: VFG10X-300 Store Selling Functions _ Resume Option Enabled

  Scenario: Store Selling Functions _ Resume option is enabled

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Suspend and Resume button validation
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant validate if resume button is enabled
    And the sales assistant logout from the application
