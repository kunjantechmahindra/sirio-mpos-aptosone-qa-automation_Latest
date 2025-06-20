@VFG10X-1027 @StoreSelling @Regression @SmokeTNF
Feature: VFG10X-1027 Store Selling Functions_Validate receipt reprinting option- Last receipt option

  Scenario: Store Selling Functions_Validate receipt reprinting option- Last receipt option

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Product
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

  # Reprint last print
    And the sales assistant navigate to Reprint last receipt page
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant navigate to Reprint last receipt page
    And the sales assistant validate the reprint option is only available once
    And the sales assistant navigate to basket page from Reprint last receipt page
    And the sales assistant logout from the application