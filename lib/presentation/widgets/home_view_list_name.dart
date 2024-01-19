part of '../view/home_view.dart';

@immutable
final class _NormalMenuNameText extends StatefulWidget {
  const _NormalMenuNameText({required this.viewModel});

  final HomeViewViewModel viewModel;

  @override
  State<_NormalMenuNameText> createState() => __NormalMenuNameTextState();
}

class __NormalMenuNameTextState extends State<_NormalMenuNameText> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.viewModel.getNormalMenuName(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return ErrorWidgets.errorText;
          case ConnectionState.waiting:
            return LoadingWidgets.circularProgressIndicator;
          case ConnectionState.active:
            return LoadingWidgets.circularProgressIndicator;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _nameText(snapshot.data!);
            } else {
              return ErrorWidgets.errorText;
            }
        }
      },
    );
  }

  /// Name text widget
  Widget _nameText(String name) => Expanded(
        flex: 10,
        child: Padding(
          padding: context.symmetricPaddingMedium,
          child: FittedBox(
            child: Text(
              name,
              style: context.openSans.copyWith(
                color: AppColors.marmaraBlue,
                fontWeight: context.fontWeight300,
              ),
            ),
          ),
        ),
      );
}
