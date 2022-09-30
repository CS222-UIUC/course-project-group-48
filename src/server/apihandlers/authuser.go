package apihandlers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func Auth_user(c echo.Context) error {
	return c.String(http.StatusOK, "authentication user\n")
}
