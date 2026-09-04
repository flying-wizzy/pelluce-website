PORT ?= 8765
URL  := http://127.0.0.1:$(PORT)/index.html

.DEFAULT_GOAL := serve
.PHONY: serve open

# Serving over HTTP, not file:// — Chrome blocks font loads from file://, so the
# page silently falls back to Segoe UI and the wordmark looks wrong.
# --bind 127.0.0.1 keeps the server off the local network.
serve:
	@echo "Serving $(URL)  (ctrl-c to stop)"
	@python -m http.server $(PORT) --bind 127.0.0.1

# Open the page in the default browser. Run in a second shell while `make serve` runs.
open:
	@python -m webbrowser "$(URL)"
