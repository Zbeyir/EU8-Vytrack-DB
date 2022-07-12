Feature: Contacts page

  Scenario:Default page number
    Given the user is on the login page
    And the user enters the driver information
    When the user navigates to "Customers" "Contacts"
    Then default page number should be 1


  Scenario: Verify Create Calender Event
    Given the user is on the login page
    And the user enters the sales manager information
    When the user navigates to "Activities" "Calendar Events"
    Then the title contains "Calendars"
   #added "s" at the end of calendar to fail

  Scenario: Menu Options Driver
    Given the user logged in as "driver"
    Then the user should see following options
      | Fleet      |
      | Customers  |
      | Activities |
      | System     |


  Scenario: Menu Options Sales Manager
    Given the user logged in as "sales manager"
    Then the user should see following options
      | Dashboards         |
      | Fleet              |
      | Customers          |
      | Sales              |
      | Activities         |
      | Marketing          |
      | Reports & Segments |
      | System             |


  Scenario: login as a given user
    Given the user is on the login page
    When the user logs in using following credentials
      | username  | user10      |
      | password  | UserUser123 |
      | firstname | Brenden     |
      | lastname  | Schneider   |
    Then the user should be able to login


  Scenario Outline: login as a given user <user>
    Given the user is on the login page
    When the user logs in using following credentials
      | username  | <user>      |
      | password  | UserUser123 |
      | firstname | <firstName> |
      | lastname  | <lastName>  |
    Then the user should be able to login

    Examples:
      | user           | firstName | lastName  |
      | user10         | Brenden   | Schneider |
      | storemanager85 | Stephan   | Haley     |


    # biz cemal ile day6 da sadece burdan sonrasini yaptik
    #6.gün cemal ile DataBase de yaptik
    #AMAA BU @db runner 'a  yazmaya gerek yok sadece feature ile Hooks arasinda bir baglanti sagliyor
  #yani feature sadec @wip yaziyoruz oki?

  @db
  Scenario: Contact test with email
    Given the user logged in as "sales manager"
    And the user navigates to "Customers" "Contacts"
    When the user clicks the "mrjakc@mail.ru" from contacts
    Then the information should be same with database

  @db
  Scenario: Contact test with email
    Given the user logged in as "sales manager"
    And the user navigates to "Customers" "Contacts"
    When the user clicks the "jakop@gmail.com" from contacts
    Then the information for "jakop@gmail.com" should be same with database

  @wip @db
  Scenario Outline: Contact test with email
    Given the user logged in as "sales manager"
    And the user navigates to "Customers" "Contacts"
    When the user clicks the "<email>" from contacts
    Then the information for "<email>" should be same with database

    Examples:
      | email                    |
      | mbrackstone9@example.com |
      | jakop@gmail.com          |
      | oscar@gmail.com          |

















