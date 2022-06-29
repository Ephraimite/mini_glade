import 'package:flutter/material.dart';
import 'package:mini_glade/components/loader.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:provider/provider.dart';

import 'base_view_model/base_vm.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({Key? key, required this.vmBuilder, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: vmBuilder(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(
          BuildContext context, T viewModel, Widget? child) =>
      !viewModel.isInitialized && viewModel.isLoading == true
          ? Container(
              color: lightGrey,
              child: Center(child: Loader()))
          : Stack(
              children: [
                builder(context, viewModel),
                Visibility(
                  visible: viewModel.isLoading,
                  child: Center(
                    child: Center(child: Loader()),
                  ),
                )
              ],
            );
}
