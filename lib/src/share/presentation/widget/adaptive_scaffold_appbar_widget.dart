import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/logout_widget.dart';

class AdaptiveScaffoldAppbarWidget extends ConsumerStatefulWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const AdaptiveScaffoldAppbarWidget({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdaptiveScaffoldAppbarWidgetState();
}

class _AdaptiveScaffoldAppbarWidgetState
    extends ConsumerState<AdaptiveScaffoldAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [
          LogoutWidget(),
        ],
      ),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
