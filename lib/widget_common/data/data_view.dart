import 'package:flutter/material.dart';
import 'package:total/http/refresh_view.dart';
import 'package:total/util/tools.dart';

class DataView extends StatelessWidget {
  final bool isLoadingOk;
  final List data;
  final String label;
  final Widget child;
  final Widget noDataView;
  final OnRefreshCallback onRefresh;
  final OnLoadCallback onLoad;

  DataView({
    @required this.isLoadingOk,
    @required this.data,
    @required this.child,
    this.onRefresh,
    this.onLoad,
    this.label = '暂无数据',
    this.noDataView,
  });

  Widget get childBuild {
    if (!isLoadingOk) {
      return new LoadingView();
    } else if (!listNoEmpty(data)) {
      if (noDataView != null) return noDataView;
      return new NoDataView(label: label, onRefresh: onRefresh);
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (onRefresh != null || onLoad != null) {
      return new RefreshView(
        child: childBuild,
        footer: ClassicalFooter(extent: 0, float: true),
        header: MaterialHeader(),
        onRefresh: onRefresh,
        onLoad: onLoad,
      );
    } else {
      return childBuild;
    }
  }
}
