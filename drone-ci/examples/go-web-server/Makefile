.PHONY: run test build clean

# Set ENV
OUT = app
OS = GOOS=linux
ARCH = GOARCH=amd64

# Set target
run:
	go run .

test:
	go test -v ./...

build:
	$(OS) $(ARCH) go build -o $(OUT) .

clean:
	go clean
	rm -rf ${OUT} *.exe *.out *.o *.tar.gz
