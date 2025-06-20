@VFG10X-302 @VFG10X-303 @VFG10X-304 @VFG10X-305 @VFG10X-306 @VFG10X-307
@StoreSelling @Regression
Feature: VFG10X-302 Store Selling Functions _ Color of Login Page _ Full Price Store

  Scenario: Store Selling Functions _ Color of Login Page _ Full Price Store

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant validate the color of basket page
    And the sales assistant logout from the application
    And the sales assistant validate the color of login page