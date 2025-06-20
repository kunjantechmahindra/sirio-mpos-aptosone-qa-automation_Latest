@VFG10X-420 @StoreSelling @Regression @GiftCard @SmokeTNF
Feature: VFG10X-420 Store Selling Functions _Only Gift card to cash option is there for Tender exchange

  Scenario: Store Selling Functions _Only Gift card to cash option is there for Tender exchange

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Tender exchange
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on Tender exchange button
    And the sales assistant enters gift card number from index 2
    And the sales assistant clicks on continue button to exchange
    And the sales assistant enter the the pin from index 2
    And the sales assistant validate only cash option is available for exchange
    And the sales assistant clicks on cancel button from tender exchange
    And the sales assistant logout from the application