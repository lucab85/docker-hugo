.PHONY:	all
all:	latest

.PHONY:	latest
latest:	Dockerfile
	docker build -t hugo:latest .

