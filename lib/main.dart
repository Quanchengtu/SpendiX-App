import 'package:flutter/material.dart';
import 'welcome_page.dart'; // 確保 welcome_page.dart 在同一個資料夾中

import 'add_transaction_modal_with_icons.dart';
import 'chatbot_page.dart';

import 'transaction_page_history_update.dart';
import 'settings_page.dart';
import 'analysis_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 把左上角 debug 標籤移除
      home: const WelcomePage(), // 設定啟動畫面為 WelcomePage
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 🟫 當前選擇的頁面 index
  int _currentIndex = 0;

  // 🟫 各個分頁的對應畫面
  final List<Widget> _pages = [
    const TransactionHistoryPage(),
    //const Center(child: Text('帳務紀錄')),
    const AnalysisPage(),
    //const Center(child: Text('帳務分析')),
    const Center(child: Text('記帳中...')), // 點 + 時不切頁
    //const Center(child: Text('ChatBot')),
    const ChatBotPage(),
    const SettingsPage(),
    //const Center(child: Text('設定')),
  ];

  // 🟫 點擊底部選單項目時的處理邏輯
  // void _onItemTapped(int index) {
  //   if (index == 2) {
  //     // 如果點到中間的 + 號
  //     showModalBottomSheet(
  //       context: context,
  //       builder: (context) => const Center(child: Text('新增記帳')),
  //     );
  //     return;
  //   }
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
  void _onItemTapped(int index) {
    if (index == 2) {
      // showModalBottomSheet(
      //   context: context,
      //   isScrollControlled: true,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      //   ),
      //   //builder: (context) => const AddTransactionModal(),
      //   builder: (context) => const AddTransactionModal(),
      //
      // );
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent, // 讓圓角正常顯示
        builder: (context) {
          // return const SafeArea(
          //   top: false,
          //   child: AddTransactionModal(), // ✅ 這樣才能讓內部 DraggableScrollableSheet 運作正確
          // );
          return const SafeArea(top: false, child: AddTransactionModal());
        },
      );
      return;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🟫 主體頁面
      body: _pages[_currentIndex],

      // 🟫 底部導覽列
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFBEBD3), // 米色背景
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.brown[700],
        // unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.brown[800], // 主色，深咖啡
        unselectedItemColor: Colors.brown[300], // 次色，淺咖啡

        items: const [
          // 🟫 項目 1：帳務紀錄
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '紀錄'),
          // 🟫 項目 2：帳務分析
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '分析'),
          // 🟫 項目 3：新增記帳（+ 號）
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 32),
            label: '記帳',
          ),
          // 🟫 項目 4：ChatBot
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'ChatBot',
          ),
          // 🟫 項目 5：設定
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SpendiX Home'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: btnClickEvent,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.amber,  // 背景顏色
//             foregroundColor: Colors.white, // 文字顏色
//           ),
//           child: const Text('按鈕'),
//         ),
//       ),
//     );
//   }
//
//   void btnClickEvent() {
//     print('我被點擊了！');
//   }
// }
