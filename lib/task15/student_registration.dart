import 'package:flutter/material.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final roll = TextEditingController();
  final city = TextEditingController();

  String course = "B.Tech CSE";

  Widget buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType type = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        validator: validator ??
            (v) => v!.isEmpty ? "Required" : null,
      ),
    );
  }

  void resetForm() {
    formKey.currentState!.reset();

    for (var c in [name, email, mobile, roll, city]) {
      c.clear();
    }

    setState(() {
      course = "B.Tech CSE";
    });
  }

  void submitForm() {
    if (!formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Registration Successful"),
        content: Text(
          '''
Name : ${name.text}

Email : ${email.text}

Mobile : ${mobile.text}

Roll No : ${roll.text}

Course : $course

City : ${city.text}
''',
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [

              const Icon(
                Icons.school,
                size: 80,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 20),

              buildField(
                controller: name,
                label: "Full Name",
                icon: Icons.person,
              ),

              buildField(
                controller: email,
                label: "Email",
                icon: Icons.email,
                validator: (v) =>
                    v!.contains("@") ? null : "Invalid Email",
              ),

              buildField(
                controller: mobile,
                label: "Mobile Number",
                icon: Icons.phone,
                type: TextInputType.phone,
                validator: (v) =>
                    v!.length == 10 ? null : "Enter 10 digits",
              ),

              buildField(
                controller: roll,
                label: "Roll Number",
                icon: Icons.badge,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: DropdownButtonFormField<String>(
                  value: course,
                  decoration: const InputDecoration(
                    labelText: "Course",
                    prefixIcon: Icon(Icons.menu_book),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: "B.Tech CSE",
                        child: Text("B.Tech CSE")),
                    DropdownMenuItem(
                        value: "B.Tech AI & DS",
                        child: Text("B.Tech AI & DS")),
                    DropdownMenuItem(
                        value: "B.Tech IT",
                        child: Text("B.Tech IT")),
                    DropdownMenuItem(
                        value: "BCA",
                        child: Text("BCA")),
                    DropdownMenuItem(
                        value: "MCA",
                        child: Text("MCA")),
                  ],
                  onChanged: (v) {
                    setState(() {
                      course = v!;
                    });
                  },
                ),
              ),

              buildField(
                controller: city,
                label: "City",
                icon: Icons.location_city,
              ),

              Row(
                children: [

                  Expanded(
                    child: OutlinedButton(
                      onPressed: resetForm,
                      child: const Text("Reset"),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: submitForm,
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}