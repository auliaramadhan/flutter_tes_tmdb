import 'dart:convert';

List<T> jsonToList<T>(List<dynamic>? list, T Function(Map<String, dynamic> json) fromJson, {bool returnEmpty = true}) {
  try {
    if (list?.isEmpty ?? true) {
      throw Exception('List is empty');
    }
    final listfinal = List<T>.from(list!.map<T>((e) => fromJson(e)));
    return listfinal;
  } catch (e) {
    if (returnEmpty) {
      return [];
    } else {
      print("error when conver json to list ");
      throw e;
    }
  }
}

dynamic checkAndDecode(dynamic value) {
  try {
    if (value is String) {
      final result = json.decode(value);
      return (result );
    }
    return (value );
  } catch (e) {}
  return null;
}

T? checkIfNil<T>(dynamic value) {
  if (value is Map) {
    if ((value).containsKey('@nil')) {}
    return null;
  } else if (value is T) {
    return value;
  }
  return null;
}

// List<dynamic>? listToJson