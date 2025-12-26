import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 0 ? kMainColor : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 66.0,
                              vertical: 14.0,
                            ),
                            child: Text(
                              'Income',
                              style: TextStyle(
                                color: _selectedMethod == 0 ? kWhite : kBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 1 ? kMainColor : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 66.0,
                              vertical: 14.0,
                            ),
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                color: _selectedMethod == 1 ? kWhite : kBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: kDefaultPadding * 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How Much?',
                        style: TextStyle(
                          color: kLightGrey.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //user data form
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                ),
                padding: const EdgeInsets.all(kDefaultPadding),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Category selector dropdown
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: 'Select Category',
                          border: InputBorder.none,
                        ),
                        items: ExpensCategory.values.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(describeEnum(category)),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
