@VFG10X-2207 @ExchangeTransaction @Regression

Feature: VFG10X-2207 Exchange _Single Item with Item level discount on the return transaction_ Existing Customer

  Scenario: Exchange _Exchange _Single Item with Item level discount on the return transaction_ Existing Customer

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0
    Then the sales assistant add 1 items from "General" product to the basket

  #Apply item level discount
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 15
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Discount - 15%" is applied to item

  #Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Exchange transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant assign the original sale customer to the return transaction
    And the sales assistant lands on Basket Page
    And the sales assistant add 1 items from "General" product to the basket

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

