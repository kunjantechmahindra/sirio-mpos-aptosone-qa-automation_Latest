@VFG10X-1718 @returnTransaction @Regression @DetailedCalculation @GiftCard
Feature: VFG10X-1718 Return transaction _Return single Temp MD item payment by Visa Debit insert

  Scenario: Return transaction _Return single Temp MD item payment by Visa Debit insert

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Temp MD product to basket
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by UPC number from "Temp-MD"
    And the sales assistant save the original and temporary price
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page
    And the sales assistant validate temporary markdown discount

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa debit" card using a "insert" action, entering the pin "0"
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code

    # Refund to card
    And the sales assistant clicks on Pay button
    And the sales assistant select "visa debit" card for refund
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application