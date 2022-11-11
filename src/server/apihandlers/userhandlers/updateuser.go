package apihandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Update_user(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/users.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	username := json_map["username"].(string)
	new_username := json_map["new_username"].(string)
	new_password := json_map["new_password"].(string)

	db.Exec("UPDATE userinfo SET username=?, password=? WHERE password=?", new_username, new_password, username)

	mainpass := ""
	mainname := ""
	row := db.QueryRow("SELECT username, password FROM userinfo WHERE username=?", username)
	row.Scan(&mainname, &mainpass)

	mainname = new_username
	mainpass = new_password

	return c.String(http.StatusOK, username + "Username updated\n")

}
