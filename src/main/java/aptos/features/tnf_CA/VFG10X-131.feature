@VFG10X-131 @StoreSelling @Regression

Feature: VFG10X-131 Store Selling Functions_ Retail Transaction Receipt Options

  Scenario: Store Selling Functions_ Retail Transaction Receipt Options

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID

    #Receipt Option Validation
    Then the sales assistant validate the receipt options
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application
