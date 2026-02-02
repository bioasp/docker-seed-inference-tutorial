IMAGENAME = bioasp/seed-inference-tutorial
build:
	docker build -t $(IMAGENAME) .

test:
	docker run --rm -it $(IMAGENAME) sh run_demo.sh
