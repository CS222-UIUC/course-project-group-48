package apihandlers

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Add_image(c echo.Context) error {
	db, err := sql.Open("sqlite3", "./database/images.db")

	json_map := make(map[string]interface{})
	err = json.NewDecoder(c.Request().Body).Decode(&json_map)
	if err != nil {
		return err
	}

	username := json_map["username"].(string)
	photo := json_map["photo"].(string)
	db.Exec("INSERT INTO profilepictures VALUES(?);", photo)
	if err != nil {
	}

	mainuser := ""
	mainphoto := ""
	row := db.QueryRow("SELECT username, photo FROM profilepictures WHERE username=?", username)
	row.Scan(&mainphoto)
	row.Scan(&mainuser)

	return c.String(http.StatusOK, mainuser + mainphoto+"\n")
}