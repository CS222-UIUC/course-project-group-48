package main

import (
	"fmt"

	handlers "server/apihandlers"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()

	// V1
	version1_str := "/v1"
	e.POST(fmt.Sprintf("%s/adduser", version1_str), handlers.Add_user)
	e.POST(fmt.Sprintf("%s/authuser", version1_str), handlers.Auth_user)

	e.Logger.Fatal(e.Start("localhost:1323"))
}
