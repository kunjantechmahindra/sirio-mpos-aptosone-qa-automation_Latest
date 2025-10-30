@VFG10X-1693 @SaleTransaction @Regression @DetailedCalculation
Feature: VFG10X-1693 Sale Transaction _Multiple Items with Temporary Price + Price Override + Employee Discount and BOGO Promotion_ Payment by cash

  Scenario: Sale Transaction _Multiple Items with Temporary Price + Price Override + Employee Discount and BOGO Promotion_ Payment by cash

    #Login and add items
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

   #Add Temp MD item
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by UPC number from "Temp-MD"
    And the sales assistant save the original and temporary price
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant lands on Basket Page
    And the sales assistant validate temporary markdown discount
    And the sales assistant validate total transaction amount

    #Add BOGO item
    Then the sales assistant add 2 items from "BOGO-Free" product to the basket

    #Price override
    And the sales assistant scrolls up the screen
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate the price of the product is 10 at index 1
    And the sales assistant validate total transaction amount


    #Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate total transaction amount

    #Payment by cash
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application