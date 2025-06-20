@VFG10X-1865 @Regression @StoreSelling
Feature: VFG10X-1865 Store Selling Functions_ Retail Transaction Receipt Options
  Scenario: Store Selling Functions_ Retail Transaction Receipt Options

 #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID

    #Receipt Option Validation
    Then the sales assistant validate the receipt options
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application
