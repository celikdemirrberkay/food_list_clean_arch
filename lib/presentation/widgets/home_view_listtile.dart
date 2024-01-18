part of '../view/home_view.dart';

@immutable
final class _HomeViewListTile extends StatefulWidget {
  const _HomeViewListTile({required this.title});

  final String title;

  @override
  State<_HomeViewListTile> createState() => _MainViewListTileState();
}

class _MainViewListTileState extends State<_HomeViewListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //TODO: Must  be part part of
      title: Text(
        widget.title,
        style: context.openSans.copyWith(
          fontWeight: context.fontWeightBold,
        ),
      ),
    );
  }
}
