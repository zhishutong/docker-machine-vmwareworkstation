GOOS=windows
GOARCH=amd64

default: deps test build

deps:
	dep ensure

test:
	GOOS=$(GOOS) GOARCH=$(GOARCH) \
		go test

vet:
	GOOS=$(GOOS) GOARCH=$(GOARCH) \
		go vet

build:
	GOOS=$(GOOS) GOARCH=$(GOARCH) \
		go build \
		-i \
		-o ./bin/docker-machine-driver-vmwareworkstation.exe \
		./cmd/

clean:
	$(RM) -rf vendor
	$(RM) bin/*

.PHONY: clean deps test build
