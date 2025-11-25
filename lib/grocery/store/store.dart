import 'dart:convert';

class Store {
  String? id;
  String name;
  Store({this.id, required this.name});

  Store copyWith({String? id, String? name}) {
    return Store(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});

    return result;
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(id: map['id'], name: map['name'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) => Store.fromMap(json.decode(source));

  @override
  String toString() => 'Store(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Store && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class StoreWithLocation {
  Store store;
  String location;
  StoreWithLocation({required this.store, required this.location});

  StoreWithLocation copyWith({Store? store, String? location}) {
    return StoreWithLocation(
      store: store ?? this.store,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'store': store.toMap()});
    result.addAll({'location': location});

    return result;
  }

  factory StoreWithLocation.fromMap(Map<String, dynamic> map) {
    return StoreWithLocation(
      store: Store.fromMap(map['store']),
      location: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreWithLocation.fromJson(String source) =>
      StoreWithLocation.fromMap(json.decode(source));

  @override
  String toString() => 'StoreWithLocation(store: $store, location: $location)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoreWithLocation &&
        other.store == store &&
        other.location == location;
  }

  @override
  int get hashCode => store.hashCode ^ location.hashCode;
}
