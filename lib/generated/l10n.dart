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

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Up Date`
  String get update {
    return Intl.message(
      'Up Date',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Check For Update`
  String get checkforupdate {
    return Intl.message(
      'Check For Update',
      name: 'checkforupdate',
      desc: '',
      args: [],
    );
  }

  /// `There Is An Update`
  String get thereisanupdate {
    return Intl.message(
      'There Is An Update',
      name: 'thereisanupdate',
      desc: '',
      args: [],
    );
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

  /// `Change The Language`
  String get Changethelanguage {
    return Intl.message(
      'Change The Language',
      name: 'Changethelanguage',
      desc: '',
      args: [],
    );
  }

  /// `The Language`
  String get language {
    return Intl.message(
      'The Language',
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

  /// `Loging Out...`
  String get logingout {
    return Intl.message(
      'Loging Out...',
      name: 'logingout',
      desc: '',
      args: [],
    );
  }

  /// `Choose The Language`
  String get Chooselanguage {
    return Intl.message(
      'Choose The Language',
      name: 'Chooselanguage',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get username {
    return Intl.message(
      'User Name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email Or Username Is Too Short`
  String get emailvalidate {
    return Intl.message(
      'Email Or Username Is Too Short',
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

  /// `Re-Type Password `
  String get RetypePassword {
    return Intl.message(
      'Re-Type Password ',
      name: 'RetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Is Too Short`
  String get passwordvalidate {
    return Intl.message(
      'Password Is Too Short',
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

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Chnage The Company Code`
  String get chnagecompcode {
    return Intl.message(
      'Chnage The Company Code',
      name: 'chnagecompcode',
      desc: '',
      args: [],
    );
  }

  /// `Start Using The App`
  String get startusingtheapp {
    return Intl.message(
      'Start Using The App',
      name: 'startusingtheapp',
      desc: '',
      args: [],
    );
  }

  /// `Scan The QR Code`
  String get turnonthecameraandscan {
    return Intl.message(
      'Scan The QR Code',
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

  /// `Fast Access`
  String get fastaccess {
    return Intl.message(
      'Fast Access',
      name: 'fastaccess',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get customers {
    return Intl.message(
      'Customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `Suppliers`
  String get suppliers {
    return Intl.message(
      'Suppliers',
      name: 'suppliers',
      desc: '',
      args: [],
    );
  }

  /// `Purchases`
  String get purchases {
    return Intl.message(
      'Purchases',
      name: 'purchases',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get sales {
    return Intl.message(
      'Sales',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get warehouse {
    return Intl.message(
      'Stores',
      name: 'warehouse',
      desc: '',
      args: [],
    );
  }

  /// `General Analysis`
  String get generalanalysis {
    return Intl.message(
      'General Analysis',
      name: 'generalanalysis',
      desc: '',
      args: [],
    );
  }

  /// `Human Resources`
  String get humanresources {
    return Intl.message(
      'Human Resources',
      name: 'humanresources',
      desc: '',
      args: [],
    );
  }

  /// `Funds And Banks`
  String get fundsandbanks {
    return Intl.message(
      'Funds And Banks',
      name: 'fundsandbanks',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Debt Limit`
  String get salesDebtLimit {
    return Intl.message(
      'Debt Limit',
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

  /// `Show Details`
  String get showdetails {
    return Intl.message(
      'Show Details',
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

  /// `Advanced`
  String get advancedsearch {
    return Intl.message(
      'Advanced',
      name: 'advancedsearch',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Bransh`
  String get bransh {
    return Intl.message(
      'Bransh',
      name: 'bransh',
      desc: '',
      args: [],
    );
  }

  /// `Agent`
  String get agent {
    return Intl.message(
      'Agent',
      name: 'agent',
      desc: '',
      args: [],
    );
  }

  /// `Acount Tybe`
  String get acounttybe {
    return Intl.message(
      'Acount Tybe',
      name: 'acounttybe',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Account Statment`
  String get acountstatment {
    return Intl.message(
      'Account Statment',
      name: 'acountstatment',
      desc: '',
      args: [],
    );
  }

  /// `Agent Card`
  String get agentcard {
    return Intl.message(
      'Agent Card',
      name: 'agentcard',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
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

  /// `No Date`
  String get nodate {
    return Intl.message(
      'No Date',
      name: 'nodate',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Openning Balance`
  String get openningbalance {
    return Intl.message(
      'Openning Balance',
      name: 'openningbalance',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get document {
    return Intl.message(
      'Document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Debtor`
  String get debtor {
    return Intl.message(
      'Debtor',
      name: 'debtor',
      desc: '',
      args: [],
    );
  }

  /// `Creditor`
  String get creditor {
    return Intl.message(
      'Creditor',
      name: 'creditor',
      desc: '',
      args: [],
    );
  }

  /// `Sum`
  String get sum {
    return Intl.message(
      'Sum',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Sales Returns`
  String get salesreturns {
    return Intl.message(
      'Sales Returns',
      name: 'salesreturns',
      desc: '',
      args: [],
    );
  }

  /// `Purchases Returns`
  String get purchasesreturns {
    return Intl.message(
      'Purchases Returns',
      name: 'purchasesreturns',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Receipts`
  String get receipts {
    return Intl.message(
      'Receipts',
      name: 'receipts',
      desc: '',
      args: [],
    );
  }

  /// `Debit Entries`
  String get debitentries {
    return Intl.message(
      'Debit Entries',
      name: 'debitentries',
      desc: '',
      args: [],
    );
  }

  /// `Credit Entries`
  String get creditentries {
    return Intl.message(
      'Credit Entries',
      name: 'creditentries',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clearall {
    return Intl.message(
      'Clear All',
      name: 'clearall',
      desc: '',
      args: [],
    );
  }

  /// `The Limit Of Debt In A Sale`
  String get thelimitofdebtinasale {
    return Intl.message(
      'The Limit Of Debt In A Sale',
      name: 'thelimitofdebtinasale',
      desc: '',
      args: [],
    );
  }

  /// `The Limit Of Debt In A Buy`
  String get thelimitofdebtinabuy {
    return Intl.message(
      'The Limit Of Debt In A Buy',
      name: 'thelimitofdebtinabuy',
      desc: '',
      args: [],
    );
  }

  /// `Cycle Day`
  String get cycleday {
    return Intl.message(
      'Cycle Day',
      name: 'cycleday',
      desc: '',
      args: [],
    );
  }

  /// `Sale Category Name`
  String get salecategoryname {
    return Intl.message(
      'Sale Category Name',
      name: 'salecategoryname',
      desc: '',
      args: [],
    );
  }

  /// `Work Phone`
  String get workphone {
    return Intl.message(
      'Work Phone',
      name: 'workphone',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobilenumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobilenumber',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
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

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `K`
  String get k {
    return Intl.message(
      'K',
      name: 'k',
      desc: '',
      args: [],
    );
  }

  /// `Please Select A Valide Date Range`
  String get unvalidedate {
    return Intl.message(
      'Please Select A Valide Date Range',
      name: 'unvalidedate',
      desc: '',
      args: [],
    );
  }

  /// `Boxs And Banks`
  String get boxsandbanks {
    return Intl.message(
      'Boxs And Banks',
      name: 'boxsandbanks',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Delayed`
  String get delayed {
    return Intl.message(
      'Delayed',
      name: 'delayed',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Movement Type`
  String get movementtype {
    return Intl.message(
      'Movement Type',
      name: 'movementtype',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Type`
  String get invoicetype {
    return Intl.message(
      'Invoice Type',
      name: 'invoicetype',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentmethod {
    return Intl.message(
      'Payment Method',
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

  /// `Transportation Company`
  String get transportationcompany {
    return Intl.message(
      'Transportation Company',
      name: 'transportationcompany',
      desc: '',
      args: [],
    );
  }

  /// `Due Date`
  String get duedate {
    return Intl.message(
      'Due Date',
      name: 'duedate',
      desc: '',
      args: [],
    );
  }

  /// `Project`
  String get project {
    return Intl.message(
      'Project',
      name: 'project',
      desc: '',
      args: [],
    );
  }

  /// `The Amount`
  String get theamount {
    return Intl.message(
      'The Amount',
      name: 'theamount',
      desc: '',
      args: [],
    );
  }

  /// `Raw M Store`
  String get rawmstore {
    return Intl.message(
      'Raw M Store',
      name: 'rawmstore',
      desc: '',
      args: [],
    );
  }

  /// `Result M Store`
  String get resultmstore {
    return Intl.message(
      'Result M Store',
      name: 'resultmstore',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message(
      'Item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Search For Item`
  String get searchforitem {
    return Intl.message(
      'Search For Item',
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

  /// `Result Count`
  String get resultcount {
    return Intl.message(
      'Result Count',
      name: 'resultcount',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get costRate {
    return Intl.message(
      'Rate',
      name: 'costRate',
      desc: '',
      args: [],
    );
  }

  /// `Batch`
  String get batchnumber {
    return Intl.message(
      'Batch',
      name: 'batchnumber',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expirydate {
    return Intl.message(
      'Expiry Date',
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
