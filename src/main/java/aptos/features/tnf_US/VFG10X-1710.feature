@VFG10X-1710 @Regression @DetailedCalculation

Feature: VFG10X-1710 Exchange Transaction_Even Blind Exchange transaction_ single Temp MD items on return and sale_No Customer assigned

  Scenario: Exchange Transaction_Even Blind Exchange transaction_ single Temp MD items on return and sale_No Customer assigned

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product for blind return
    Then the sales assistant add an items from "Temp-MD" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page
    And the sales assistant store the Temp_MD UPC in index 1

  #Validate the Temp MD price
    And the sales assistant navigate to product inquiry page
    And the sales assistant search the saved TempMD item
    And the sales assistant save the original and temporary price
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant lands on Basket Page
    And the sales assistant validate temporary markdown discount
    And the sales assistant validate total transaction amount

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application



