@VFG10X-1705 @Exchange @Regression @GiftCard @Card @DetailedCalculation @SmokeTNF
Feature: VFG10X-1705 Exchange _Negative Blind Exchange of single item with bag fee on exchange transaction_Issue New Gift card for refund_No Customer Assigned

  Scenario: Exchange _Negative Blind Exchange of single item with bag fee on exchange transaction_Issue New Gift card for refund_No Customer Assigned

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

  # Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Price Adjustment" as reason code
    And the sales assistant navigate to basket page from return mode page

  # Add
    Then the sales assistant add 1 items from "LowerPrice" product to the basket
    And the sales assistant stores the transaction amount details

  # Validate the transaction total with Bag fee
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant validate if bag quantity is "1"
    And the sales assistant stores bag fee amount
    And the sales assistant clicks on Accept button
    And the sales assistant validate bag fee amount
    And the sales assistant validate negative exchange order total with bag fee

  # Issue New Gift Card for refund
    And the sales assistant clicks on gift card button from Refund
    And the sales assistant enters gift card number from index 5
    And the sales assistant clicks on issue button from payment
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application