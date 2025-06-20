@VFG10X-2095 @StoreSelling @Regression
Feature: VFG10X-2095 Store Selling Functions_ Tender Exchange Option is enabled

  Scenario: Store Selling Functions_ Tender Exchange Option

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Tender exchange
    And the sales assistant navigate to store operations page
    And the sales assistant validates Tender exchange is enabled
    And the sales assistant logout from the application
