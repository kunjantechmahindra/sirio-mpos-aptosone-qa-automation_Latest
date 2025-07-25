@VFG10X-1513 @Regression @GiftCard
Feature: VFG10X-1513 Gift Card _ Gift Card Balance enquiry by  swiping the Gift Card + WRONG PIN - Then entering the correct PIN

  Scenario: Gift Card _ Gift Card Balance enquiry by  swiping the Gift Card + WRONG PIN - Then entering the correct PIN

    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Gift card balance enquiry
    And the sales assistant navigate to gift card balance inquiry page
    And the sales assistant clicks on balance swipe button
    And the sales assistant enter wrong pin number from index 3
    And the sales assistant clicks the back button on balance inquiry page
    And the sales assistant clicks on balance swipe button
    And the sales assistant enter the the pin from index 3
    And the sales assistant closes the Balance Inquiry screen

    # Logout from the application
    And the sales assistant logout from the application

