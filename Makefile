SHELL := /bin/bash

.PHONY: dev-up dev-down dev-reset dev-logs
.PHONY: prod-up prod-down prod-logs
.PHONY: diff m-up m-down m-status m-up-1 m-down-to

# ====================
# Docker Compose
# ====================

COMPOSE = docker compose
DOCKER_BASE = -f docker-compose.yaml

DOCKER_DEV = ${DOCKER_BASE} -f docker-compose.dev.yaml
DOCKER_PROD = ${DOCKER_BASE} -f docker-compose.prod.yaml

dev-up:
	${COMPOSE} -p 141-dev ${DOCKER_DEV} up -d 

dev-down:
	${COMPOSE} -p 141-dev ${DOCKER_DEV} down

dev-reset:
	${COMPOSE} -p 141-dev ${DOCKER_DEV} down -v

dev-logs:
	${COMPOSE} -p 141-dev ${DOCKER_DEV} logs -f

prod-up:
	${COMPOSE} -p 141-prod ${DOCKER_PROD} up -d

prod-down:
	${COMPOSE} -p 141-prod ${DOCKER_PROD} down

prod-logs:
	${COMPOSE} -p 141-prod ${DOCKER_PROD} logs -f

# ====================
# Atlas & Goose
# ====================

# Atlas

diff:
	set -a && source .env && set +a && \
	atlas migrate diff $(name) \
	--env local \
	--dev-url "postgres://atlas:atlas@localhost:5434/atlas_dev?sslmode=disable" \
	--dir-format goose

# Goose migration

m-up:
	goose up

m-down:
	goose down

m-status:
	goose status

m-up-1:
	goose up-by-one

m-down-to:
	goose down-to $(ver)
	# reset: goose down-to 0 (ver = 0)