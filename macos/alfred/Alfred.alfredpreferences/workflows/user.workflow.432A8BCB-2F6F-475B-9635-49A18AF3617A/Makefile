.DEFAULT_GOAL := .all

PYTHON_FILES := pass-filter.py

.PHONY: .all
.all: format mypy

.venv: requirements.txt
	rm -rf .venv
	python3 -m venv .venv || (rm -rf .venv)
	.venv/bin/pip install -r requirements.txt || (rm -rf .venv)

.PHONY: format
format: .venv
	.venv/bin/black ${PYTHON_FILES}

.PHONY: mypy
mypy: .venv
	.venv/bin/mypy ${PYTHON_FILES}

.PHONY: clean
clean:
	rm -rf .venv
