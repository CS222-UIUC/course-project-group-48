package apihandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Delete_user(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/users.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	username := json_map["username"].(string)

	_, err = db.Exec("DELETE FROM userinfo WHERE username=?", username)

	return c.String(http.StatusOK, "Authentication succeeded\n")
}
