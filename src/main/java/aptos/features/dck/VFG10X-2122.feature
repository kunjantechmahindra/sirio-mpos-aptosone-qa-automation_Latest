@VFG10X-2122 @StoreSelling @Regression
Feature: VFG10X-2122 Store Selling Functions _ Maximum Limit for reducing the price of the item

  Scenario: Store Selling Functions _ Maximum Limit for reducing the price of the item

 #Login and add product

    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 0
    And the sales assistant validate error message prompt
    And the sales assistant enter minimum amount as "0.01"
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect PLU Price" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validates maximum limit of reduction for price override is 0.01

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application