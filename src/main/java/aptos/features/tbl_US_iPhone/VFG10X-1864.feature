@VFG10X-1864 @VFG10X-1863 @StoreSelling @Regression
Feature: VFG10X-1864,1863 Store Selling System _Logo in the Login Page and Logo in the Basket Page

  Scenario: Store Selling System _Logo in the Login Page and Logo in the Basket Page

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Logo in the Basket page
    And the sales assistant validate logo in basket page
    And the sales assistant logout from the application
    And the sales assistant validate logo in login page
