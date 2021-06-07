// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:money_app/feature/budgets/provider/budget_provider.dart';
// import 'package:money_app/feature/budgets/ui/widget/button_widget.dart';
// import 'package:provider/provider.dart';
//
// class BudgetsList extends StatefulWidget {
//   @override
//   _BudgetsListState createState() => _BudgetsListState();
// }
//
// class _BudgetsListState extends State<BudgetsList> {
//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<BudgetProvider>(context, listen: false).getBudgets();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BudgetProvider>(
//       builder: (context, provider, _) => provider.loading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : provider.budgets.isEmpty
//               ? Center(
//                   child: Text('No Budgets yet!'),
//                 )
//               : Container(
//                   margin: EdgeInsets.only(top: 10.0),
//                   child: ListView.builder(
//                     //physics: ScrollPhysics(),
//                     //shrinkWrap: true,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                     itemCount: provider.budgets.length,
//                     itemBuilder: (context, index) => Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal: 15.0, vertical: 20.0),
//                         child: Column(
//                           //crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               provider.budgets[index].name,
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ButtonWidget(
//                                   name: 'Details',
//                                   onPressed: () {},
//                                 ),
//                                 ButtonWidget(
//                                   name: 'Accounts',
//                                   onPressed: () {},
//                                 ),
//                                 ButtonWidget(
//                                   name: 'Payees',
//                                   onPressed: () {},
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//     );
//   }
// }
