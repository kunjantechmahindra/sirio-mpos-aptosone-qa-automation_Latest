@VFG10X-759 @Regression @GiftCard @SmokeTNF
Feature: VFG10X-759 Gift Card _ Gift Card Top up by swiping and with no customer assigned

  Scenario: Gift Card _ Gift Card Top up by swiping and with no customer assigned

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Top Up Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on swipe button
    And the sales assistant clicks on Skip button

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "GIFT_CARD_RELOAD" in EJ
    And the sales assistant logout from EJViewer