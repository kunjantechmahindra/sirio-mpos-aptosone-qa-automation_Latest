@VFG10X-2256 @StoreSelling @Regression
Feature: VFG10X-2256 Store Selling Functions_ Gift Receipt Option_ Transactional Level _Select grouped
  Scenario: Store Selling Functions_ Gift Receipt Option_ Transactional Level _Select grouped

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add Product
    Then the sales assistant add 2 items from "General" product to the basket without customer
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Gift receipt button from basket page
    And the sales assistant select Grouped receipt
    And the sales assistant validate gift logo is added to the product at index 2
    And the sales assistant validate gift logo is added to the product at index 1

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

