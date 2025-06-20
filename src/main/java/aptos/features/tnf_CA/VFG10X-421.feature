@VFG10X-421 @StoreSelling @Regression
Feature: VFG10X-421 Store Selling Functions _Start Basket Option

  Scenario: Store Selling Functions _Start Basket Option

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Start Basket Screen

    And sales assistant validate item entering text field and camera icon is displayed in basket page
    And the sales assistant logout from the application
