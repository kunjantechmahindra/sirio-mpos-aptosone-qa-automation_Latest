@VFG10X-397 @Regression @ReturnTransaction @Card @Visa

Feature: VFG10X-397 Return Transaction_ Blind Return with two items and add item level discount to one item and add price override to one item_Refund to Visa card_Existing customer assigned

  Scenario: Return Transaction_ Blind Return with two items and add item level discount to one item and add price override to one item_Refund to Visa card_Existing customer assigned

    #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

    #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Changed Mind" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Price override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button

    #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

    #Discount at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount amount as 5
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate the discount applied as "5"

    #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Price Match" in EJ
    And the sales assistant validate details "Damaged" in EJ
    And the sales assistant logout from EJViewer


