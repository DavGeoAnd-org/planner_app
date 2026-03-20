import 'package:dart_mappable/dart_mappable.dart';

part 'weight_record.mapper.dart';

@MappableClass()
class WeightRecord with WeightRecordMappable {
  String? id;
  double weight;

  WeightRecord({this.id, required this.weight});

  String weightJson() {
    return "{\"weight\": $weight }";
  }
}
