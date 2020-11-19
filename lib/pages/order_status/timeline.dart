// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class ScreenProgress extends StatefulWidget {
//   final int ticks;

//   ScreenProgress({@required this.ticks});

//   @override
//   _ScreenProgressState createState() => _ScreenProgressState();
// }

// class _ScreenProgressState extends State<ScreenProgress> {
//   Example example;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFF004E92),
//             Color(0xFF000428),
//           ],
//         ),
//       ),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "iiii",
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 32,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Expanded(
//                     child: CustomScrollView(
//                       slivers: <Widget>[
//                         SliverList(
//                           delegate: SliverChildListDelegate(
//                             <Widget>[
//                               _Description(
//                                 description: "8888",
//                                 code: "878777",
//                               ),
//                               const SizedBox(height: 16),
//                               const Text(
//                                 'Vertical Axis:',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 24),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SliverPadding(padding: EdgeInsets.only(top: 20)),
//                         Example1Vertical(),
//                         const SliverPadding(padding: EdgeInsets.only(top: 20)),
//                         SliverList(
//                           delegate: SliverChildListDelegate(
//                             <Widget>[
//                               const Text(
//                                 'Horizontal Axis:',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 24),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SliverPadding(padding: EdgeInsets.only(top: 20)),
//                         Example1Horizontal(),
//                         const SliverPadding(padding: EdgeInsets.only(top: 40)),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget tick(bool isChecked) {
//     return isChecked
//         ? Icon(
//             Icons.check_circle,
//             color: Colors.blue,
//           )
//         : Icon(
//             Icons.radio_button_unchecked,
//             color: Colors.blue,
//           );
//   }

//   Widget tick1() {
//     return this.widget.ticks > 0 ? tick(true) : tick(false);
//   }

//   Widget tick2() {
//     return this.widget.ticks > 1 ? tick(true) : tick(false);
//   }

//   Widget tick3() {
//     return this.widget.ticks > 2 ? tick(true) : tick(false);
//   }

//   Widget tick4() {
//     return this.widget.ticks > 3 ? tick(true) : tick(false);
//   }

//   Widget spacer() {
//     return Container(
//       width: 5.0,
//     );
//   }

//   Widget line() {
//     return Container(
//       color: Colors.blue,
//       height: 5.0,
//       width: 50.0,
//     );
//   }
// }

// class _Description extends StatelessWidget {
//   const _Description({
//     Key key,
//     this.description,
//     this.code,
//   }) : super(key: key);

//   final String description;
//   final String code;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(6)),
//         color: Colors.white.withOpacity(0.2),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Text(
//               description,
//             ),
//           ),
//           Theme(
//             data: Theme.of(context).copyWith(
//               accentColor: Colors.white,
//               dividerColor: Colors.transparent,
//               unselectedWidgetColor: Colors.white,
//             ),
//             child: ExpansionTile(
//               title: Text(
//                 '</> SOURCE CODE',
//               ),
//               children: <Widget>[
//                 // _Code(code: code),
//                 OutlineButton(
//                   child: Text(
//                     'FULL SCREEN',
//                     // style: GoogleFonts.lato(
//                     //   color: Colors.white.withOpacity(0.7),
//                     //   fontSize: 16,
//                     // ),
//                   ),
//                   borderSide: BorderSide(
//                     color: Colors.white.withOpacity(0.7),
//                     width: 2,
//                   ),
//                   onPressed: () {
//                     // showCodeDialog(context);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Example {
//   const Example({
//     this.name,
//     this.description,
//     this.code,
//     this.childHorizontal,
//     this.childVertical,
//   });

//   final String name;
//   final String description;
//   final String code;
//   final Widget childVertical;
//   final Widget childHorizontal;
// }

// const examples = <Example>[
//   example1,
//   // example2,
//   // example3,
//   // example4,
//   // example5,
//   // example6,
//   // example7,
//   // example8,
//   // example9,
//   // example10,
// ];

// const example1 = Example(
//   name: 'The simplest tile',
//   description: 'If the axis is vertical, it aligns default to the start, with '
//       'a height of 100. The tile will always try to be as wide as it can get horizontally.\n\n'
//       'If the axis is horizontal, It aligns default to the start, with a width'
//       'of 100. The tile will always try to be as wide as it can get vertically.',
//   code: '''
// /// Vertical
// return Container(
//   color: Colors.white,
//   child: TimelineTile(),
// );
// /// Horizontal
// return Container(
//   color: Colors.white,
//   child: TimelineTile(
//     axis: TimelineAxis.horizontal,
//   ),
// );''',
//   childVertical: Example1Vertical(),
//   childHorizontal: Example1Horizontal(),
// );

// class Example1Vertical extends StatelessWidget {
//   const Example1Vertical({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         <Widget>[
//           Container(
//             color: Colors.white,
//             child: TimelineTile(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Example1Horizontal extends StatelessWidget {
//   const Example1Horizontal({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         <Widget>[
//           Center(
//             child: Container(
//               constraints: const BoxConstraints(maxHeight: 100),
//               color: Colors.white,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TimelineTile(
//                     axis: TimelineAxis.horizontal,
//                     alignment: TimelineAlign.center,
//                     isFirst: true,
//                     indicatorStyle: const IndicatorStyle(
//                       height: 20,
//                       color: Colors.purple,
//                       indicatorXY: 0.2,
//                       padding: EdgeInsets.all(8),
//                     ),
//                     startChild: Container(
//                       constraints: const BoxConstraints(
//                         minWidth: 120,
//                       ),
//                       color: Colors.green,
//                     ),
//                   ),
//                   TimelineTile(
//                     axis: TimelineAxis.horizontal,
//                     alignment: TimelineAlign.center,
//                     indicatorStyle: const IndicatorStyle(
//                       height: 10,
//                       color: Colors.black,
//                       padding: EdgeInsets.only(
//                         top: 8,
//                         bottom: 8,
//                         left: 4,
//                         right: 4,
//                       ),
//                     ),
//                     startChild: Container(
//                       width: 50,
//                       color: Colors.purple,
//                     ),
//                     endChild: Container(
//                       color: Colors.cyan,
//                     ),
//                   ),
//                   TimelineTile(
//                     axis: TimelineAxis.horizontal,
//                     alignment: TimelineAlign.center,
//                     isLast: true,
//                     indicatorStyle: const IndicatorStyle(
//                       height: 30,
//                       color: Colors.red,
//                       indicatorXY: 0.3,
//                     ),
//                     endChild: Container(
//                       constraints: const BoxConstraints(
//                         minWidth: 80,
//                       ),
//                       color: Colors.lightGreenAccent,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
