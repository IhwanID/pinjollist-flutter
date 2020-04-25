# pinjollist

Pinjollist Flutter application.


## Library Used

* [dio](https://pub.dev/packages/dio)
* [json_annotation](https://pub.dev/packages/json_annotation)
* [url_launcher](https://pub.dev/packages/url_launcher)
* [rxdart](https://pub.dev/packages/rxdart)
* [flutter_lottie](https://pub.dev/packages/flutter_lottie)
* [build_runner](https://pub.dev/packages/build_runner)
* [json_serializable](https://pub.dev/packages/json_serializable)

import 'package:pinjollist/repository/companies_repository.dart';
import 'package:pinjollist/model/companies.dart';
import 'package:rxdart/rxdart.dart';

class CompaniesBloc {
  final CompaniesRepository _repository = CompaniesRepository();
  final BehaviorSubject<CompaniesResponse> _subject =
      BehaviorSubject<CompaniesResponse>();

  getCompanies() async {
    CompaniesResponse response = await _repository.getCompanies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CompaniesResponse> get subject => _subject;
}

final bloc = CompaniesBloc();

