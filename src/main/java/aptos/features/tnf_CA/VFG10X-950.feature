#Add temp-md without permanent price
@VFG10X-950 @ReturnTransaction @Regression @Card
Feature: VFG10X-950 Return Transaction _Blind Return with Single Temp MD item without perm price with Price override and employee discount(Item Level) applied during return flow_Refund as Cash

  Scenario: Return Transaction _Blind Return with Single Temp MD item without perm price with Price override and employee discount(Item Level) applied during return flow_Refund as Cash

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

    #Add Product
    And the sales assistant enters 1 "Temp-MD-WithoutPermPrice" item UPC manually in the return
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page
    And the sales assistant lands on Basket Page
    And the sales assistant validate perm to temp savings are not shown in the discount section in discount summary

    # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 20
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button

    # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate employee discount is not applied in blind return

    # Payment transaction with card
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate the payment details on e-receipt
    And the sales assistant closes the browser window.