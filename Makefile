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

spec/check:
	$(MAKE) spec/format
	$(MAKE) spec/lint
