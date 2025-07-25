@VFG10X-2006 @StoreSelling @Regression @Card @Discover
Feature: VFG10X-2006 Store Selling Functions _Price Override _ Price Override by more than $10

  Scenario: Store Selling Functions _Price Override _ Price Override by more than $10

  # Login
    Given the sales assistant logs in to the application with "below" security level
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "ProductPrice20" product to the basket

  # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 31
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect Ticket" as reason code
    And the sales assistant clicks on Apply button
    And the manager approves the action

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "discover" card using a "insert" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer