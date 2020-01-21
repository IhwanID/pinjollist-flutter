import 'package:json_annotation/json_annotation.dart';

part 'companies.g.dart';

@JsonSerializable()
class CompaniesResponse {
  CompaniesResponse(this.status, this.data);

  final String status;
  final List<Companies> data;

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) =>
      _$CompaniesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesResponseToJson(this);
  
}

@JsonSerializable()
class Companies {
  Companies(
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

  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesToJson(this);
}
