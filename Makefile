.PHONY: lint

PLUGIN_ID=replayio/buildevents

lint:
	docker run -it --rm -v "$$PWD:/plugin:ro" buildkite/plugin-linter --id $(PLUGIN_ID)
