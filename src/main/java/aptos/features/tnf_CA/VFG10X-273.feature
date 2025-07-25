@VFG10X-273 @Regression @GiftCard @Card @SmokeTNF
Feature: VFG10X-273 Gift Card _ Balance Enquiry by swiping the gift card + PIN entry

  Scenario: Gift Card _ Balance Enquiry by swiping the gift card + PIN entry

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Gift card balance enquiry
    Then the sales assistant validates the Gift Card balance from basket page for index 1
    Then the sales assistant saves the Gift Card balance amount for EJ
    And the sales assistant closes the Balance Inquiry screen

  # Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page

  # Logout from the application
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Balance inquiry" in EJ
    And the sales assistant validates the Gift Card balance in EJ
    And the sales assistant logout from EJViewer