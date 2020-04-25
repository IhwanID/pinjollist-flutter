import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pinjollist/model/companies.dart';
import 'package:pinjollist/repository/companies_repository.dart';
import './bloc.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  CompaniesRepository repository = CompaniesRepository();

  @override
  CompaniesState get initialState => CompaniesInitial();

  @override
  Stream<CompaniesState> mapEventToState(
    CompaniesEvent event,
  ) async* {
    if (event is FetchCompanies) {
      yield CompaniesLoadInProgress();
      try {
        final CompaniesResponse response = await repository.getCompanies();
        yield CompaniesLoadSuccess(companies: response);
      } catch (_) {
        yield CompaniesLoadFailure();
      }
    }
  }
}
