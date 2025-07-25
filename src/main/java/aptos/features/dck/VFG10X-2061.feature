@VFG10X-2061 @StoreSelling @Regression
Feature: VFG10X-2061 Store Selling Functions _ Validation of the Suspend functionality - User should not be able to skip reference

  Scenario: Store Selling Functions _ Validation of the Suspend functionality - User should not be able to skip reference

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    #Suspend and Void Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID

    #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant logout from EJViewer