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

T? checkAndDecode<T>(dynamic value) {
  if (value is T) {
    return value!;
  } else if (value is String) {
    return json.decode(value) as T;
  }
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