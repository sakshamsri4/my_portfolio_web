import 'package:flutter/material.dart';

/// A widget that creates an infinitely scrollable horizontal row of widgets
class InfiniteScrollRow extends StatefulWidget {
  /// Creates an infinitely scrollable row
  const InfiniteScrollRow({
    required this.itemCount,
    required this.itemBuilder,
    super.key,
    this.itemSpacing = 16.0,
    this.scrollController,
    this.physics,
    this.padding,
    this.alignment = CrossAxisAlignment.start,
  });

  /// Number of unique items
  final int itemCount;

  /// Builder for each item
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Spacing between items
  final double itemSpacing;

  /// Optional scroll controller
  final ScrollController? scrollController;

  /// Optional scroll physics
  final ScrollPhysics? physics;

  /// Optional padding
  final EdgeInsetsGeometry? padding;

  /// Alignment of items in the row
  final CrossAxisAlignment alignment;

  @override
  State<InfiniteScrollRow> createState() => _InfiniteScrollRowState();
}

class _InfiniteScrollRowState extends State<InfiniteScrollRow> {
  late final ScrollController _scrollController;
  final int _multiplier = 3; // Number of times to repeat items

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();

    // Add listener to create infinite scroll effect
    _scrollController.addListener(_scrollListener);

    // Initial scroll position in the middle to allow scrolling both ways
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        final middlePosition = _scrollController.position.maxScrollExtent / 2;
        _scrollController.jumpTo(middlePosition);
      }
    });
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      // If we reach near the end, jump back to 1/3 of the way
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent * 0.8) {
        _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent * 0.3);
      }

      // If we reach near the start, jump to 2/3 of the way
      if (_scrollController.position.pixels <
          _scrollController.position.maxScrollExtent * 0.2) {
        _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent * 0.7);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: widget.physics ?? const BouncingScrollPhysics(),
      padding: widget.padding,
      child: Row(
        crossAxisAlignment: widget.alignment,
        children: List.generate(_multiplier * widget.itemCount, (index) {
          final actualIndex = index % widget.itemCount;
          return Padding(
            padding: EdgeInsets.only(right: widget.itemSpacing),
            child: widget.itemBuilder(context, actualIndex),
          );
        }),
      ),
    );
  }
}
