@VFG10X-1447 @SaleTransaction @Regression @Card @VisaDebit
Feature: VFG10X-1447 DCK - Sales transaction_Transaction level percentage off discount_ Multiple items_ Debit Card

  Scenario: DCK - Sales transaction_Transaction level percentage off discount_ Multiple items_ Debit Card

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  # Add transaction level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 20
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Birthday" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant save sale amount details
    And the sales assistant validate transactional level percentage off 20 applied for 2 items

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa debit" card using a "insert" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
