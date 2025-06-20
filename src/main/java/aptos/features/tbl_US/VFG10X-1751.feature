@VFG10X-1751 @ReturnTransaction @Regression @Card @DetailedCalculation @VisaAndDebit
Feature: VFG10X-1751 Return Transaction _Refund to different Payment methods _ 1st item 24% OFF and 2nd Item 30$ amount off with receipt with Reason Code:RTL - WRONG SIZE/COLOR

  Scenario: Return Transaction _Refund to different Payment methods _ 1st item 24% OFF and 2nd Item 30$ amount off with receipt with Reason Code:RTL - WRONG SIZE/COLOR

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  # Percentage off
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 24
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 1 after "24%" discount is applied
    And the sales assistant lands on Basket Page

  # Amount off
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount amount as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate price of the item at index 2 after "$30" discount is applied
    And the sales assistant validate total transaction amount
    And the sales assistant lands on Basket Page

  # Partial Payment transaction visa debit and visa
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa debit" card using a "insert" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return Transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - WRONG SIZE/COLOR" as reason code

  # Refund to card partially
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant select "visa debit" card for refund
    And the sales assistant validate if partial refund was success
    And the sales assistant select "visa" card for refund
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application