import 'package:equatable/equatable.dart';

abstract class CompaniesEvent extends Equatable {
  const CompaniesEvent();

  @override
  List<Object> get props => [];
}

class FetchCompanies extends CompaniesEvent {}
