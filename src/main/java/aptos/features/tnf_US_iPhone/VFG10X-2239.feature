@VFG10X-2239 @Regression @Card @SaleTransaction @Visa
Feature: VFG10X-2239 Sale Transaction _Resume Transaction and complete _Payment by card

  Scenario: Sale Transaction _Resume Transaction and complete _Payment by card

    # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    # Suspend and Resume Transaction
    And the sales assistant clicks on menu button for iPhone basket
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant select the printer
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Resume button
    And the sales assistant navigate to basket page
    And the sales assistant clicks on Resume button
    And the sales assistant select the transaction to be resumed
    And the sales assistant proceed without selecting the customer

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
