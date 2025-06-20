@VFG10X-1962 @ReturnTransaction @Regression @Card @Discover
Feature: VFG10X-1962 Return Transaction _ Receipt less Return with Different reason codes _CHANGED MIND and PRICE ADJUSTMENT

  Scenario: Return Transaction _ Receipt less Return with Different reason codes _CHANGED MIND and PRICE ADJUSTMENT

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

  # Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "PRICE ADJUSTMENT" as reason code
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "CHANGED MIND" as reason code
    And the sales assistant navigate to basket page from return mode page

  # Refund transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "discover" card using a "insert" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
