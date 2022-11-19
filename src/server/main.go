package main

import (
	"fmt"
	"os"

	"server/apihandlers/grouphandlers"
	userhandlers "server/apihandlers/userhandlers"

	imghandlers "server/apihandlers/imghandlers"

	config "server/config"

	"github.com/labstack/echo/v4"

	_ "github.com/mattn/go-sqlite3"
)

/*
curl -X POST -d \
    "{\"groupname\":\"kelsi's group\",\"username\":\"kelsi\"}" \
    http://127.0.0.1:1323/v1/joingroup

curl -X POST -d \
    "{\"groupname\":\"kelsi's group\",\"username\":\"kelsi\"}" \
    http://127.0.0.1:1323/v1/creategroup

curl -X POST -d \
    "{\"groupname\":\"kelsi's group\",\"username\":\"kelsi\"}" \
    http://127.0.0.1:1323/v1/leavegroup

curl -X POST -d \
    "{\"username\":\"siddaddy\",\"new_username\":\"aryan\",\"new_password\":\"password1\"}" \
    http://127.0.0.1:1323/v1/updateuser

curl -X POST -H "Accept:application/json" http://127.0.0.1:1323/v1/creategroup -d '{"groupname": "q", "username": "kelsi"}'
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
	e.POST(fmt.Sprintf("%s/adduser", version1_str), userhandlers.Add_user)
	e.POST(fmt.Sprintf("%s/authuser", version1_str), userhandlers.Auth_user)
	e.POST(fmt.Sprintf("%s/deleteuser", version1_str), userhandlers.Delete_user)
	e.POST(fmt.Sprintf("%s/updateuser", version1_str), userhandlers.Update_user)

	e.POST(fmt.Sprintf("%s/addimage", version1_str), imghandlers.Add_image)
	e.POST(fmt.Sprintf("%s/changeimage", version1_str), imghandlers.Change_image)
	e.POST(fmt.Sprintf("%s/removeimage", version1_str), imghandlers.Remove_image)
	e.GET(fmt.Sprintf("%s/retrieveimage", version1_str), imghandlers.Retrieve_image)

	e.POST(fmt.Sprintf("%s/creategroup", version1_str), grouphandlers.Create_group)
	e.POST(fmt.Sprintf("%s/joingroup", version1_str), grouphandlers.Join_group)
	e.POST(fmt.Sprintf("%s/leavegroup", version1_str), grouphandlers.Leave_group)
	e.POST(fmt.Sprintf("%s/deletegroup", version1_str), grouphandlers.Delete_group)

	e.Logger.Fatal(e.Start("localhost:1323"))
}
