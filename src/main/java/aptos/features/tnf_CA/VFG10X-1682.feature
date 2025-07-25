@VFG10X-1682 @ReturnTransaction @Regression

Feature: VFG10X-1682 Return Transaction _ Perform Return of a transaction paid using Reward(Part of available) and Card

  Scenario: Return Transaction _ Perform Return of a transaction paid using Reward(Part of available) and Card

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

   # Assign customer and add product
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 2 items from "General" product to the basket

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 25
    And the sales assistant validate membership reward applied
    And the sales assistant clicks on back button from membership rewards
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant clicks on "Ok" button to assign customer

   # Refund
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on gift card button from Refund
    And the sales assistant clicks on existing gift card button
    And the sales assistant enter the gift card number for payment from index 3
    And the sales assistant clicks on add value button from payment page
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application