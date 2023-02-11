
Feature: API Tests

  Background:
#    * def baseUrl = 'https://www.krafttechexlab.com/sw/api/v1/allusers'

    * def AuthFeature = call read('classpath:features/postNewUser.feature')
    * def userToken = AuthFeature.token
    * print "Token comes from Background", userToken

    Scenario: add experience
      Given url 'https://www.krafttechexlab.com/sw/api/v1/experience/add'
      And header Authorization = userToken
      And header Accept = 'application/json; charset=utf-8'
      * request
      """
      {
  "job": "Senior QA",
  "company": "Kraftech",
  "location": "TR",
  "fromdate": "2012-12-12",
  "todate": "2016-12-12",
  "current": "false",
  "description": "Great job"
}
      """
      When method POST
      Then status 200
      * print response
      
      Given url 'https://www.krafttechexlab.com/sw/api/v1/experience/all'
      And header Authorization = userToken
      And header Accept = 'application/json; charset=utf-8'

      When method GET
      Then status 200
      * print response
  #    * def expectedInfo = read('classpath:data/userInfo.json')

  #    Then match response == expectedInfo

 # * match response.experience[0].company == 'Kraftech'




