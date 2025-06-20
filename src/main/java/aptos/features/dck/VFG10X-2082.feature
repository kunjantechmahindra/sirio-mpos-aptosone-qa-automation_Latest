@VFG10X-2082 @StoreSelling @Regression

Feature: VFG10X-2082 Store Selling Functions_ Gift Card Available as Tender

  Scenario: Store Selling Functions_ Gift Card Available as Tender

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    #validate gift card as tender button enabled
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant validates gift card option is enabled for tender
    And the sales assistant void the transaction from payment with reason code "Cashier Error"
    And the sales assistant logout from the application

