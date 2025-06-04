import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentFormPage extends StatelessWidget {
  final Student? student;  // Use your Student model instead of dynamic

  const StudentFormPage({super.key, this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Form')),
      body: Center(
        child: Text(student == null
            ? 'Add New Student Form Here'
            : 'Edit Student Form for ${student!.name}'),
      ),
    );
  }
}
