
  Feature: Karate Java Integration

    Scenario: Create new faker user
      * def baseUrl = 'https://www.krafttechexlab.com/sw/api/v1/allusers'

      * def userGenerator = Java.type('utilities.NewUserDataGenerator')
      * def NewUser = userGenerator.userDataGenerator()
      * print NewUser

      Given url baseUrl
      * path 'Register'
      And header Accept = 'application/json; charset=UTF-8'
      And header Content-Type = 'application/json; charset=UTF-8'
      And request NewUser
      When method POST
      Then status 200
      * print response
      # verify name
      * match response.name == NewUser.name
      * print response.token
      * def token = response.token

