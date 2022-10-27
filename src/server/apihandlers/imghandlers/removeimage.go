package imghandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Remove_image(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/images.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	username := json_map["username"].(string)

	_, err = db.Exec("DELETE FROM profilepictures WHERE username=?", username)

	return c.String(http.StatusOK, "deleted profile picture")
}
