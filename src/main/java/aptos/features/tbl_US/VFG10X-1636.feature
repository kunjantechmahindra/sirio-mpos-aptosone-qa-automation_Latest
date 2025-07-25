@VFG10X-1636 @SFCC @PrerequisiteRequired @SmokeTBL

Feature: VFG10X-1636 SFCC_ Update a TBL promotion with coupon
  Scenario: SFCC_ Update a TBL promotion with coupon

    # Login
    Given the sales assistant launches SFCC application
    And the sales assistant login to SFCC application
    And the sales assistant selects "TBL POS" as site
    And the sales assistant selects campaigns from merchant tools
    And the sales assistant enter the promotion ID "200320241"
    And the sales assistant select start date "10-Apr-2025"
    And the sales assistant select end date "31-Dec-2025"
    And sales assistant clicks on apply button in campaign page
    And sales assistant selects promotions from merchant tools
    And sales assistant enter the promotion ID "200320241" for promotions
    And sales assistant update the UPC's for the promotion
    And sales assistant select the SKU for "Promo-with-coupon-category"
    And sales assistant edit the promotion rule to "20"
    And sales assistant clicks on Apply button in promotion page
    And sales assistant clicks on Jobs from administration tab
    And sales assistant clicks on export promotion JSON for "TBL"
    And sales assistant clicks on Schedule and History Tab
    And sales assistant clicks on run button
    And sales assistant quit the browser