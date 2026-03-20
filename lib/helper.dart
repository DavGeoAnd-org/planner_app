class RecordId {
  String stringValueFromId(String id) {
    return id.substring(id.indexOf(":") + 1);
  }

  static int intValueFromId(String id) {
    return int.parse(id.substring(id.indexOf(":") + 1));
  }
}

