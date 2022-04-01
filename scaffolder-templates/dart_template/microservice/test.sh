set -ex

dart pub global activate coverage
dart test --coverage coverage
dart pub global run coverage:format_coverage --packages=.packages --report-on=lib --lcov -o coverage/lcov.info -i ./coverage