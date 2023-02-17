
  Feature: Using match keyword

    @assert
    Scenario: matching
      * def name = 'Robert Albert'
      * match name == 'Robert Albert'
#    Assert.assertEquals(name,"Robert Albert")
      * match name != 'Hans'


      Scenario: Fuzzy Matching
        * def user =
        """
        {
  "name": "aFm",
  "email": "dev@krafttechexlab.com",
  "password": "123467",
  "about": "About Me",
  "terms": 10,
  "position": true
}
        """
        * match user.name == '#string'
        * match user.terms == '#number'
        * match user.position == '#boolean'
        * match user.country == '#notpresent'
        # Fuzzy matching lerde == value lar '#string' olabileceği gibi yukarıdaki değer ile de assert edilebilir.


        Scenario: Contains matching
          * def users =
          """
          [
              {"name": "Alp",
             "role": "admin",
             "age": 30},

             {"name": "Kemal",
             "role": "admin",
             "age": 40}
              ]
          """
          * def length = users.length
          * print length
          * print users
          * match users contains {"name": "Kemal", "role": "admin", "age": 40}
