
Feature: get user by id

  Scenario: match response with expected

    Given url 'https://www.krafttechexlab.com/sw/api/v1/allusers/getbyid'
    * path '1'
    * header Accept = 'application/json; charset=UTF-8'
    * method GET
    Then status 200
    * print response

    * def expectedInfo = read('classpath:data/userInfo.json')
    Then match response == expectedInfo
