@VFG10X-1603 @ReturnTransaction @Regression @SmokeDCK
Feature: VFG10X-1603 Return with Discount - Partial

  Scenario: Return with Discount - Partial

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

    # Add transaction level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Birthday" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant save sale amount details
    And the sales assistant validate transactional level percentage off 10 applied for 2 items

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 1
    And the sales assistant clicks on Done button
    And the sales assistant selects "Changed Mind" as reason code
    And the sales assistant lands on Basket Page

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application
