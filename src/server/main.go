package main

import (
	"fmt"
	"os"

	handlers "server/apihandlers"

	config "server/config"

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
	if len(os.Args) == 2 {
		if os.Args[1] == "--configure" || os.Args[1] == "-c" {
			config.Config()
		}
	}

	e := echo.New()

	// V1
	version1_str := "/v1"
	e.POST(fmt.Sprintf("%s/adduser", version1_str), handlers.Add_user)
	e.POST(fmt.Sprintf("%s/authuser", version1_str), handlers.Auth_user)
	e.POST(fmt.Sprintf("%s/deleteuser", version1_str), handlers.Delete_user)

	e.POST(fmt.Sprintf("%s/updateuser", version1_str), handlers.Update_user)

	e.Logger.Fatal(e.Start("localhost:1323"))
}
