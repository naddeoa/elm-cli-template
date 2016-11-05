source = $(shell find ./src/elm -name "*.elm")
elm-bundle = build/elm-bundle.js
name := Anthonyy

default: elm-make run

.PHONY: elm-make default run

elm-make: $(elm-bundle)

run:
	node ./index.js $(name)

$(elm-bundle): $(source)
	elm make $(source) --output $(elm-bundle)

clean:
	rm $(elm-bundle)
