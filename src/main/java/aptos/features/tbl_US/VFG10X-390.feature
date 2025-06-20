@VFG10X-390 @StoreSelling @Regression
Feature: VFG10X-390 Store Selling Functions _ Adding Invalid Items to Basket

  Scenario: Store Selling Functions _ Adding Invalid Items to Basket

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add invalid items

    Then the sales assistant add an items from "InvalidProduct" product
    And the sale assistant click on cancel button from not on file item
    And the sales assistant logout from the application
