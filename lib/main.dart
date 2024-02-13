import 'package:flutter/material.dart';

const dotsData = [
  // Digit 0
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // Digit 1
  [
    [0, 0, 1, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 1, 1, 0],
  ],
  // Digit 2
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0],
    [1, 1, 1, 1, 1],
  ],
  // Digit 3
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // Digit 4
  [
    [0, 0, 0, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 1, 0, 1, 0],
    [1, 0, 0, 1, 0],
    [1, 1, 1, 1, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0],
  ],
  // Digit 5
  [
    [1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // Digit 6
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // Digit 7
  [
    [1, 1, 1, 1, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0],
    [0, 1, 0, 0, 0],
    [0, 1, 0, 0, 0],
  ],
  // Digit 8
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // Digit 9
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ]
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LED MATRIX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    print('current number is $value');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CP-SU LED MATRIX',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold), // กำหนดสีข้อความใน AppBar เป็นสีขาว
        ),
        backgroundColor:
            Colors.deepPurple, // กำหนดสีของ AppBar เป็นสีค่ามาตรฐานของโปรแกรม
        centerTitle: true,
        elevation: 2, // กำหนดความหนาของเส้นขอบ AppBar
      ),
      backgroundColor: const Color.fromARGB(255, 200, 181, 234),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton(-1), //ปุ่มเพิ่มค่า
            _buildDisplay(value),
            _buildButton(-2), //ปุ่มลดค่า
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int value) {
    Color dotColor = value == 0
        ? Color.fromARGB(255, 60, 60, 60)
        : Color.fromARGB(255, 153, 255, 94);

    return Container(
      // value = 0 จะแสดงจุดมืด, value = 1 จะแสดงจุดสว่าง
      width: 20,
      height: 20,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor,
      ),
    );
  }

  Widget _buildRow(List<int> dotList) {
    return Row(
      children: [
        for (var i = 0; i < dotList.length; i++) _buildDot(dotList[i]),
      ],
    );
  }

  Widget _buildColumn(List<List<int>> matrix) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < matrix.length; i++) _buildRow(matrix[i]),
      ],
    );
  }

  Widget _buildDigit(List<List<int>> rowList) {
    return _buildColumn(rowList);
  }

  Widget _buildDisplay(int number) {
    return Container(
      height: 300,
      width: 500,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black, // กำหนดสีดำให้กับพื้นหลัง
        border: Border.all(
          color: Colors.white, // กำหนดสีขอบ
          width: 10.0, // กำหนดความหนาขอบ
        ), // กำหนดขนาดขอบ
        boxShadow: [
          BoxShadow(
            color: Colors.grey, // สีของเงา
            blurRadius: 10.0, // ความเบลอของเงา
            spreadRadius: 2.0, // การกระจายของเงา
            offset: Offset(0, 4), // ตำแหน่งของเงา (x, y)
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildDigit((dotsData[value ~/ 10] )), _buildDigit((dotsData[value % 10])),]),
    );
  }

  Widget _buildButton(int num) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print(num);

          setState(() {
            if (num == -1) {
              value = (value + 1) % 100;
            } else if (num == -2) {
              value = (value - 1) % 100;
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple.shade50,
          ),
          child: Container(
            width: 60.0,
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (num == -1) Icon(Icons.arrow_drop_up, size: 50),
                if (num == -2) Icon(Icons.arrow_drop_down, size: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
