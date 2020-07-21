// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login_title {
    return Intl.message(
      'Login',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_email_label {
    return Intl.message(
      'Email',
      name: 'login_email_label',
      desc: '',
      args: [],
    );
  }

  /// `example@example.com`
  String get login_email_hint {
    return Intl.message(
      'example@example.com',
      name: 'login_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `This email is invalid`
  String get login_email_error {
    return Intl.message(
      'This email is invalid',
      name: 'login_email_error',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_password_label {
    return Intl.message(
      'Password',
      name: 'login_password_label',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain at least eight characters`
  String get login_password_error {
    return Intl.message(
      'The password must contain at least eight characters',
      name: 'login_password_error',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get login_password_forgotten {
    return Intl.message(
      'Forgot password?',
      name: 'login_password_forgotten',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get login_register_button {
    return Intl.message(
      'Register',
      name: 'login_register_button',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_title {
    return Intl.message(
      'Register',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an acount?`
  String get register_go_login {
    return Intl.message(
      'Do you have an acount?',
      name: 'register_go_login',
      desc: '',
      args: [],
    );
  }

  /// `Products List`
  String get home_title {
    return Intl.message(
      'Products List',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get home_delete {
    return Intl.message(
      'Delete',
      name: 'home_delete',
      desc: '',
      args: [],
    );
  }

  /// `Add new product`
  String get home_add_product {
    return Intl.message(
      'Add new product',
      name: 'home_add_product',
      desc: '',
      args: [],
    );
  }

  /// `No products yet`
  String get product_list_no_content {
    return Intl.message(
      'No products yet',
      name: 'product_list_no_content',
      desc: '',
      args: [],
    );
  }

  /// `Product {name} deleted!`
  String product_delete_message(Object name) {
    return Intl.message(
      'Product $name deleted!',
      name: 'product_delete_message',
      desc: '',
      args: [name],
    );
  }

  /// `Create product`
  String get product_detail_title {
    return Intl.message(
      'Create product',
      name: 'product_detail_title',
      desc: '',
      args: [],
    );
  }

  /// `Product name`
  String get product_detail_name_label {
    return Intl.message(
      'Product name',
      name: 'product_detail_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Product value`
  String get product_detail_value_label {
    return Intl.message(
      'Product value',
      name: 'product_detail_value_label',
      desc: '',
      args: [],
    );
  }

  /// `is available?`
  String get product_detail_available {
    return Intl.message(
      'is available?',
      name: 'product_detail_available',
      desc: '',
      args: [],
    );
  }

  /// `Product added corretly`
  String get product_detail_added {
    return Intl.message(
      'Product added corretly',
      name: 'product_detail_added',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get product_detail_gallery {
    return Intl.message(
      'Gallery',
      name: 'product_detail_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get product_detail_camera {
    return Intl.message(
      'Camera',
      name: 'product_detail_camera',
      desc: '',
      args: [],
    );
  }

  /// `You must allow us to use the camera`
  String get product_detail_camera_error {
    return Intl.message(
      'You must allow us to use the camera',
      name: 'product_detail_camera_error',
      desc: '',
      args: [],
    );
  }

  /// `You must allow uss to use the gallery`
  String get product_detail_gallery_error {
    return Intl.message(
      'You must allow uss to use the gallery',
      name: 'product_detail_gallery_error',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get error_rety {
    return Intl.message(
      'Retry',
      name: 'error_rety',
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
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}