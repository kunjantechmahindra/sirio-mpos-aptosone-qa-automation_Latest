@VFG10X-41 @SaleTransaction @Regression
Feature: VFG10X-41 Sale Transaction _Single item with Terminated Employee ID for Employee Discount

  Scenario: Sale Transaction _Single item with Terminated Employee ID for Employee Discount

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Apply employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "terminated" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant validates the invalid employee error message
    And the sales assistant clicks on cancel button

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application