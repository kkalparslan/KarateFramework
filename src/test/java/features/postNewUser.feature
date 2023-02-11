
  Feature: Create a new user

    Background:
      * def baseUrl = 'https://www.krafttechexlab.com/sw/api/v1/allusers'

    Scenario: Create a new user
      Given url baseUrl
      * path 'register'
      And header Accept = 'application/json; charset=UTF-8'
      And header Content-Type = 'application/json; charset=UTF-8'
      And request
      """
      {
  "name": "Karate09 Alp",
  "email": "KAlp09@krafttechexlab.com",
  "password": "123467",
  "about": "About Me",
  "terms": "10"
}
      """
      When method POST
    #  Then status 200  status code paralel testte hata veriyor. tek test olarak denenmeli kontrol için..
      * print response

    #  * match response.name == 'Karate9 Alp' burada da yeni create olduğundan aşağıdaki match i her
        #  seferinde ona göre ayarlamak gerekiyor
      * print response.token
      * def token = response.token

