// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static m0(name) => "¡Producto ${name} eliminado!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "error_rety" : MessageLookupByLibrary.simpleMessage("Reintentar"),
    "home_add_product" : MessageLookupByLibrary.simpleMessage("Añadir nuevo producto"),
    "home_delete" : MessageLookupByLibrary.simpleMessage("Eliminar"),
    "home_title" : MessageLookupByLibrary.simpleMessage("Lista de Productos"),
    "login_email_error" : MessageLookupByLibrary.simpleMessage("Este email es invalido"),
    "login_email_hint" : MessageLookupByLibrary.simpleMessage("example@example.com"),
    "login_email_label" : MessageLookupByLibrary.simpleMessage("Email"),
    "login_password_error" : MessageLookupByLibrary.simpleMessage("La contraseña debe contener al menos ocho caracteres"),
    "login_password_label" : MessageLookupByLibrary.simpleMessage("Contraseña"),
    "login_register_button" : MessageLookupByLibrary.simpleMessage("Registro"),
    "login_title" : MessageLookupByLibrary.simpleMessage("Login"),
    "product_delete_message" : m0,
    "product_detail_added" : MessageLookupByLibrary.simpleMessage("Producto añadido correctamente"),
    "product_detail_available" : MessageLookupByLibrary.simpleMessage("¿Esta disponible?"),
    "product_detail_camera" : MessageLookupByLibrary.simpleMessage("Cámara"),
    "product_detail_camera_error" : MessageLookupByLibrary.simpleMessage("Debes otorgar permiso para usar la cámara"),
    "product_detail_gallery" : MessageLookupByLibrary.simpleMessage("Galeria"),
    "product_detail_gallery_error" : MessageLookupByLibrary.simpleMessage("Debes otorgar permiso para usar la galeria"),
    "product_detail_name_label" : MessageLookupByLibrary.simpleMessage("Nombre del producto"),
    "product_detail_title" : MessageLookupByLibrary.simpleMessage("Crear producto"),
    "product_detail_value_label" : MessageLookupByLibrary.simpleMessage("Precio del producto"),
    "product_list_no_content" : MessageLookupByLibrary.simpleMessage("No hay productos aun"),
    "register_go_login" : MessageLookupByLibrary.simpleMessage("¿Ya tienes cuenta?"),
    "register_title" : MessageLookupByLibrary.simpleMessage("Registro")
  };
}
