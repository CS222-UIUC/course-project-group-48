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
	var member_track [4]string
	var count int
	for i < 4 {
		fmt.Println(members[i])
		if members[i] == "" {
			if (i == 0) {
				db.Exec("UPDATE usersgroup SET member1 = ? WHERE groupname=?", username, groupname)
			} else if (i == 1) {
				db.Exec("UPDATE usersgroup SET member2 = ? WHERE groupname=?", username, groupname)
			} else if (i == 2) {
				db.Exec("UPDATE usersgroup SET member3 = ? WHERE groupname=?", username, groupname)
			} else {
				db.Exec("UPDATE usersgroup SET member4 = ? WHERE groupname=?", username, groupname)
			}
			break
		} else {
			count++
			member_track[i] = members[i]
		}
		i++
	}
	if (count == 4) {
		return c.String(http.StatusBadRequest, "Group is full\n")
	}

	return c.String(http.StatusOK, groupname+"\n")
}
