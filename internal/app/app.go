package app

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type App struct{}

func (a *App) Start() {
	r := gin.Default()

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	server := &http.Server{
		Addr:    ":8080",
		Handler: r,
	}

	if err := server.ListenAndServe(); err != nil {
		log.Fatalf("failed to start server: %v\n", err)
	}
}
