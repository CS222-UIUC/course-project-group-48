package imghandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Change_image(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/images.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	username := json_map["username"].(string)
	newphoto := json_map["new_photo"].(string)

	mainname := ""
	mainphoto := ""
	row := db.QueryRow("SELECT username, photo FROM profilepictures WHERE username=?", username)
	row.Scan(&mainname, &mainphoto)

	mainphoto = newphoto

	return c.String(http.StatusOK, username+" changed photo \n")
}
