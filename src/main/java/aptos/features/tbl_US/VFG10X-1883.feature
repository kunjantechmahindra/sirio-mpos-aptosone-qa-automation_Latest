@VFG10X-1883 @Customer @Regression
Feature: VFG10X-1883 Create Customer with Mandatory fields + Opt-in to Loyalty  first

  Scenario: Create Customer with Mandatory fields + Opt-in to Loyalty  first

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Create Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Loyalty Terms
    And the sales assistant clicks on Save button

  # Validate Customer Attributes
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate Privacy and Loyalty are enabled
    And the sales assistant navigate to basket page

  # Add Items
    Given the sales assistant add 2 items from "General" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Membership Reward button
    And the sale assistant validate no rewards are available
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Email button
    And the sales assistant enter continue without entering mailID

  # Logout
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search recently assigned customer
    And the sales assistant save the customer details
    And the sales assistant saves the loyalty points
    And the sales assistant navigates to basket from page from loyalty page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

  # Cheetah Validation
    And the sales assistant launch the browser and navigate to Cheetah Application
    And the sales assistant search customer with email
    And the sales assistant validate customer details
    And the sales assistant closes the browser window. 