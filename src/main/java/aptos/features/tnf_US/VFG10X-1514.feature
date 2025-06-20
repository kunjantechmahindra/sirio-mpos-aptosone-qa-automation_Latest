@VFG10X-1514 @Regression @Card @GiftCard
Feature: VFG10X-1514 Gift Card _ Gift Card Tender Exchange by swiping the Gift Card + WRONG PIN - Then entering the correct PIN

  Scenario: Gift Card _ Gift Card Tender Exchange by swiping the Gift Card + WRONG PIN - Then entering the correct PINx

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Tender exchange
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on Tender exchange button
    And the sales assistant clicks on swipe button from Tender Exchange
    And the sales assistant enter wrong pin number from index 2
    And the sales assistant validates Tender Exchange error message
    And the sales assistant clicks on back button from Tender Exchange
    And the sales assistant clicks on swipe button from Tender Exchange
    And the sales assistant enter the the pin from index 0
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Cash for Exchange
    And the sales assistant enter the the pin from index 0
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application