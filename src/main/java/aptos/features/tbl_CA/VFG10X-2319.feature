@VFG10X-2319 @ReturnTransaction @Regression @DetailedCalculation @Card @Visa

Feature: VFG10X-2319 Return Transaction _ Blind Return with multiple items and add tax exempt to the return transaction_Refund to Cash_Existing customer assigned

  Scenario: Return Transaction _ Blind Return with multiple items and add tax exempt to the return transaction_Refund to Cash_Existing customer assigned

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer and add item to basket
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    And the sales assistant validate if void button is enabled
    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

    #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "RTL - DAMAGED/DEFECTIVE" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Tax exempt
    And the sales assistant selects Tax button from Basket page
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on HST Exemption
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validates transactional level tax is exempted
    And the sales assistant validate total transaction amount

    #Complete refund
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application