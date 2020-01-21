import 'package:pinjollist/bloc/companies_repository.dart';
import 'package:pinjollist/model/companies.dart';
import 'package:rxdart/rxdart.dart';

class CompaniesBloc{
  final CompaniesRepository _repository = CompaniesRepository();
  final BehaviorSubject<CompaniesResponse> _subject =
  BehaviorSubject<CompaniesResponse>();

  getUser() async {
    CompaniesResponse response = await _repository.getCompanies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CompaniesResponse> get subject => _subject;
}

final bloc = CompaniesBloc();