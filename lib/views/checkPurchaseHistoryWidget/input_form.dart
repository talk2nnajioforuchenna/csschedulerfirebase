import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/client_records_provider.dart';
import 'spinner.dart';

class InputForm extends StatefulWidget {
  InputForm({Key? key}) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  late TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  bool isValid = false;
  bool activeSpinner = false;

  void display(String s) {}

  @override
  void initState() {
    textController = TextEditingController();
    textController.addListener(() {
      setState(() {
        isValid = false;
      });
      String value = textController.text;
      if (value.isEmpty) {
        print('Please enter mobile number');
      } else if (value.length <= 10) {
        print('Please Count the mobile number');
      } else {
        setState(() {
          isValid = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ClientRecordsProvider crp = Provider.of<ClientRecordsProvider>(context);
    getClient() {
      setState(() {
        crp.displaySpinner = true;
        crp.displayRecords = false;
      });
      crp.getClientRecords(textController.text);
      textController.clear();
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Theme.of(context).cardColor,
                  elevation: 10,
                  child: TextField(
                    controller: textController,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.domine(fontSize: 16),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        labelText: 'Please Enter Customer Phone Number',
                        contentPadding: const EdgeInsets.all(20)),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onSurface: Colors.red,
                    primary: Colors.red, // background
                  ),
                  child: Text(
                    'Get Purchase History',
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: isValid
                      ? () {
                          getClient();
                        }
                      : null,
                ),
              ),
            ],
          ),
          crp.dontExist
              ? Column(
                  children: [
                    SizedBox(
                      height: 400,
                      width: 400,
                      child: Image.asset(
                        'assets/images/notFound2.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Sorry the Number you Entered Don't Exist in Our Records",
                        style: GoogleFonts.domine(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Container(),
          crp.displaySpinner ? const Spinner() : Container(),
        ],
      ),
    );
  }
}
