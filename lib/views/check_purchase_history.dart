import 'package:customerservicescheduler/providers/client_records_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'checkPurchaseHistoryWidget/display_purchase_history.dart';
import 'checkPurchaseHistoryWidget/input_form.dart';

class CheckPurchaseHistory extends StatefulWidget {
  const CheckPurchaseHistory({Key? key}) : super(key: key);

  @override
  State<CheckPurchaseHistory> createState() => _CheckPurchaseHistoryState();
}

class _CheckPurchaseHistoryState extends State<CheckPurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    ClientRecordsProvider clientRecords =
        Provider.of<ClientRecordsProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Client Purchase History',
              style: GoogleFonts.domine(
                fontWeight: FontWeight.bold,
              ))),
      body: Center(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/records.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.all(50)),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputForm(),
                  const DisplayPurchaseHistory(),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
