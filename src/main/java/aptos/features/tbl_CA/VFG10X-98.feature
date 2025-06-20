@VFG10X-98 @StoreSelling @Regression

Feature: VFG10X-98 Store Selling Functions_ Return mode is enabled with Options

  Scenario: Store Selling Functions_ Return mode is enabled with Options

  #Login and validation of return options
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales validates return mode is enabled with options
    And the sales assistant clicks back button from Return page
    And the sales assistant clicks on Skip button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

