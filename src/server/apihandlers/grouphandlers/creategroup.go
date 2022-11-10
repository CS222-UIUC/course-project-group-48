package grouphandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Create_group(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/users.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	groupname := json_map["groupname"].(string)
	
	db.Exec("INSERT INTO usersgroup VALUES(?, NULL, NULL, NULL, NULL);", groupname)
	if err != nil {
	}

	maingroup := ""
	row := db.QueryRow("SELECT groupname FROM usersgroup WHERE groupname=?", groupname)
	row.Scan(&maingroup)

	return c.String(http.StatusOK, groupname+"\n")
}
