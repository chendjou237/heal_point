import 'package:flutter/material.dart';
import 'package:heal_point/providers/db_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/models.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class NurseFormPage extends ConsumerStatefulWidget {
  const NurseFormPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NurseFormPageState();
}

class _NurseFormPageState extends ConsumerState<NurseFormPage> {
  Future<bool> _launchUrl() async {
    if (!await launchUrl(_url)) {
      return true;
    }
    throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final dateController = TextEditingController();
    final timeController = TextEditingController();
    final townQuarterController = TextEditingController();
    final descriptionController = TextEditingController();
    final db = ref.read(databaseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nurse Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Nurse Form'),
              const SizedBox(height: 24),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Enter date',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Enter Time',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: townQuarterController,
                decoration: const InputDecoration(
                  labelText: 'Enter Town and Quarter',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Enter Description of need',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 26),
              OutlinedButton(
                child: const Text("pay"),
                onPressed: () async {
            if (  await  _launchUrl()){
 if (await db.createNurseOrder(NurseOrder(
                    name: nameController.text,
                    date: dateController.text,
                    time: timeController.text,
                    townQuarter: townQuarterController.text,
                    description: descriptionController.text,
                  ))) {
                    const SnackBar(
                      content: Text('Order created'),
                    );
                  }
            }
                 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
