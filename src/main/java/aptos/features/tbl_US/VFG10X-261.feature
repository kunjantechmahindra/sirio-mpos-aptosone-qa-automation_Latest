@VFG10X-261 @Customer @Regression
Feature: VFG10X-261 Customer search using phone number

  Scenario: Customer search using phone number

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer using Phone
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer with Phone Number at index 0
    And the sales assistant validate the customer details at index 0
    And the sales assistant navigate to basket page from customer profile
    #And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application




