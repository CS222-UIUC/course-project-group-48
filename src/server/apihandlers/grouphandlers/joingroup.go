package grouphandlers

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Join_group(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/users.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	groupname := json_map["groupname"].(string)
	username := json_map["username"].(string)

	group := ""
	var members [4]string
	row := db.QueryRow("SELECT groupname, member1, member2, member3, member4 FROM usersgroup WHERE groupname=?", groupname)
	row.Scan(&group, &(members[0]), &(members[1]), &(members[2]), &(members[3]))

	i := 0
	for i < 4 {
		fmt.Println(members[i])
		if members[i] == "" {
			fmt.Println("found blank")
			members[i] = username
			fmt.Println(members[i])
			break
		}
		i++
	}

	return c.String(http.StatusOK, groupname+"\n")
}
