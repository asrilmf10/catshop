import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkMode with ChangeNotifier {
  bool darkMode = true;

  changeMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          "Change Mode",
          style: TextStyle(
            fontFamily: 'Acme',
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const _Setting(),
    );
  }
}

class _Setting extends StatefulWidget {
  const _Setting({Key? key}) : super(key: key);

  @override
  State<_Setting> createState() => __SettingState();
}

class __SettingState extends State<_Setting> {
  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.light_mode, size: 35),
                title: const Text("Light Mode"),
                subtitle: const Text("Here you can change you're theme."),
                trailing: Switch(
                  value: themeMode.darkMode,
                  activeTrackColor: Colors.pink.shade200,
                  activeColor: Colors.pink.shade700,
                  onChanged: (value) {
                    themeMode.changeMode();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
