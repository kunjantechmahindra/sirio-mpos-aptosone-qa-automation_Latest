@VFG10X-1866 @Regression @StoreSelling
Feature: VFG10X-1866 Store Selling Functions _ Maximum Limit for reducing the price of the item
  Scenario: Store Selling Functions _ Maximum Limit for reducing the price of the item

 #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

 #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 00
    And the sales assistant validates the error message while giving price below the threshold value
    And the sales assistant enter threshold lower price as "0.01"
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "PRICE MATCH" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"