import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';

class CategoryBox extends ConsumerWidget {
  const CategoryBox({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context, ref) {
    final selectedCity = ref.watch(selectedCategoryProvider.state);
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/city');
        selectedCity.state = name;
      },
      child: Container(
        height: 60.0,
        width: 160.0,
        margin: const EdgeInsets.only(right: 20),
        child: Center(
          child: Text(
            name,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: selectedCity.state == name
                      ? Colors.white
                      : Colors.white54,
                ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/pharmacies_de_garde.jpg"),
            opacity: selectedCity.state != name ? 0.6 : 0.2,
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
