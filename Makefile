.PHONY: build list

all:
# flutter helper

build:
	cd app && dart run build_runner build -d
	cd packages/assets && rm -rf lib/gen && dart run build_runner build -d

build-lang:
	cd app && \
	dart run slang

fix-pods:
	cd app/ios && rm -rf Pods && rm -rf Podfile.lock && pod repo update && pod install && cd ../..

build-assets:
	cd assets && \
	rm -rf app/lib/gen && \
	dart run build_runner build -d

build-assets-windows:
	cd assets && \
	del "app/lib/gen" && \
	dart run build_runner build -d

clean:
	cd app && \
	flutter clean && flutter pub get

full_clean:
	$(MAKE) clean
	adb shell input tap 410 2240

apk-build-and-install:
	$(MAKE) clean
	cd app && \
	flutter build apk --dart-define-from-file=lib/env/.test.env && \
	adb install build/app/outputs/flutter-apk/app-release.apk

icons:
	dart run run flutter_native_splash:create
	dart run run flutter_launcher_icons     


build-api-client:
	cd packages/api && \
	dart run swagger_to_dart --config tv_client.yaml && \
	dart run swagger_to_dart --config vod_client.yaml && \
	dart run build_runner build --delete-conflicting-outputs


# Environments
ENVIRONMENTS := test stg dev prod

# Function to generate build commands
define GENERATE_BUILD_COMMANDS
apk-$(1):
	cd app && flutter build apk --dart-define-from-file lib/env/.$(1).env

apk-$(1)-debug:
	cd app && flutter build apk --dart-define-from-file lib/env/.$(1).env --debug

appbundle-$(1):
	cd app && flutter build appbundle --dart-define-from-file lib/env/.$(1).env

#  check this in production
ipa-$(1):
	cd app && flutter build ipa --dart-define-from-file lib/env/.$(1).env --export-method $(if $(findstring prod,$(1)),app-store,development)
endef

# Loop over environments and generate commands
$(foreach env,$(ENVIRONMENTS),$(eval $(call GENERATE_BUILD_COMMANDS,$(env))))

# file=home_test  , log=false
test-dev:
	@if [ "$(log)" != "false" ]; then \
		patrol test --dart-define-from-file=app/lib/env/.dev.env --target=integration_test/$(file) --show-flutter-logs; \
	else \
		patrol test --dart-define-from-file=app/lib/env/.dev.env --target=integration_test/$(file); \
	fi


filter-log:
	grep -E "^(E/ExoPlayerImplInternal|E/BetterPlayer|D/BetterPlayer|D/ErrorRecoveryManager)" input.log > filtered.log
