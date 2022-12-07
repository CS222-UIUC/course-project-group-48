package grouphandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Delete_group(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/users.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	groupname := json_map["groupname"].(string)

	_, err = db.Exec("DELETE FROM usersgroup WHERE groupname=?", groupname)

	return c.String(http.StatusOK, "Deletion succeeded\n")
}
