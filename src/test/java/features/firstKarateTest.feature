Feature: Welcome to Karate

    Scenario: How to print
      Given print "Hello Karate World"
      When print 'another file print'
      * print 'my name is'+' Alp'
      # feature da + yerine virgül koyunca space i otomatik veriyor.
      # Then, whwn vb lerin yerine * koyarak da çalıştırabiliriz
      Then print '.......'

      Scenario: Variables
        * def name = 'Robert'
        * print 'my name is', name
        * def age = 19
        * print name, 'is', age, 'year old'
        * print 5+5

        Scenario: Difficult parameters
          * def user = {"name": "Hasan", "role": "admin"}
          * print user
          * print user.name
          * print user.role

          @json
          Scenario: Json body
            * def user =
            """
            {"name": "Hasan",
             "role": "admin",
             "age": 44}
            """
            * print user
            * print user.age

            Scenario: json body with Array objects
              Given def user =
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
              * print user
              * print user[0]
              * print user[1].name
