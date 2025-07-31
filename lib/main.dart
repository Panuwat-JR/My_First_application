import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Awesome App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white, // ✅ พื้นหลังขาว
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapter 4"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView( // ✅ แก้ overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //เอา Image.network ออก เพราะภาพไม่อยู่ในภาพล่าสุด
              // const SizedBox(height: 16.0),
              Image.asset('assets/messi-1805.jpg'),
              Image.asset(
                'assets/images/logo.png',
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'เกิดข้อผิดพลาดในการโหลด asset',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "สวัสดี FLUTTER",
                    style: GoogleFonts.lacquer(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(221, 48, 2, 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      print('กดปุ่ม Elevated');
                    },
                    child: const Text('Elevated'),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      print('กดปุ่ม Outlined');
                    },
                    child: const Icon(Icons.person),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      print('กดปุ่ม Text');
                    },
                    child: const Text('Text'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              IconButton(
                onPressed: () {
                  print('กดไอคอน Info');
                },
                icon: const Icon(Icons.info_outline),
                iconSize: 30,
                tooltip: 'ข้อมูล',
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
