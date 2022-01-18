import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomTimerPicker extends StatefulWidget {
  const CustomTimerPicker({Key? key,
    required this.onTimeChanged,
    required this.initialTime,
    required this.minimumTime,
    required this.maximumTime,
    required this.style,
    required this.size,
  }) : super(key: key);

  final int initialTime;
  final double size;
  final int minimumTime;
  final int maximumTime;
  final TextStyle style;
  final ValueChanged<int> onTimeChanged;

  @override
  State<StatefulWidget> createState() {
    return _CustomTimerPickerState();
  }
}

class _CustomTimerPickerState extends State<CustomTimerPicker> {
  late int selectedYear;

  late FixedExtentScrollController yearController;

  bool isYearPickerScrolling = false;

  bool get isScrolling => isYearPickerScrolling;

  @override
  void initState() {
    super.initState();
    selectedYear = widget.initialTime;

    yearController = FixedExtentScrollController(initialItem: selectedYear);
  }

  @override
  void dispose() {
    yearController.dispose();
    super.dispose();
  }

  Widget _buildPicker(double offAxisFraction,
      TransitionBuilder itemPositioningBuilder, Widget selectionOverlay) {


    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isYearPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isYearPickerScrolling = false;
          _pickerDidStopScrolling();
        }
        return false;
      },
      child: CupertinoPicker.builder(
        scrollController: yearController,
        itemExtent: 32,
        offAxisFraction: offAxisFraction,
        backgroundColor: Colors.transparent,
        onSelectedItemChanged: (int index) {
          selectedYear = index;
          widget.onTimeChanged(selectedYear);
        },
        itemBuilder: (BuildContext context, int time) {
          if (time < widget.minimumTime) return null;
          if (time > widget.maximumTime) return null;
          return itemPositioningBuilder(
            context,
            Text(
              time.toString(),
              style: widget.style,
            ),
          );
        },
        selectionOverlay: selectionOverlay,
      ),
    );
  }

  void _pickerDidStopScrolling() {
    setState(() {});
    if (isScrolling) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: CustomMultiChildLayout(
        delegate: _YearPickerLayoutDelegate(
          columnWidths: widget.size,
        ),
        children: [
          LayoutId(
            id: 0,
            child: _buildPicker(
              0,
                  (BuildContext context, Widget? child) {
                return Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: child,
                );
              },
              const CupertinoPickerDefaultSelectionOverlay(
                capLeftEdge: false,
                capRightEdge: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _YearPickerLayoutDelegate extends MultiChildLayoutDelegate {
  _YearPickerLayoutDelegate({
    required this.columnWidths,
  });

  final double columnWidths;

  @override
  void performLayout(Size size) {
    double remainingWidth = size.width;

    remainingWidth -= columnWidths + 24;

    double currentHorizontalOffset = 0.0;

    double childWidth = columnWidths + 24;

    childWidth += remainingWidth / 2;

    layoutChild(
      0,
      BoxConstraints.tight(
        Size(math.max(0.0, childWidth), size.height),
      ),
    );
    positionChild(
      0,
      Offset(currentHorizontalOffset, 0.0),
    );

    currentHorizontalOffset += childWidth;
  }

  @override
  bool shouldRelayout(_YearPickerLayoutDelegate oldDelegate) {
    return true;
  }
}
