import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ui_tutorial_1/components/expense_meter.dart';
import 'package:ui_tutorial_1/constants/constant.dart';
import 'package:ui_tutorial_1/constants/style.dart';
import 'package:ui_tutorial_1/models/item_model.dart';

class EnergyExpense extends StatelessWidget {
  const EnergyExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40.0,
                height: 8.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            Space.verticle(value: 20.0),
            const Text(
              'Energy Expenses',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  letterSpacing: 1.4),
            ),
            Space.verticle(value: 20.0),
            const Align(
                alignment: Alignment.centerLeft, child: MonthDropdownButton()),
            Space.verticle(value: 30.0),
            const ExpenseMeter(
              value: 1.0,
            ),
            Space.verticle(value: 30.0),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 10.0,
                        blurRadius: 15.0,
                        offset: const Offset(10.0, 10.0),
                        color: Colors.grey.withOpacity(.09))
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Savings',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Space.verticle(value: 5.0),
                          const Text(
                            '\$150.15',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Savings Target',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Space.verticle(value: 5.0),
                          const Text(
                            '\$430.50',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Space.verticle(value: 20.0),
                  LinearPercentIndicator(
                    percent: .4,
                    animation: true,
                    barRadius: const Radius.circular(15.0),
                    lineHeight: 8.0,
                    padding: EdgeInsets.zero,
                    progressColor: AppColor.primary,
                    backgroundColor: AppColor.lightGrey,
                  )
                ],
              ),
            ),
            Space.verticle(value: 16.0),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1.0,
                        blurRadius: 8.0,
                        color: Colors.grey.withOpacity(.05))
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Devices',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      MonthDropdownButton()
                    ],
                  ),
                  Space.verticle(value: 25.0),
                  ...items.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: ListItem(item: item),
                      ))
                ],
              ),
            ),
            Space.verticle(value: 30.0)
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Item item;
  const ListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 15.0)),
            Space.verticle(value: 10.0),
            LinearPercentIndicator(
              percent: 1.0,
              animation: true,
              barRadius: const Radius.circular(15.0),
              lineHeight: 4.0,
              padding: EdgeInsets.zero,
              progressColor: AppColor.primary,
              backgroundColor: AppColor.lightGrey,
            )
          ],
        ),
      ),
      Expanded(
          flex: 20,
          child: Column(
            children: [
              Text(
                '\$${item.savings.toInt()}',
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w600),
              ),
              Space.verticle(value: 4.0),
              Text(
                'Savings',
                style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
              ),
            ],
          ))
    ]);
  }
}

class MonthDropdownButton extends StatefulWidget {
  const MonthDropdownButton({Key? key}) : super(key: key);

  @override
  State<MonthDropdownButton> createState() => _MonthDropdownButtonState();
}

class _MonthDropdownButtonState extends State<MonthDropdownButton> {
  final List<String> _months = ['January', 'February', 'March'];
  String _currentValue = 'January';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(15.0)),
      child: DropdownButton<String>(
        isDense: true,
        value: _currentValue,
        borderRadius: BorderRadius.circular(15.0),
        underline: Container(),
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        onChanged: (String? newValue) {
          setState(() {
            _currentValue = newValue!;
          });
        },
        items: _months.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14.0),
            ),
          );
        }).toList(),
      ),
    );
  }
}
