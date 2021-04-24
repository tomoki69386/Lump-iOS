ifeq (.private,$(wildcard .private))
PRIVATE = 1
endif

test: test-client

PLATFORM_IOS = iOS Simulator,name=iPhone 12 Pro,OS=14.4
test-client:
	@xcodebuild test \
		-workspace Lump.xcworkspace \
		-scheme Staging \
		-destination platform="$(PLATFORM_IOS)"

format:
	@swift format \
		--ignore-unparsable-files \
		--in-place \
		--recursive \
		./App/ \
		./Package.swift \
		./Sources/
