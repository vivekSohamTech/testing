
import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  const CustomField({super.key});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    String data = '';
    TextEditingController numberController = TextEditingController();
    List<TextEditingController> controllers = [];
    List<TextField> fields = [];

    @override
    void dispose() {
      for (final controller in controllers) {
        controller.dispose();
      }
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(),
      body: StatefulBuilder(
        builder: (context, setState) => Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: numberController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count = int.parse(numberController.text);
                    });
                    numberController.clear();
                  },
                  child: const Text('ok'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final controller = TextEditingController();
                    controllers.add(controller);
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: controllers[index],
                        ),
                      ],
                    );
                  },
                  itemCount: count,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('===>${controllers.length.toString()}');
                try {
                  controllers.map(
                    (controller) {
                      data += controller.text;
                    },
                  ).toList();
                  debugPrint(data);
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Text('data'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
