help:
	@echo "make [build]"

build: constraints.txt
	docker build -t dist.design.plone .

constraints.txt: bin/buildout constraints.cfg
	bin/python create-constraints.py constraints.cfg constraints.txt

bin/buildout: bin/python
	bin/pip install -r https://dist.plone.org/release/5.2.9/requirements.txt

bin/python:
	python -m venv .
