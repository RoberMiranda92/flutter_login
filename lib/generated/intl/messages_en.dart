// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(name) => "Product ${name} deleted!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "error_rety" : MessageLookupByLibrary.simpleMessage("Retry"),
    "home_add_product" : MessageLookupByLibrary.simpleMessage("Add new product"),
    "home_delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "home_title" : MessageLookupByLibrary.simpleMessage("Products List"),
    "login_email_error" : MessageLookupByLibrary.simpleMessage("This email is invalid"),
    "login_email_hint" : MessageLookupByLibrary.simpleMessage("example@example.com"),
    "login_email_label" : MessageLookupByLibrary.simpleMessage("Email"),
    "login_password_error" : MessageLookupByLibrary.simpleMessage("The password must contain at least eight characters"),
    "login_password_forgotten" : MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "login_password_label" : MessageLookupByLibrary.simpleMessage("Password"),
    "login_register_button" : MessageLookupByLibrary.simpleMessage("Register"),
    "login_title" : MessageLookupByLibrary.simpleMessage("Login"),
    "product_delete_message" : m0,
    "product_detail_added" : MessageLookupByLibrary.simpleMessage("Product added corretly"),
    "product_detail_available" : MessageLookupByLibrary.simpleMessage("is available?"),
    "product_detail_camera" : MessageLookupByLibrary.simpleMessage("Camera"),
    "product_detail_camera_error" : MessageLookupByLibrary.simpleMessage("You must allow us to use the camera"),
    "product_detail_gallery" : MessageLookupByLibrary.simpleMessage("Gallery"),
    "product_detail_gallery_error" : MessageLookupByLibrary.simpleMessage("You must allow uss to use the gallery"),
    "product_detail_name_label" : MessageLookupByLibrary.simpleMessage("Product name"),
    "product_detail_title" : MessageLookupByLibrary.simpleMessage("Create product"),
    "product_detail_value_label" : MessageLookupByLibrary.simpleMessage("Product value"),
    "product_list_no_content" : MessageLookupByLibrary.simpleMessage("No products yet"),
    "register_go_login" : MessageLookupByLibrary.simpleMessage("Do you have an acount?"),
    "register_title" : MessageLookupByLibrary.simpleMessage("Register")
  };
}
