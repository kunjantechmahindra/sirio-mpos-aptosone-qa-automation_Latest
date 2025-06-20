@VFG10X-2235 @SaleTransaction @Regression
Feature: VFG10X-2235 Sale Transaction _Multiple Items with Tax Override_ Pay using RCM Tenders for TNF

  Scenario: Sale Transaction _Multiple Items with Tax Override_ Pay using RCM Tenders for TNF

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 3

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on More button
    And the sales assistant clicks on RCM Tenders
    And the sales assistant clicks on RCM Reason code "RCM Employee"
    And the sales assistant enters the "RCM Employee" number
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
