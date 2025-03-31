import 'package:eshop/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        when(() => mockDataConnectionChecker.hasConnection).thenAnswer((_) async {
          return Future.value(true);
        });

        // act
        final tHasConnectionFuture = await mockDataConnectionChecker.hasConnection;
        final result = await networkInfo.isConnected;

        // assert
        verify(() => mockDataConnectionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ODUKOI/Ecommerce-Flutter.git
git push -u origin main