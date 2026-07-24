import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification = true;
  bool acceptTerms = false;

  int gender = 0;
  int step = 0;

  double fontSize = 20;

  List<bool> theme = [true, false];

  String interest = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Preferences"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Enable Notifications",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Switch(
              value: notification,
              onChanged: (value) {
                setState(() {
                  notification = value;
                });
              },
            ),

            Text(
              notification ? "Notifications Enabled" : "Notifications Disabled",
            ),

            const SizedBox(height: 20),

            const Text(
              "Choose Theme",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            ToggleButtons(
              isSelected: theme,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Light"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Dark"),
                ),
              ],
              onPressed: (index) {
                setState(() {
                  theme[0] = index == 0;
                  theme[1] = index == 1;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Select Gender",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            RadioListTile(
              title: const Text("Male"),
              value: 0,
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Female"),
              value: 1,
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Other"),
              value: 2,
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Accept Terms & Conditions"),
              value: acceptTerms,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Font Size",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Slider(
              value: fontSize,
              min: 10,
              max: 30,
              divisions: 20,
              label: fontSize.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  fontSize = value;
                });
              },
            ),

            Center(
              child: Text(
                "Flutter App!",
                style: TextStyle(fontSize: fontSize),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Choose Interest",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Wrap(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: const Text("Flutter"),
                  selected: interest == "Flutter",
                  onSelected: (value) {
                    setState(() {
                      interest = "Flutter";
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("AI"),
                  selected: interest == "AI",
                  onSelected: (value) {
                    setState(() {
                      interest = "AI";
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("Web"),
                  selected: interest == "Web",
                  onSelected: (value) {
                    setState(() {
                      interest = "Web";
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Quick Actions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Row(
              children: [
                ActionChip(
                  label: const Text("Reset"),
                  onPressed: () {
                    setState(() {
                      notification = true;
                      acceptTerms = false;
                      gender = 0;
                      fontSize = 20;
                      interest = "Flutter";
                      theme = [true, false];
                    });
                  },
                ),
                const SizedBox(width: 10),
                ActionChip(
                  label: const Text("Save"),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Preferences Saved"),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            Stepper(
              currentStep: step,
              onStepContinue: () {
                if (step < 2) {
                  setState(() {
                    step++;
                  });
                }
              },
              onStepCancel: () {
                if (step > 0) {
                  setState(() {
                    step--;
                  });
                }
              },
              steps: const [
                Step(
                  title: Text("Profile"),
                  content: Text("Complete Profile"),
                ),
                Step(
                  title: Text("Preferences"),
                  content: Text("Choose Preferences"),
                ),
                Step(
                  title: Text("Finish"),
                  content: Text("Completed"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}