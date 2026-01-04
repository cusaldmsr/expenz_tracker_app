import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:expenz_tracker_app/services/expense_services.dart';
import 'package:expenz_tracker_app/services/income_services.dart';
import 'package:expenz_tracker_app/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  final Function(ExpensModel) onAddExpense;
  final Function(IncomeModel) onAddIncome;

  const AddNewScreen({
    super.key,
    required this.onAddExpense,
    required this.onAddIncome,
  });

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selectedMethod = 0;
  ExpensCategory _expensCategory = ExpensCategory.food;
  IncomeCategory _incomeCategory = IncomeCategory.salary;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 1 ? kRed : kGreen,
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
                  top: MediaQuery.of(context).size.height * 0.25,
                ),
                padding: const EdgeInsets.all(kDefaultPadding),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Category selector dropdown
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            labelText: 'Select Category',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 10,
                            ),
                          ),
                          items: _selectedMethod == 1
                              ? ExpensCategory.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(describeEnum(category)),
                                  );
                                }).toList()
                              : IncomeCategory.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(describeEnum(category)),
                                  );
                                }).toList(),
                          value: _selectedMethod == 1
                              ? _expensCategory
                              : _incomeCategory,
                          onChanged: (value) {
                            setState(() {
                              if (_selectedMethod == 0) {
                                _expensCategory = value as ExpensCategory;
                              } else {
                                _incomeCategory = value as IncomeCategory;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        //Title TextField
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        //Description TextField
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        //Amount TextField
                        TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        //Date Picker
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  initialDate: DateTime.now(),
                                ).then((pickedDate) {
                                  if (pickedDate != null) {
                                    setState(() {
                                      _selectedDate = pickedDate;
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kMainColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: kWhite,
                                      ),
                                      const Text(
                                        'Select Date',
                                        style: TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              DateFormat().add_yMMMEd().format(_selectedDate),
                              style: TextStyle(color: kGrey, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        value.hour,
                                        value.minute,
                                      );
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kYellow,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        color: kWhite,
                                      ),
                                      const Text(
                                        'Select Time',
                                        style: TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              DateFormat.jm().format(_selectedTime),
                              style: TextStyle(color: kGrey, fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(height: 40, color: kGrey.withOpacity(0.5)),
                        //Submit Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: GestureDetector(
                            onTap: () async {
                              if (_selectedMethod == 1) {
                                //save the expense/income data into shared preferences
                                List<ExpensModel> existingExpenses =
                                    await ExpenseServices().fetchExpenses();

                                //create a new expense to add
                                ExpensModel newExpense = ExpensModel(
                                  id: existingExpenses.isNotEmpty
                                      ? existingExpenses.last.id + 1
                                      : 1,
                                  title: _titleController.text,
                                  category: _expensCategory,
                                  amount: _amountController.text.isEmpty
                                      ? 0.0
                                      : (double.tryParse(
                                              _amountController.text,
                                            ) ??
                                            0.0),
                                  date: _selectedDate,
                                  time: _selectedTime,
                                  description: _descriptionController.text,
                                );

                                //call the onAddExpense callback to add the new expense
                                widget.onAddExpense(newExpense);

                                //clear the form
                                _titleController.clear();
                                _descriptionController.clear();
                                _amountController.clear();
                              } else {
                                //load existing incomes
                                List<IncomeModel> existingIncomes =
                                    await IncomeServices().getIncomes();
                                //create a new income to add
                                IncomeModel newIncome = IncomeModel(
                                  id: existingIncomes.isNotEmpty
                                      ? existingIncomes.last.id + 1
                                      : 1,
                                  title: _titleController.text,
                                  category: _incomeCategory,
                                  amount: _amountController.text.isEmpty
                                      ? 0.0
                                      : (double.tryParse(
                                              _amountController.text,
                                            ) ??
                                            0.0),
                                  date: _selectedDate,
                                  time: _selectedTime,
                                  description: _descriptionController.text,
                                );

                                //call the onAddIncome callback to add the new income
                                widget.onAddIncome(newIncome);
                                //clear the form
                                _titleController.clear();
                                _descriptionController.clear();
                                _amountController.clear();
                              }
                            },
                            child: CustomButton(
                              text: 'Add Now',
                              color: _selectedMethod == 1 ? kRed : kGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
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
