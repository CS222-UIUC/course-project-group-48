package config

import (
	"database/sql"
	"log"
)

func Config() {
	db, err := sql.Open("sqlite3", "./database/users.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	stmt := `CREATE TABLE userinfo(username TEXT, password TEXT);`
	_, err = db.Exec(stmt)

	dbim, err := sql.Open("sqlite3", "./database/images.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	stmt = `CREATE TABLE profilepictures(username TEXT, photo BLOB NOT NULL);`
	_, err = dbim.Exec(stmt)
}
