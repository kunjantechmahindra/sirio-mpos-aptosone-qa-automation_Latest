@VFG10X-2260 @StoreSelling @Regression
Feature: VFG10X-2260 Store Selling Function _No Sale Option

  Scenario: Store Selling Function _No Sale Option

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #No sale
    And the sales assistant navigate to store operations page
    And the sales assistant validates No sale is enabled
    And the sales assistant logout from the application
