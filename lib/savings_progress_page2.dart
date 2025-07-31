import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingsProgressPage extends StatelessWidget {
  final double currentSaved;
  final double targetAmount;
  final int remainingDays;
  final double dailySuggestion;

  SavingsProgressPage({
    required this.currentSaved,
    required this.targetAmount,
    required this.remainingDays,
    required this.dailySuggestion,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (currentSaved / targetAmount).clamp(0.0, 1.0);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('儲蓄進度分析', style: TextStyle(fontSize: 18)),
        backgroundColor: CupertinoColors.systemGrey6,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildProgressCard(context, progress),
              SizedBox(height: 20),
              _buildSuggestionCard(context),
              Spacer(),
              CupertinoButton(
                color: CupertinoColors.systemPurple,
                borderRadius: BorderRadius.circular(12),
                child: Text('編輯目標', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  // TODO: 導向編輯目標功能
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context, double progress) {
    return CupertinoPopupSurface(
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground.resolveFrom(context),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '目前儲蓄進度',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              '${currentSaved.toStringAsFixed(0)} / ${targetAmount.toStringAsFixed(0)} 元',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.systemRed,
              ),
            ),
            SizedBox(height: 15),
            CupertinoProgressBar(
              value: progress,
              backgroundColor: CupertinoColors.systemGrey4,
              color:
                  progress < 0.7
                      ? CupertinoColors.activeGreen
                      : (progress < 0.9
                          ? CupertinoColors.activeOrange
                          : CupertinoColors.systemRed),
            ),
            SizedBox(height: 10),
            Text(
              progress < 1.0
                  ? '比理想進度落後 ${(1.0 - progress) * 100 ~/ 1}%'
                  : '已達成目標！',
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionCard(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground.resolveFrom(context),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '建議每日儲蓄',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              '${dailySuggestion.toStringAsFixed(0)} 元',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.systemRed,
              ),
            ),
            SizedBox(height: 15),
            Text(
              '剩餘天數：$remainingDays 天',
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CupertinoProgressBar extends StatelessWidget {
  final double value;
  final Color color;
  final Color backgroundColor;

  const CupertinoProgressBar({
    required this.value,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 12,
        decoration: BoxDecoration(color: backgroundColor),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: value,
          child: Container(color: color),
        ),
      ),
    );
  }
}
