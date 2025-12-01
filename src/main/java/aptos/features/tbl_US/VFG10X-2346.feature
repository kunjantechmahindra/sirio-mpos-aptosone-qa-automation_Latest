@VFG10X-297 @Omni @Regression
Feature: Complete a Delivery Transaction with Multiple Items Price Override Payment completed with Only Rewards

  Scenario: Complete a Delivery Transaction with Multiple Items Price Override Payment completed with Only Rewards


    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

    # Search product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    Then the sales assistant add 2 items from "OMNI" product by UPC Number
    And the sales assistant clicks on back button from product inquiry search page

    # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "PRICE MATCH" as reason code
    And the sales assistant clicks on Apply button

  # Price override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "RETURN/EXCHANGE" as reason code
    And the sales assistant clicks on Apply button

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant enters Delivery "Address" at index 1 for assigned customer
    And the sales assistant selects "Standard" Delivery option
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 25
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application