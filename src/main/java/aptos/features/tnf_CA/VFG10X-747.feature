@VFG10X-747 @StoreSelling @Regression @Card @VisaMaster @SmokeTNF
Feature: VFG10X-747 Store Selling Functions _Void transaction after Multiple tender authorization

  Scenario: Store Selling Functions _Void transaction after Multiple tender authorization

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant add 1 items from "General" product to the basket without customer

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success

  # Void Transaction
    And the sales assistant void the transaction from payment with reason code "Promo Error"
    And the sales assistant logout from the application