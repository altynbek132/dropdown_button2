import 'dart:async';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      scrollBehavior:
          const MaterialScrollBehavior().copyWith(dragDevices: PointerDeviceKind.values.toSet()),
      home: const Demo(),
    ),
  );
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  Future<void> test() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 104, 104),
        body: ListView(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DropdownCity(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownCity extends StatefulWidget {
  const DropdownCity({super.key});

  @override
  State<DropdownCity> createState() => _DropdownCityState();
}

class _DropdownCityState extends State<DropdownCity> {
  final List<String> dropdownItems = ['Алматы', 'Нур-Султан', 'Шымкент'];
  String selectedValue = 'Алматы';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          buttonStyleData: ButtonStyleData(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            elevation: 1,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          isDense: true,
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          ),
          value: selectedValue,
          onChanged: (newValue) {
            selectedValue = newValue!;
            setState(() {});
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            );
          }).toList(),
          iconStyleData: const IconStyleData(iconSize: 0),
          trailing: SizedBox.square(dimension: 10, child: Container(color: Colors.red)),
        ),
      ),
    );
  }
}
