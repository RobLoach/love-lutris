all: vendor

clean:
	rm -rf vendor

vendor: vendor/lunajson

vendor/lunajson:
	mkdir -p vendor
	curl -Ls https://github.com/grafi-tt/lunajson/archive/1.1.tar.gz | tar xz -C vendor
	mv vendor/lunajson-1.1 vendor/lunajson
