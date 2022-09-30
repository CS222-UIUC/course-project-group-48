package apihandlers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func Add_user(c echo.Context) error {
	return c.String(http.StatusOK, "add user\n")
}
