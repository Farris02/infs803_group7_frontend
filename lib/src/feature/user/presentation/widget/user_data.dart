import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

class UserData extends ConsumerWidget {
  const UserData({
    super.key,
    required this.data,
  });

  final List<User> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(
            label: Expanded(
              child: Text(
                'ID',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Name',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Level',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Created At',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Updated At',
              ),
            ),
          ),
        ],
        rows: data
            .map(
              (e) => DataRow(
                cells: [
                  DataCell(
                    Text(e.id.toString()),
                  ),
                  DataCell(
                    Text(e.name),
                  ),
                  DataCell(
                    Text(e.level.toString()),
                  ),
                  DataCell(
                    Text(e.createdAt!.toString()),
                  ),
                  DataCell(
                    Text(e.updatedAt!.toString()),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
