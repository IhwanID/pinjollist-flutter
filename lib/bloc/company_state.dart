import 'package:equatable/equatable.dart';
import 'package:pinjollist/model/company.dart';
import 'package:meta/meta.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();
  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoadInProgress extends CompanyState {}

class CompanyLoadSuccess extends CompanyState {
  final CompaniesResponse companies;

  const CompanyLoadSuccess({@required this.companies})
      : assert(companies != null);

  @override
  List<Object> get props => [companies];
}

class CompanyLoadFailure extends CompanyState {}
