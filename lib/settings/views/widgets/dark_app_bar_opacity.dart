import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/settings.dart';

class DarkAppBarOpacitySlider extends ConsumerWidget {
  const DarkAppBarOpacitySlider({super.key});
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final double opacity = ref.watch(Settings.darkAppBarOpacityProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: const Text('Dark AppBar opacity'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Slider.adaptive(
              min: 0,
              max: 100,
              divisions: 100,
              label: (opacity * 100.0).floor().toString(),
              value: opacity * 100.0,
              onChanged: (final double value) {
                ref
                    .read(Settings.darkAppBarOpacityProvider.notifier)
                    .set(value / 100);
              }),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '%',
              style: textTheme.bodySmall,
            ),
            Text(
              (opacity * 100).floor().toString(),
              style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
