@VFG10X-112 @Customer @Regression
Feature: VFG10X-112 Customer _Email Id field is not editable

  Scenario: Customer _Email Id field is not editable

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer using email at index 2
    And the sales assistant clicks on edit customer option from Search customer page

  #Validate email is editable
    And the sales assistant validate if email is not editable
    And the sales assistant clicks on the back button from edit customer screen

  #Void and Logout from the application
    And the sales assistant navigate to basket page from Search customer page
    #And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

