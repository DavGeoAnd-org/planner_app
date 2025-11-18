import 'dart:convert';

class WeightRecord {
  String? id;
  DateTime? timestamp;
  double weight;
  WeightRecord({this.id, this.timestamp, required this.weight});

  WeightRecord copyWith({String? id, DateTime? timestamp, double? weight}) {
    return WeightRecord(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'timestamp': timestamp?.millisecondsSinceEpoch});
    result.addAll({'weight': weight});

    return result;
  }

  factory WeightRecord.fromMap(Map<String, dynamic> map) {
    return WeightRecord(
      id: map['id'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      weight: map['weight']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightRecord.fromJson(String source) =>
      WeightRecord.fromMap(json.decode(source));

  @override
  String toString() =>
      'WeightRecord(id: $id, timestamp: $timestamp, weight: $weight)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeightRecord &&
        other.id == id &&
        other.timestamp == timestamp &&
        other.weight == weight;
  }

  @override
  int get hashCode => id.hashCode ^ timestamp.hashCode ^ weight.hashCode;
}
