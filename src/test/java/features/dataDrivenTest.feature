Feature: Data Driven Test

  Scenario Outline: Login users
    Given url 'https://www.krafttechexlab.com/sw/api/v1/allusers/login'
    * form field email = '<email>'
    * form field password = '<password>'

    When method POST
    * status 200
    * print response

    Examples:
      | email                    | password   |
      | KAlp8@krafttechexlab.com | 123467     |
      | Ramanzi@test.com         | Test123456 |
      | user11@test.com          | Test123456 |
      | user22@test.com          | Test123456 |
      | user33@test.com          | Test123456 |
      | user44@test.com          | Test123456 |
      | user55@test.com          | Test123456 |
      | user66@test.com          | Test123456 |

    Scenario Outline:
      Given url 'https://www.krafttechexlab.com/sw/api/v1/allusers/login'
      * form field email = '<email>'
      * form field password = '<password>'

      When method POST
      * status 200
      * print response

      Examples:
        |read('data/users.csv')|
