package imghandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Retrieve_image(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/images.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	username := json_map["username"].(string)
	mainuser := ""
	mainphoto := ""
	row := db.QueryRow("SELECT username, photo FROM profilepictures WHERE username=?", username)
	row.Scan(&mainuser)
	row.Scan(&mainphoto)

	return c.String(http.StatusOK, mainphoto)
}
