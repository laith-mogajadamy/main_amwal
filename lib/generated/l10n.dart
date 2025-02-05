// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Network Error`
  String get networkerror {
    return Intl.message(
      'Network Error',
      name: 'networkerror',
      desc: '',
      args: [],
    );
  }

  /// `Timed Out`
  String get timedout {
    return Intl.message(
      'Timed Out',
      name: 'timedout',
      desc: '',
      args: [],
    );
  }

  /// `Change the language`
  String get Changethelanguage {
    return Intl.message(
      'Change the language',
      name: 'Changethelanguage',
      desc: '',
      args: [],
    );
  }

  /// `The language`
  String get language {
    return Intl.message(
      'The language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `loging out...`
  String get logingout {
    return Intl.message(
      'loging out...',
      name: 'logingout',
      desc: '',
      args: [],
    );
  }

  /// `Choose the language`
  String get Chooselanguage {
    return Intl.message(
      'Choose the language',
      name: 'Chooselanguage',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `user name`
  String get username {
    return Intl.message(
      'user name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username is too short`
  String get emailvalidate {
    return Intl.message(
      'Email or Username is too short',
      name: 'emailvalidate',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Re-type Password `
  String get RetypePassword {
    return Intl.message(
      'Re-type Password ',
      name: 'RetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordvalidate {
    return Intl.message(
      'Password is too short',
      name: 'passwordvalidate',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get LogInbotton {
    return Intl.message(
      'Log In',
      name: 'LogInbotton',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `chnage the company code`
  String get chnagecompcode {
    return Intl.message(
      'chnage the company code',
      name: 'chnagecompcode',
      desc: '',
      args: [],
    );
  }

  /// `start using the app`
  String get startusingtheapp {
    return Intl.message(
      'start using the app',
      name: 'startusingtheapp',
      desc: '',
      args: [],
    );
  }

  /// ` scan the QR code`
  String get turnonthecameraandscan {
    return Intl.message(
      ' scan the QR code',
      name: 'turnonthecameraandscan',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `fast access`
  String get fastaccess {
    return Intl.message(
      'fast access',
      name: 'fastaccess',
      desc: '',
      args: [],
    );
  }

  /// `customers`
  String get customers {
    return Intl.message(
      'customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `suppliers`
  String get suppliers {
    return Intl.message(
      'suppliers',
      name: 'suppliers',
      desc: '',
      args: [],
    );
  }

  /// `purchases`
  String get purchases {
    return Intl.message(
      'purchases',
      name: 'purchases',
      desc: '',
      args: [],
    );
  }

  /// `sales`
  String get sales {
    return Intl.message(
      'sales',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `warehouse`
  String get warehouse {
    return Intl.message(
      'warehouse',
      name: 'warehouse',
      desc: '',
      args: [],
    );
  }

  /// `general analysis`
  String get generalanalysis {
    return Intl.message(
      'general analysis',
      name: 'generalanalysis',
      desc: '',
      args: [],
    );
  }

  /// `human resources`
  String get humanresources {
    return Intl.message(
      'human resources',
      name: 'humanresources',
      desc: '',
      args: [],
    );
  }

  /// `funds and banks`
  String get fundsandbanks {
    return Intl.message(
      'funds and banks',
      name: 'fundsandbanks',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Sales Debt Limit`
  String get salesDebtLimit {
    return Intl.message(
      'Sales Debt Limit',
      name: 'salesDebtLimit',
      desc: '',
      args: [],
    );
  }

  /// `Current Balance`
  String get currentBalance {
    return Intl.message(
      'Current Balance',
      name: 'currentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `show details`
  String get showdetails {
    return Intl.message(
      'show details',
      name: 'showdetails',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `advanced search`
  String get advancedsearch {
    return Intl.message(
      'advanced search',
      name: 'advancedsearch',
      desc: '',
      args: [],
    );
  }

  /// `currency`
  String get currency {
    return Intl.message(
      'currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `bransh`
  String get bransh {
    return Intl.message(
      'bransh',
      name: 'bransh',
      desc: '',
      args: [],
    );
  }

  /// `agent`
  String get agent {
    return Intl.message(
      'agent',
      name: 'agent',
      desc: '',
      args: [],
    );
  }

  /// `acount tybe`
  String get acounttybe {
    return Intl.message(
      'acount tybe',
      name: 'acounttybe',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `account statment`
  String get acountstatment {
    return Intl.message(
      'account statment',
      name: 'acountstatment',
      desc: '',
      args: [],
    );
  }

  /// `agent card`
  String get agentcard {
    return Intl.message(
      'agent card',
      name: 'agentcard',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Detailed`
  String get detailed {
    return Intl.message(
      'Detailed',
      name: 'detailed',
      desc: '',
      args: [],
    );
  }

  /// `no date`
  String get nodate {
    return Intl.message(
      'no date',
      name: 'nodate',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `show`
  String get show {
    return Intl.message(
      'show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `openning balance`
  String get openningbalance {
    return Intl.message(
      'openning balance',
      name: 'openningbalance',
      desc: '',
      args: [],
    );
  }

  /// `document`
  String get document {
    return Intl.message(
      'document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `date`
  String get date {
    return Intl.message(
      'date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `debtor`
  String get debtor {
    return Intl.message(
      'debtor',
      name: 'debtor',
      desc: '',
      args: [],
    );
  }

  /// `creditor`
  String get creditor {
    return Intl.message(
      'creditor',
      name: 'creditor',
      desc: '',
      args: [],
    );
  }

  /// `sum`
  String get sum {
    return Intl.message(
      'sum',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `balance`
  String get balance {
    return Intl.message(
      'balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `sales returns`
  String get salesreturns {
    return Intl.message(
      'sales returns',
      name: 'salesreturns',
      desc: '',
      args: [],
    );
  }

  /// `purchases returns`
  String get purchasesreturns {
    return Intl.message(
      'purchases returns',
      name: 'purchasesreturns',
      desc: '',
      args: [],
    );
  }

  /// `payments`
  String get payments {
    return Intl.message(
      'payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `receipts`
  String get receipts {
    return Intl.message(
      'receipts',
      name: 'receipts',
      desc: '',
      args: [],
    );
  }

  /// `debit entries`
  String get debitentries {
    return Intl.message(
      'debit entries',
      name: 'debitentries',
      desc: '',
      args: [],
    );
  }

  /// `credit entries`
  String get creditentries {
    return Intl.message(
      'credit entries',
      name: 'creditentries',
      desc: '',
      args: [],
    );
  }

  /// `clear all`
  String get clearall {
    return Intl.message(
      'clear all',
      name: 'clearall',
      desc: '',
      args: [],
    );
  }

  /// `The limit of debt in a sale`
  String get thelimitofdebtinasale {
    return Intl.message(
      'The limit of debt in a sale',
      name: 'thelimitofdebtinasale',
      desc: '',
      args: [],
    );
  }

  /// `The limit of debt in a buy`
  String get thelimitofdebtinabuy {
    return Intl.message(
      'The limit of debt in a buy',
      name: 'thelimitofdebtinabuy',
      desc: '',
      args: [],
    );
  }

  /// `cycle day`
  String get cycleday {
    return Intl.message(
      'cycle day',
      name: 'cycleday',
      desc: '',
      args: [],
    );
  }

  /// `sale category name`
  String get salecategoryname {
    return Intl.message(
      'sale category name',
      name: 'salecategoryname',
      desc: '',
      args: [],
    );
  }

  /// `work phone`
  String get workphone {
    return Intl.message(
      'work phone',
      name: 'workphone',
      desc: '',
      args: [],
    );
  }

  /// `mobile number`
  String get mobilenumber {
    return Intl.message(
      'mobile number',
      name: 'mobilenumber',
      desc: '',
      args: [],
    );
  }

  /// `notes`
  String get notes {
    return Intl.message(
      'notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get stateDate {
    return Intl.message(
      'State',
      name: 'stateDate',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message(
      'price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `quantity`
  String get quantity {
    return Intl.message(
      'quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `k`
  String get k {
    return Intl.message(
      'k',
      name: 'k',
      desc: '',
      args: [],
    );
  }

  /// `please select a valide date range`
  String get unvalidedate {
    return Intl.message(
      'please select a valide date range',
      name: 'unvalidedate',
      desc: '',
      args: [],
    );
  }

  /// `boxs and banks`
  String get boxsandbanks {
    return Intl.message(
      'boxs and banks',
      name: 'boxsandbanks',
      desc: '',
      args: [],
    );
  }

  /// `all`
  String get all {
    return Intl.message(
      'all',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `delayed`
  String get delayed {
    return Intl.message(
      'delayed',
      name: 'delayed',
      desc: '',
      args: [],
    );
  }

  /// `cash`
  String get cash {
    return Intl.message(
      'cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Movement type`
  String get movementtype {
    return Intl.message(
      'Movement type',
      name: 'movementtype',
      desc: '',
      args: [],
    );
  }

  /// `Invoice type`
  String get invoicetype {
    return Intl.message(
      'Invoice type',
      name: 'invoicetype',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentmethod {
    return Intl.message(
      'Payment method',
      name: 'paymentmethod',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get stores {
    return Intl.message(
      'Stores',
      name: 'stores',
      desc: '',
      args: [],
    );
  }

  /// `Transportation company`
  String get transportationcompany {
    return Intl.message(
      'Transportation company',
      name: 'transportationcompany',
      desc: '',
      args: [],
    );
  }

  /// `due date`
  String get duedate {
    return Intl.message(
      'due date',
      name: 'duedate',
      desc: '',
      args: [],
    );
  }

  /// `project`
  String get project {
    return Intl.message(
      'project',
      name: 'project',
      desc: '',
      args: [],
    );
  }

  /// `the amount`
  String get theamount {
    return Intl.message(
      'the amount',
      name: 'theamount',
      desc: '',
      args: [],
    );
  }

  /// `raw m store`
  String get rawmstore {
    return Intl.message(
      'raw m store',
      name: 'rawmstore',
      desc: '',
      args: [],
    );
  }

  /// `result m store`
  String get resultmstore {
    return Intl.message(
      'result m store',
      name: 'resultmstore',
      desc: '',
      args: [],
    );
  }

  /// `item`
  String get item {
    return Intl.message(
      'item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `search for item`
  String get searchforitem {
    return Intl.message(
      'search for item',
      name: 'searchforitem',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `result count`
  String get resultcount {
    return Intl.message(
      'result count',
      name: 'resultcount',
      desc: '',
      args: [],
    );
  }

  /// `cost`
  String get cost {
    return Intl.message(
      'cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `cost rate`
  String get costRate {
    return Intl.message(
      'cost rate',
      name: 'costRate',
      desc: '',
      args: [],
    );
  }

  /// `batch number`
  String get batchnumber {
    return Intl.message(
      'batch number',
      name: 'batchnumber',
      desc: '',
      args: [],
    );
  }

  /// `expiry date`
  String get expirydate {
    return Intl.message(
      'expiry date',
      name: 'expirydate',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
