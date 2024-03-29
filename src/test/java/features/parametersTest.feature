Feature: Parameters

    Background:
    * def baseUrl = 'https://www.krafttechexlab.com/sw/api/v1/allusers'

    Scenario: path params

      * def expected =
      """
      [
  {
    "id": 1,
    "name": "MercanS",
    "email": "afmercan@gmail.com",
    "password": "$2y$10$VOqhVBmA5aPuEyd1z7YID.SV3/9QIFQ.dSVTGIetNUbNQx2gMFEAK",
    "about": "About",
    "terms": "16",
    "date": "2022-09-12 20:50:38",
    "job": "Manual Tester",
    "company": "Mrcn Software",
    "website": "https://www.krafttechexlab.com/",
    "location": "Turkey",
    "skills": [
      "PHP",
      "Java"
    ],
    "github": "aFmGit",
    "twitter": "aFmTwitter",
    "facebook": "aFmFace",
    "youtube": "aFmYoutube",
    "linkedin": "aFmLinkedin",
    "instagram": "aFmInstagram",
    "avatar": "1",
    "admin": "1",
    "education": [
      {
        "id": 44,
        "school": "School or Bootcamp",
        "degree": "Degree",
        "study": "Study",
        "description": "Program Description",
        "fromdate": "2000-12-02",
        "todate": "2004-12-01",
        "date": "2022-09-25 01:03:22"
      },
      {
        "id": 120,
        "school": "School",
        "degree": "Degree",
        "study": "Study",
        "description": "Description",
        "fromdate": "2020-05-05",
        "todate": "2020-05-05",
        "date": "2023-01-08 23:01:24"
      },
      {
        "id": 121,
        "school": "School",
        "degree": "Degree",
        "study": "Study",
        "description": "Description",
        "fromdate": "2020-05-05",
        "todate": "2020-05-05",
        "date": "2023-01-08 23:02:06"
      },
      {
        "id": 122,
        "school": "School",
        "degree": "Degree",
        "study": "Study",
        "description": "Description",
        "fromdate": "2020-05-05",
        "todate": "2020-05-05",
        "date": "2023-01-08 23:02:51"
      }
    ],
    "experience": [
      {
        "id": 38,
        "job": "Junior Developer1",
        "company": "Kraft Techex1",
        "location": "USA2",
        "description": "Description2",
        "fromdate": "2019-01-01",
        "todate": "2022-10-09",
        "date": "2022-09-05 18:10:26"
      },
      {
        "id": 56,
        "job": "Junior Developer1",
        "company": "Kraft Techex",
        "location": "USA",
        "description": "Description",
        "fromdate": "2020-01-10",
        "todate": "2022-10-09",
        "date": "2022-10-09 17:52:44"
      },
      {
        "id": 189,
        "job": "Junior Developer",
        "company": "Kraft Techex",
        "location": "USA",
        "description": "Description",
        "fromdate": "2000-01-01",
        "todate": "2023-01-21",
        "date": "2023-01-08 17:46:07"
      }
    ]
  }
]
      """
      Given url baseUrl + '/getbyid'
      And path '1'
      When method GET
      Then status 200
      * print response
      * match response == expected

      Scenario: Query Params
        Given url baseUrl
        When path 'alluser'
        * param skills = 'PHP'
        * param pagesize = 25
        * param page = 1
        * method GET
        * status 200
      #  * print response

        * match header Content-Type == 'application/json; charset=UTF-8'
        * print response[0].name
        * print response[0].skills

        # verify response body
    Then match response[0].skills == ["PHP", "Java"]
        * match response[0].name == 'MercanS'
        # verify için hem Then match deyip hem de * match diyebiliyoruz

    # verify each id
    Then match each response[*].id == '#number'
