build:
	docker build . -t ledsys/mender-convert-action:0.0.1
	docker build . -t ledsys/mender-convert-action:latest
push:
	docker push ledsys/mender-convert-action:0.0.1
	docker push ledsys/mender-convert-action:latest