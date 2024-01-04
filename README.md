# REST API for shop in Mooncript

## This REST API handles GET, POST, PUT and DELETE request. It is written using Lapis framework and uses Postgres database.

### Additional info:
The database has name, username and password, you can change it if you want (docker-compose.yml and config.moon files).

## To run:
1. Start the database:
```commandline
docker-compose up -d
```

2. Run the migrations:
```commandline
lapis migrate
```

3. Run the app:
```commandline
lapis server
```