VERSION = $(shell git tag --sort=version:refname  | tail -1)

build:
	go build -v -o terraform-provider-credstash

test:
	go test ./...

install: build
	mkdir -p ~/.terraform.d/plugins
	cp terraform-provider-credstash ~/.terraform.d/plugins/terraform-provider-credstash_$(VERSION)

release:
	GOOS=darwin go build -v -o terraform-provider-credstash_darwin_amd64
	GOOS=darwin GOARCH=arm64 go build -v -o terraform-provider-credstash_darwin_arm64
	GOOS=linux go build -v -o terraform-provider-credstash_linux_amd64
