PKG  = github.com/DevMine/fluxio
EXEC = fluxio

all: check test build

install:
	go install ${PKG}

build:
	go build -o ${EXEC} ${PKG}

test:
	go test -v ${PKG}/...

deps:
	go get -u github.com/lib/pq

dev-deps:
	go get -u github.com/golang/lint/golint

check:
	go vet ${PKG}/...
	golint ${PKG}/...

cover:
	go test -cover ${PKG}/...

clean:
	rm -f ./${EXEC}
