@VFG10X-1799 @Regression @ExchangeTransaction @Card @GiftCard @Master @SmokeDCK
Feature: VFG10X-1799 Exchange _Even Exchange with Temp MD item _ add through the Product enquiry page_emp discount 60% override_ in sales

  Scenario: Exchange _Even Exchange with Temp MD item _ add through the Product enquiry page_emp discount 60% override_ in sales

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add item to basket
    Then the sales assistant add 2 items from "EvenExchange_TempMD" product to the basket

  # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code

  # Add Temp MD product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by UPC number from "EvenExchange_TempMD"
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant lands on Basket Page

  # Add Temp MD product to basket
    Then the sales assistant add 1 items from "EvenExchange_TempMD" product to the basket

  # Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page

  # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Transaction Discount" in EJ
    And the sales assistant logout from EJViewer