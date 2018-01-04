# Planning

## Database Tables

### Participants
field         | data type
-----         |----------
id            | SERIAL4 NOT NULL
name          | VARCHAR(256)
email         | VARCHAR(256)
preferences   | VARCHAR(256)
team_id       | INT4 REFERENCES teams(id)


### Teams
field         | data type
----------    | ------------
id            | SERIAL4 NOT NULL
name          | VARCHAR(256)

### Pairs
field         | data type
-------       | ------
id            | SERIAL4 NOT NULL
santa_id      | INT4 REFERENCES participants(id)
recipient_id  | INT4 REFERENCES participants(id)



## Models
Each table corresponds to a class.

Each class will have full CRUD actions, and corresponding RESTful routes in the controllers.

Additional methods:
 - **CLASS**
  - METHOD


## Extensions

### Addresses
field           | data type
----            | ----
id              | SERIAL 4 NOT NULL
participant_id  | INT4 REFERENCES participants(id)
line1           | VARCHAR(256)
line2           | VARCHAR(256)
line3           | VARCHAR(256)
city            | VARCHAR(256)
country         | VARCHAR(256)
post_code       | VARCHAR(256)

Additional methods:
 - **Address**
  - format for mailing
