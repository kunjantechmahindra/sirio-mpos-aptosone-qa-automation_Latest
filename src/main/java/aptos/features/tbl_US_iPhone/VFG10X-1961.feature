@VFG10X-1961 @ReturnTransaction @Regression @Card @Discover
Feature: VFG10X-1961 Return Transaction _ Receipt Return with Different reason codes _DAMAGED/DEFECTIVE and WRONG SIZE/COLOR

  Scenario: Return Transaction _ Receipt Return with Different reason codes _DAMAGED/DEFECTIVE and WRONG SIZE/COLOR

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "LowerPrice" product to the basket without customer

    #Complete Payment
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "discover" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

#Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 2
    And the sales assistant clicks on Done button
    And the sales assistant selects "RTL - DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 1
    And the sales assistant clicks on Done button
    And the sales assistant selects "RTL - WRONG SIZE/COLOR" as reason code

#Refund to card
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant select "discover" card for refund
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
