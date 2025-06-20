@VFG10X-2024 @VFG10X-2023 @StoreSelling @Regression
Feature: VFG10X-2024 Store Selling Functions _ Color of Basket Page

  Scenario: Store Selling Functions _ Color of Basket Page

 #Login and validating color of basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant validate the color of basket page
    And the sales assistant logout from the application
    And the sales assistant validate the color of login page