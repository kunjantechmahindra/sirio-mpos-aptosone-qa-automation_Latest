@VFG10X-2127 @Regression @Card @StoreSelling @Amex @Smoke @SmokeTesting
Feature: VFG10X-2127 Store Selling Functions _Signature prompt validation for all return transactions with or without the original sales receipts

  Scenario: Store Selling Functions _Signature prompt validation for all return transactions with or without the original sales receipts

    # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code

    # Refund to card
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant validates signature prompt displayed
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant lands on Basket Page

    # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
#    And the sales assistant clicks on Skip button

    # Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Damaged" as reason code
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Changed Mind" as reason code
    And the sales assistant navigate to basket page from return mode page

    # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "amex" card using a "insert" action, entering the pin "0"
    And the sales assistant validates signature prompt displayed
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application