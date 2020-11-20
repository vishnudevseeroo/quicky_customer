import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineHorizontal extends StatelessWidget {
  const TimeLineHorizontal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Container(
            constraints: const BoxConstraints(maxHeight: 75),
            color: Colors.white,
            child: Row(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  isFirst: true,
                  indicatorStyle: const IndicatorStyle(
                    height: 20,
                    color: Colors.green,
                    indicatorXY: 0.2,
                    padding: EdgeInsets.all(0),
                  ),
                  endChild: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(buildTranslate(context, "bag")),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 120,
                    ),
                    color: Colors.white,
                  ),
                  afterLineStyle: const LineStyle(
                    color: Colors.green,
                    thickness: 6,
                  ),
                ),
                TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  isFirst: false,
                  indicatorStyle: const IndicatorStyle(
                    height: 20,
                    color: Colors.green,
                    indicatorXY: 0.2,
                    padding: EdgeInsets.all(0),
                  ),
                  endChild: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(buildTranslate(context, "address")),
                    ),
                    constraints: const BoxConstraints(minWidth: 120),
                    color: Colors.white,
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Colors.green,
                    thickness: 6,
                  ),
                ),
                TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  isLast: true,
                  indicatorStyle: const IndicatorStyle(
                    height: 20,
                    color: Colors.green,
                    indicatorXY: 0.2,
                  ),
                  endChild: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        buildTranslate(context, "payment"),
                      ),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 100,
                    ),
                    color: Colors.white,
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Colors.green,
                    thickness: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
