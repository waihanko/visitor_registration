import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'visitor_data_vo.g.dart';


@JsonSerializable()
@HiveType(typeId: 0)
class VisitorDataVo {

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'business_email')
  @HiveField(2)
  String? businessEmail;

  @JsonKey(name: 'company_name')
  @HiveField(3)
  String? companyName;

  @JsonKey(name: 'designation')
  @HiveField(4)
  String? designation;

  @JsonKey(name: 'business_number')
  @HiveField(5)
  String? businessNumber;

  @JsonKey(name: 'nrc')
  @HiveField(6)
  String? nrc;

  @JsonKey(name: 'is_on_quarantine')
  @HiveField(7)
  bool? isOnQuarantine;

  @JsonKey(name: 'is_contact_with_covid_person')
  @HiveField(8)
  bool? isContactWithCovidPerson;


  @JsonKey(name: 'is_suffer_flu')
  @HiveField(10)
  bool? isSufferFlu;

  @JsonKey(name: 'gender')
  @HiveField(11)
  int? gender;

  VisitorDataVo({
    this.name,
    this.businessEmail,
    this.companyName,
    this.designation,
    this.businessNumber,
    this.nrc,
    this.isOnQuarantine,
    this.isContactWithCovidPerson,
    this.isSufferFlu,
    this.gender
  });
}
