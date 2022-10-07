package apihandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Auth_user(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/users.db")

	json_map := make(map[string]interface{})

	username := json_map["username"].(string)
	password := json_map["password"].(string)
	err = json.NewDecoder(c.Request().Body).Decode(json_map)
	if err != nil {
		return err
	}

	mainpass := ""
	mainname := ""
	row := db.QueryRow("SELECT username, password FROM userinfo WHERE username=?", username)
	row.Scan(&mainname, &mainpass)

	if mainpass != password {
		return err
	}

	return c.String(http.StatusOK, mainname+" "+mainpass+" authenticated\n")
}
