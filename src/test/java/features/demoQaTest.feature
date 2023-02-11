
  Feature: Demoqa API Tests
    
    Scenario: Get all books List
      Given url "https://demoqa.com/BookStore/v1/Books"
      When method GET
      Then status 200
      * print response
      * match header Content-Type == "application/json; charset=utf-8"
      * match header X-Powered-By == "Express"
      * match header Date == '#present'

      # match methodlarda request body nin baş harflerinin büyük olması gerekiyor

    Scenario: Json body verification
      Given url "https://demoqa.com/BookStore/v1/Books"
      When method GET
      Then status 200
      # * print response
      * print response.books[0].author
      * match response.books[0].author == "Richard E. Silverman"

