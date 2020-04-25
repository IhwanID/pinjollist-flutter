import 'package:equatable/equatable.dart';
import 'package:pinjollist/model/companies.dart';
import 'package:meta/meta.dart';

abstract class CompaniesState extends Equatable {
  const CompaniesState();
  @override
  List<Object> get props => [];
}

class CompaniesInitial extends CompaniesState {}

class CompaniesLoadInProgress extends CompaniesState {}

class CompaniesLoadSuccess extends CompaniesState {
  final CompaniesResponse companies;

  const CompaniesLoadSuccess({@required this.companies})
      : assert(companies != null);

  @override
  List<Object> get props => [companies];
}

class CompaniesLoadFailure extends CompaniesState {}
