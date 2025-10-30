@VFG10X-1701 @DetailedCalculation @Card @Regression @Master

Feature: VFG10X-1701 Return Transaction _Blind Return of multiple items _ item level discount to one item and add tax override to one item_ Refund to Master card_ No customer assigned

  Scenario: Return Transaction _Blind Return of multiple items _ item level discount to one item and add tax override to one item_ Refund to Master card_ No customer assigned

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant clicks on Skip button
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant navigate to basket page from return mode page

  #Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant clicks on amount button for tax override
    And the sales assistant enter new tax amount as 8
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - $8.00" is applied to item

  #Apply item level discount
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount percentage as 15
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 2 after "15%" discount is applied
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Discount - 15%" is applied to item
    And the sales assistant validate total transaction amount
    And the sales assistant calculate the tax amount of a product at index 2
    #Above step not applicable if the product don't have percentage discount
    And the sales assistant validate the tax amount is correct for multiple item after applying tax override to one item

  #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
