import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  DateTime _countdownDate = DateTime(2026, 1, 1);
  Timer? _timer;
  Duration _timeRemaining = Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      setState(() {
        _timeRemaining = _countdownDate.isAfter(now)
            ? _countdownDate.difference(now)
            : Duration.zero;
      });

      if (_timeRemaining == Duration.zero) {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    int days = _timeRemaining.inDays;
    int hours = _timeRemaining.inHours.remainder(24);
    int minutes = _timeRemaining.inMinutes.remainder(60);
    int seconds = _timeRemaining.inSeconds.remainder(60);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            Text('Countdown to New Year'),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountdownItem(days, 'DAYS'),
                _buildCountdownItem(hours, 'HOURS'),
                _buildCountdownItem(minutes, 'MINS'),
                _buildCountdownItem(seconds, 'SECS'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Happy New Year!',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
            Text(
              '2026',
              style: TextStyle(
                fontSize: 36,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Let the countdown begin! Share the excitement with your friends and family.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColorDark,
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          icon: const Icon(Icons.upload, size: 19),
          label: const Text(
            'Share the Excitement!',
            style: TextStyle(fontSize: 19),
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownItem(int value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColorDark.withValues(alpha: 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: Text(
                _formatNumber(value),
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}
