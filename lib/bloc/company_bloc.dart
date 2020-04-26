import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pinjollist/model/company.dart';
import 'package:pinjollist/repository/company_repository.dart';
import './bloc.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyRepository repository = CompanyRepository();

  @override
  CompanyState get initialState => CompanyInitial();

  @override
  Stream<CompanyState> mapEventToState(
    CompanyEvent event,
  ) async* {
    if (event is FetchCompanies) {
      yield CompanyLoadInProgress();
      try {
        final CompaniesResponse response = await repository.getCompanies();
        yield CompanyLoadSuccess(companies: response);
      } catch (_) {
        yield CompanyLoadFailure();
      }
    }
  }
}
