package main

import (
	"database/sql"
	"fmt"
	"log"

	handlers "server/apihandlers"

	"github.com/labstack/echo/v4"

	_ "github.com/mattn/go-sqlite3"
)

/*
curl -X POST -d \
    "{\"username\":\"siddaddy\",\"password\":\"pass\"}" \
    http://127.0.0.1:1323/v1/adduser
*/

var users map[string]string

func main() {
	e := echo.New()

	db, err := sql.Open("sqlite3", "./database/users.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	stmt := `CREATE TABLE userinfo(username TEXT, password TEXT);`
	_, err = db.Exec(stmt)

	// m := make(map[string]string)
	// mptr := &m

	// V1
	version1_str := "/v1"
	e.POST(fmt.Sprintf("%s/adduser", version1_str), handlers.Add_user)
	e.POST(fmt.Sprintf("%s/authuser", version1_str), handlers.Auth_user)

	e.POST(fmt.Sprintf("%s/updateuser", version1_str), handlers.Update_user)

	e.Logger.Fatal(e.Start("localhost:1323"))
}
