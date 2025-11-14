.PHONY: lint

build:
	docker compose build --no-cache

spec/build:
	docker compose build spec

spec/restart:
	docker compose restart spec

spec/lint:
	docker compose exec spec redocly lint --config /openapi/.redocly.yaml /openapi/openapi.yaml

spec/format:
	docker compose exec spec prettier --write /openapi/**/*.yaml

spec/format-check:
	docker compose exec spec prettier --check /openapi/**/*.yaml

spec/check:
	$(MAKE) spec/format-check
	$(MAKE) spec/lint

spec/fix:
	$(MAKE) spec/format
	$(MAKE) spec/lint

api/restart:
	docker compose restart api

api/exec-it:
	docker compose exec -it api sh

api/gen:
	docker compose exec spec redocly bundle /openapi/openapi.yaml -o /openapi/openapi.bundled.yaml
	docker compose exec api oapi-codegen -config /app/api/config.yaml /app/spec/openapi.bundled.yaml
