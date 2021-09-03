import 'package:flutter/material.dart';
import 'package:theme_demo/utils/app_const.dart';

/// A wrapper for a page body.
///
/// It provides the following features to the content of the page:
/// - Adds a scrollbar
/// - Adds the capability to un-focus a control like a TextFiled by clicking on
///   the background.
/// - Center the content and limit the content width when a given width
///   constraint value is exceeded, in this case an app level max width constant.
class PageBody extends StatelessWidget {
  const PageBody({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GestureDetector(
        // This allows us to un-focus a widget, typically a TextField with focus
        // by tapping somewhere outside it.
        onTap: () => FocusScope.of(context).unfocus(),
        // The Center plus ConstrainedBox is a neat way of making a layout that
        // will never be wider than the width constraint, when available
        // width gets wider than the constraint, the body never gets any
        // wider and the content remains in a centered column. This is also a
        // common web page layout, used in order to never make the content so
        // wide that it becomes difficult to read on really large screens.
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppConst.maxBodyWidth),
            // The scrollbars are added above manually to keep them at the
            // edge of the screen and not being around the centered content.
            // Therefore we have to remove the ones that show up by default
            // on ListView in Web and Desktop builds. Here we can do it
            // for all content in the body.
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
