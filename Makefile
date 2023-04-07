gen:
	fvm flutter pub run build_runner build

clean:
	fvm flutter clean

apk:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build apk --release --split-per-abi

release:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build apk --release --split-per-abi
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build appbundle

get:
	fvm flutter clean
	fvm flutter pub get
