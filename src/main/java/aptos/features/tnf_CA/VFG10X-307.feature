@VFG10X-307 @VFG10X-305 @VFG10X-303
@StoreSelling @Regression
Feature: VFG10X-302 Store Selling Functions _ Color of Login Page _ Outlet Store

  Scenario: Store Selling Functions _ Color of Login Page _ Outlet Store

 #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant validate the color of basket page
    And the sales assistant logout from the application
    And the sales assistant validate the color of login page