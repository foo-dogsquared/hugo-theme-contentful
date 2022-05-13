.PHONY : serve
serve:
	hugo serve -s ./exampleSite

.PHONY : build
build:
	hugo -s ./exampleSite
