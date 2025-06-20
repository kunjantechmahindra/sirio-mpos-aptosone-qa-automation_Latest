@VFG10X-2071 @StoreSelling @Regression
Feature: VFG10X-2071 DCK_Store Selling Functions _ Resume Option Enabled

  Scenario: DCK_Store Selling Functions _ Resume Option Enabled

 #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  #Suspend and Resume button validation
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant validate if resume button is enabled
    And the sales assistant clicks on Resume button
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application
