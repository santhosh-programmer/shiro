import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:shiro/models/serializers.dart';

part 'appstate.g.dart';

abstract class Appstate implements Built<Appstate, AppstateBuilder> {
  Appstate._();
  factory Appstate([void Function(AppstateBuilder) updates]) = _$Appstate;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Appstate.serializer, this)
        as Map<String, dynamic>;
  }

  static Appstate fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Appstate.serializer, json)!;
  }

  static Serializer<Appstate> get serializer => _$appstateSerializer;
}
