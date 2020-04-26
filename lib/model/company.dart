import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class CompaniesResponse {
  CompaniesResponse(this.status, this.data);

  final String status;
  final List<Company> data;

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) =>
      _$CompaniesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesResponseToJson(this);
}

@JsonSerializable()
class Company {
  Company(
      {this.registration,
      this.companyName,
      this.website,
      this.platformName,
      this.registrationType,
      this.badanHukum,
      this.isSyariah,
      this.alamat});
  final String registration;
  @JsonKey(name: 'company_name')
  final String companyName;
  final String website;
  @JsonKey(name: 'platform_name')
  final String platformName;
  @JsonKey(name: 'registration_type')
  final String registrationType;
  @JsonKey(name: 'badan_hukum')
  final String badanHukum;
  @JsonKey(name: 'is_syariah')
  final bool isSyariah;
  final String alamat;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
