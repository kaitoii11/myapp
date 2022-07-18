.PHONY: build
build:
	go build

.PHONY: test
test:
	go test -v

.PHONY: lint
lint:
	golangci-lint run

.PHONY: clean
clean:
	rm -f myapp