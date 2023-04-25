import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _a1 = prefs.getString('ff_a1') ?? _a1;
    _gender = prefs.getString('ff_gender') ?? _gender;
    _imageboy = prefs.getString('ff_imageboy') ?? _imageboy;
    _imagegirl = prefs.getString('ff_imagegirl') ?? _imagegirl;
    _avatar = prefs.getString('ff_avatar') ?? _avatar;
    _timepicker = prefs.containsKey('ff_timepicker')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_timepicker')!)
        : _timepicker;
    _name = prefs.getString('ff_name') ?? _name;
    _urgenname = prefs.getString('ff_urgenname') ?? _urgenname;
    _nickname = prefs.getString('ff_nickname') ?? _nickname;
    _phone = prefs.getString('ff_phone') ?? _phone;
    _nickphone = prefs.getString('ff_nickphone') ?? _nickphone;
    _urgername = prefs.getString('ff_urgername') ?? _urgername;
    _diagnosis = prefs.getString('ff_diagnosis') ?? _diagnosis;
    _affectedside = prefs.getString('ff_affectedside') ?? _affectedside;
    _accountnumber = prefs.getString('ff_accountnumber') ?? _accountnumber;
    _trainup = prefs.getString('ff_trainup') ?? _trainup;
    _traindown = prefs.getString('ff_traindown') ?? _traindown;
    _mouth = prefs.getString('ff_mouth') ?? _mouth;
    _password = prefs.getString('ff_password') ?? _password;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _a1 = '';
  String get a1 => _a1;
  set a1(String _value) {
    _a1 = _value;
    prefs.setString('ff_a1', _value);
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String _value) {
    _gender = _value;
    prefs.setString('ff_gender', _value);
  }

  String _imageboy =
      'https://www.creativefabrica.com/wp-content/uploads/users/2019/08/avatar_393721.jpg';
  String get imageboy => _imageboy;
  set imageboy(String _value) {
    _imageboy = _value;
    prefs.setString('ff_imageboy', _value);
  }

  String _imagegirl =
      'https://moytaganskiy.ru/imgs/org/962/15962/narkologicheskaya-klinika-reabilitaciya-plyus_6.webp';
  String get imagegirl => _imagegirl;
  set imagegirl(String _value) {
    _imagegirl = _value;
    prefs.setString('ff_imagegirl', _value);
  }

  String _avatar =
      'https://www.creativefabrica.com/wp-content/uploads/users/2019/08/avatar_393721.jpg';
  String get avatar => _avatar;
  set avatar(String _value) {
    _avatar = _value;
    prefs.setString('ff_avatar', _value);
  }

  DateTime? _timepicker;
  DateTime? get timepicker => _timepicker;
  set timepicker(DateTime? _value) {
    _timepicker = _value;
    _value != null
        ? prefs.setInt('ff_timepicker', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_timepicker');
  }

  String _name = '';
  String get name => _name;
  set name(String _value) {
    _name = _value;
    prefs.setString('ff_name', _value);
  }

  String _urgenname = '';
  String get urgenname => _urgenname;
  set urgenname(String _value) {
    _urgenname = _value;
    prefs.setString('ff_urgenname', _value);
  }

  String _nickname = '';
  String get nickname => _nickname;
  set nickname(String _value) {
    _nickname = _value;
    prefs.setString('ff_nickname', _value);
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String _value) {
    _phone = _value;
    prefs.setString('ff_phone', _value);
  }

  String _nickphone = '';
  String get nickphone => _nickphone;
  set nickphone(String _value) {
    _nickphone = _value;
    prefs.setString('ff_nickphone', _value);
  }

  String _urgername = '';
  String get urgername => _urgername;
  set urgername(String _value) {
    _urgername = _value;
    prefs.setString('ff_urgername', _value);
  }

  String _diagnosis = '';
  String get diagnosis => _diagnosis;
  set diagnosis(String _value) {
    _diagnosis = _value;
    prefs.setString('ff_diagnosis', _value);
  }

  String _affectedside = '';
  String get affectedside => _affectedside;
  set affectedside(String _value) {
    _affectedside = _value;
    prefs.setString('ff_affectedside', _value);
  }

  String _accountnumber = '';
  String get accountnumber => _accountnumber;
  set accountnumber(String _value) {
    _accountnumber = _value;
    prefs.setString('ff_accountnumber', _value);
  }

  String _trainup = '';
  String get trainup => _trainup;
  set trainup(String _value) {
    _trainup = _value;
    prefs.setString('ff_trainup', _value);
  }

  String _traindown = '';
  String get traindown => _traindown;
  set traindown(String _value) {
    _traindown = _value;
    prefs.setString('ff_traindown', _value);
  }

  String _mouth = '';
  String get mouth => _mouth;
  set mouth(String _value) {
    _mouth = _value;
    prefs.setString('ff_mouth', _value);
  }

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
    prefs.setString('ff_password', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
