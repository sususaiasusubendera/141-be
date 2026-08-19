env "local" {
    src = "file://database/schema.sql"

    url = getenv("DB_URL")

    migration {
        dir = "file://database/migrations"
    }
}