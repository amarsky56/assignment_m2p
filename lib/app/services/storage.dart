import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  static final _emergencyContactList = GetStorage('emergencyContact');
  static final _patientList = GetStorage('patient');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    await GetStorage.init('emergencyContact');
    await GetStorage.init('patient');
    intialiseIfNull();
    return this;
  }

  saveAddress(String storageKey, List<dynamic> storageValue) async => await _emergencyContactList.write(storageKey, jsonEncode(storageValue));

  /// read from storage
  getAddress(String storageKey) => _emergencyContactList.read(storageKey);

  int get themeMode => _runData.read('themeMode') ?? 0; // 2:follow system 1:dark 0:light
  set themeMode(int themeMode) => _runData.write('themeMode', themeMode);

  bool get isLoggedIn => _runData.read('isLoggedIn') ?? false;

  set isLoggedIn(bool isLoggedIn) => _runData.write('isLoggedIn', isLoggedIn);

  bool get isVerified => _runData.read('isVerified') ?? false;

  set isVerified(bool isVerified) => _runData.write('isVerified', isVerified);

  bool get isAutoBookingOn => _runData.read('isAutoBookingOn') ?? false;

  set isAutoBookingOn(bool isAutoBookingOn) => _runData.write('isAutoBookingOn', isAutoBookingOn);

  bool get active => _runData.read('active') ?? false;

  set active(bool active) => _runData.write('active', active);

  String get encjwToken => _runData.read('token') ?? '';

  set encjwToken(String encjwToken) => _runData.write('token', encjwToken);

  String get refToken => _runData.read('refToken') ?? '';

  set refToken(String refToken) => _runData.write('refToken', refToken);

  String get phone => _runData.read('phone') ?? '';

  set phone(String phone) => _runData.write('phone', phone);

  String get userType => _runData.read('userType') ?? '';

  set userType(String userType) => _runData.write('userType', userType);

  String get isAllowTermsAndConditions => _runData.read('isAllowTermsAndConditions') ?? '';

  set isAllowTermsAndConditions(String isAllowTermsAndConditions) => _runData.write('isAllowTermsAndConditions', isAllowTermsAndConditions);

  String get id => _runData.read('id') ?? '';

  set id(String id) => _runData.write('id', id);

  String get uid => _runData.read('uid') ?? '';

  set uid(String uid) => _runData.write('uid', uid);

  String get erelation => _runData.read('erelation') ?? '';

  set erelation(String erelation) => _runData.write('erelation', erelation);

  String get name => _runData.read('name') ?? '' "";

  set name(String name) => _runData.write('name', name);

  String get email => _runData.read('email') ?? '';

  set email(String email) => _runData.write('email', email);

  int get profilePercentage => _runData.read('profilePercentage') ?? 0;

  set profilePercentage(int profilePercentage) => _runData.write('profilePercentage', profilePercentage);

  String get countryCode => _runData.read('countryCode') ?? '';

  set countryCode(String countryCode) => _runData.write('countryCode', countryCode);

  String get img => _runData.read('img') ?? 'https://pinnacle.works/wp-content/uploads/2022/06/dummy-image.jpg';

  set img(String img) => _runData.write('img', img);

  String get referralCode => _runData.read('referralCode') ?? '';

  set referralCode(String referralCode) => _runData.write('referralCode', referralCode);

  String get numId => _runData.read('numId') ?? '';

  set numId(String referralCode) => _runData.write('numId', numId);

  String get bio => _runData.read('bio') ?? '';

  set bio(String bio) => _runData.write('bio', bio);

  String get dob => _runData.read('dob') ?? '1999-03-05';

  set dob(String dob) => _runData.write('dob', dob);

  String get gender => _runData.read('gender') ?? '';

  set gender(String gender) => _runData.write('gender', gender);

  String get residential_address => _runData.read('residential_address') ?? '';

  set residential_address(String residentialAddress) => _runData.write('residential_address', residentialAddress);

  String get postcode => _runData.read('postcode') ?? '';

  set postcode(String postcode) => _runData.write('postcode', postcode);

  String get address => _runData.read('address') ?? '';

  set address(String address) => _runData.write('address', address);

  String get state => _runData.read('state') ?? '';

  set state(String state) => _runData.write('state', state);

  String get zipcode => _runData.read('zipcode') ?? '';

  set zipcode(String zipcode) => _runData.write('zipcode', zipcode);

  String get firstName => _runData.read('firstName') ?? '';

  set firstName(String firstName) => _runData.write('firstName', firstName);

  String get lastName => _runData.read('lastName') ?? '';

  set lastName(String lastName) => _runData.write('lastName', lastName);

  String get emailOtpVerified => _runData.read('emailOtpVerified') ?? '';

  set emailOtpVerified(String emailOtpVerified) => _runData.write('emailOtpVerified', emailOtpVerified);

  String get phoneOtpVerified => _runData.read('phoneOtpVerified') ?? '';

  set phoneOtpVerified(String phoneOtpVerified) => _runData.write('phoneOtpVerified', phoneOtpVerified);

  String get abnNumber => _runData.read('abnNumber') ?? '';

  set abnNumber(String abnNumber) => _runData.write('abnNumber', abnNumber);

  bool get isValidHealthInsurance => _runData.read('isValidHealthInsurance') ?? false;

  set isValidHealthInsurance(bool isValidHealthInsurance) => _runData.write('isValidHealthInsurance', isValidHealthInsurance);

  bool get notiOnAppointment => _runData.read('notiOnAppointment') ?? false;

  set notiOnAppointment(bool notiOnAppointment) => _runData.write('notiOnAppointment', notiOnAppointment);

  bool get notiOnReminder => _runData.read('notiOnReminder') ?? false;

  set notiOnReminder(bool notiOnReminder) => _runData.write('notiOnReminder', notiOnReminder);

  bool get notiOnMedicalReport => _runData.read('notiOnMedicalReport') ?? false;

  set notiOnMedicalReport(bool notiOnMedicalReport) => _runData.write('notiOnMedicalReport', notiOnMedicalReport);

  bool get isVerifiedByAdmin => _runData.read('isVerifiedByAdmin') ?? false;

  set isVerifiedByAdmin(bool isVerifiedByAdmin) => _runData.write('isVerifiedByAdmin', isVerifiedByAdmin);

  String get efullName => _runData.read('efullName') ?? '';

  set efullName(String efullName) => _runData.write('efullName', efullName);

  String get ephone => _runData.read('ephone') ?? '';

  set ephone(String ephone) => _runData.write('ephone', ephone);

  String get ratingsAverage => _runData.read('ratingsAverage') ?? '';

  set ratingsAverage(String ratingsAverage) => _runData.write('ratingsAverage', ratingsAverage);

  String get ratingsQuantity => _runData.read('ratingsQuantity') ?? '';

  set ratingsQuantity(String ratingsQuantity) => _runData.write('ratingsQuantity', ratingsQuantity);

  String get vendorLevel => _runData.read('vendorLevel') ?? '';

  set vendorLevel(String vendorLevel) => _runData.write('vendorLevel', vendorLevel);

  String get sname => _runData.read('sname') ?? '';

  set sname(String sname) => _runData.write('sname', sname);

  String get serviceType => _runData.read('serviceType') ?? '';

  set serviceType(String serviceType) => _runData.write('serviceType', serviceType);

  String get serviceId => _runData.read('serviceId') ?? '';

  set serviceId(String serviceId) => _runData.write('serviceId', serviceId);

  String get homePrice => _runData.read('homePrice') ?? '';

  set homePrice(String homePrice) => _runData.write('homePrice', homePrice);

  String get experience => _runData.read('experience') ?? '';

  set experience(String experience) => _runData.write('experience', experience);

  String get duration => _runData.read('duration') ?? '';

  set duration(String duration) => _runData.write('duration', duration);

  String get onsitePrice => _runData.read('onsitePrice') ?? '';

  set onsitePrice(String onsitePrice) => _runData.write('onsitePrice', onsitePrice);

  String get location => _runData.read('location') ?? '';

  set location(String location) => _runData.write('location', location);

  String get location2 => _runData.read('location2') ?? '';

  set location2(String location2) => _runData.write('location2', location2);

  String get maximumBookingHour => _runData.read('maximumBookingHour') ?? '';

  set maximumBookingHour(String maximumBookingHour) => _runData.write('maximumBookingHour', maximumBookingHour);

  String get langCode => _runData.read('langCode') ?? 'fr';

  set langCode(String langCode) => _runData.write('langCode', langCode);

  String get langCodeV => _runData.read('langCodeV') ?? 'FR';

  set langCodeV(String langCodeV) => _runData.write('langCodeV', langCodeV);

  void intialiseIfNull() {
    _runData.writeIfNull('appOpenCount', 0);

    _runData.write('appOpenCount', _runData.read('appOpenCount') + 1); //incrment app open count
  }

  Future<void> logout() async {
    await _runData.erase();
  }
}
