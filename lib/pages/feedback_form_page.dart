import 'package:flutter/material.dart';
import '../models/feedback_item.dart';

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final TextEditingController nameController = TextEditingController();
  String gender = 'L';
  int? selectedRating;
  List<String> hobbies = [];
  final TextEditingController commentController = TextEditingController();

  final Map<int, String> ratingOptions = {
    1: "Bad",
    2: "Good",
    3: "Excellent",
  };

  final List<String> hobbyOptions = [
    "Coding",
    "Musik",
    "Olahraga",
    "Membaca",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback Form')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Nama"),
          ),
          const SizedBox(height: 16),
          const Text("Jenis Kelamin"),
          RadioListTile<String>(
            title: const Text("Laki-laki"),
            value: "L",
            groupValue: gender,
            onChanged: (val) => setState(() => gender = val!),
          ),
          RadioListTile<String>(
            title: const Text("Perempuan"),
            value: "P",
            groupValue: gender,
            onChanged: (val) => setState(() => gender = val!),
          ),
          const SizedBox(height: 16),
          const Text("Rating"),
          ...ratingOptions.entries.map(
            (e) => RadioListTile<int>(
              title: Text(e.value),
              value: e.key,
              groupValue: selectedRating,
              onChanged: (val) => setState(() => selectedRating = val),
            ),
          ),
          const SizedBox(height: 16),
          const Text("Hobi"),
          Wrap(
            spacing: 8,
            children: hobbyOptions.map((hobby) {
              final selected = hobbies.contains(hobby);
              return FilterChip(
                label: Text(hobby),
                selected: selected,
                onSelected: (val) {
                  setState(() {
                    if (val) {
                      hobbies.add(hobby);
                    } else {
                      hobbies.remove(hobby);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: commentController,
            decoration: const InputDecoration(labelText: "Komentar"),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty || selectedRating == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Nama dan rating wajib diisi")),
                );
                return;
              }

              final feedback = FeedbackItem(
                name: nameController.text,
                gender: gender,
                rating: selectedRating!.toDouble(),
                hobbies: List.from(hobbies),
                comment: commentController.text,
              );

              Navigator.pop(context, feedback);
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
