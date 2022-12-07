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

	stmt := `CREATE TABLE IF NOT EXISTS userinfo(username TEXT, password TEXT);`
	_, err = db.Exec(stmt)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	stmt = `CREATE TABLE IF NOT EXISTS usersgroup(groupname TEXT, member1 TEXT, member2 TEXT, member3 TEXT, member4 TEXT);`
	_, err = db.Exec(stmt)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	dbim, err := sql.Open("sqlite3", "./database/images.db")
	if err != nil {
		log.Fatal(err)
	}
	defer dbim.Close()

	stmt = `CREATE TABLE IF NOT EXISTS profilepictures(username TEXT, photo BLOB NOT NULL);`
	_, err = dbim.Exec(stmt)
	if err != nil {
		log.Fatal(err)
	}
	defer dbim.Close()
}
