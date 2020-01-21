all:
	carthage bootstrap --platform iOS
	rm -r -f GitHub.xcodeproj
	xcodegen