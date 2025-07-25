@VFG10X-1700 @ReturnTransaction @Regression @DetailedCalculation @Card @Master
Feature: VFG10X-1700 Return Transaction_ Blind Return with Single item with Price override and employee discount  applied during return_Refund as Cash_Existing customer assigned

  Scenario: Return Transaction_ Blind Return with Single item with Price override and employee discount  applied during return_Refund as Cash_Existing customer assigned

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0
    And the sales assistant validate if void button is enabled

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product for blind return
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "RTL - DAMAGED/DEFECTIVE" as reason code
    And the sales assistant navigate to basket page from return mode page

   # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "PRICE MATCH" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate the price of the product is 10 at index 1
    And the sales assistant validate total transaction amount

  #Apply Employee Discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validates "Employee Sale" is not getting applied

    # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application