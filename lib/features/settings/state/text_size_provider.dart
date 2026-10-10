import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'text_size_provider.g.dart';

const textSizePreferenceKey = 'text_size';

/// In-app text size, applied on top of the device text scale.
enum TextSize {
  small(0.9),
  normal(1.0),
  large(1.15),
  larger(1.3);

  const TextSize(this.factor);

  final double factor;
}

class TextSizeStore {
  TextSizeStore(this._preferences);

  final SharedPreferencesAsync _preferences;

  Future<TextSize> load() async {
    final value = await _preferences.getString(textSizePreferenceKey);
    return TextSize.values.firstWhere(
      (size) => size.name == value,
      orElse: () => TextSize.normal,
    );
  }

  Future<void> save(TextSize size) {
    return _preferences.setString(textSizePreferenceKey, size.name);
  }
}

@Riverpod(keepAlive: true)
TextSizeStore textSizeStore(Ref ref) => TextSizeStore(SharedPreferencesAsync());

@Riverpod(keepAlive: true)
TextSize initialTextSize(Ref ref) => TextSize.normal;

@Riverpod(keepAlive: true)
class TextSizeController extends _$TextSizeController {
  @override
  TextSize build() => ref.read(initialTextSizeProvider);

  Future<void> setSize(TextSize size) async {
    if (state == size) return;

    await ref.read(textSizeStoreProvider).save(size);
    state = size;
  }
}
