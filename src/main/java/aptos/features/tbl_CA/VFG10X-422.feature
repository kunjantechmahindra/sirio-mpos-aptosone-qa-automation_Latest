@VFG10X-422 @StoreSelling @Regression
Feature: VFG10X-422 Store Selling Functions _Hamburger Menu_Sales history Validation

  Scenario: Store Selling Functions _Hamburger Menu_Sales history Validation

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Sales history validation
    And the sales assistant click on hamburger menu
    And the sales assistant clicks on Sales history for store selling
    And the sales assistant clicks Today's sales from Sales history
    And the sales assistant clicks on Last sale from Sales history
    And the sales assistant clicks on sales history back button
    And the sales assistant click on basket back button
    And the sales assistant logout from the application
