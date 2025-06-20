@VFG10X-2216 @Regression @GiftCard @Card
Feature: VFG10X-2216 Gift Card _ Balance Enquiry by swiping the gift card + PIN entry

  Scenario: Gift Card _ Balance Enquiry by swiping the gift card + PIN entry

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Gift card balance enquiry
    And the sales assistant validates the Gift Card balance by swiping the card from index 3
    Then the sales assistant saves the Gift Card balance amount for EJ
    And the sales assistant closes the Balance Inquiry screen

  # Logout from the application
    And the sales assistant logout from the application