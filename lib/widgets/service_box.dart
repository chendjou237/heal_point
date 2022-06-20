import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({
    Key? key,
    required this.image,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.desc,
  }) : super(key: key);

  final String image;
  final IconData icon;
  final void Function() onTap;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 216, 216, 216),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: _theme.bodyMedium!.copyWith(color: Colors.white),
          ),
          subtitle: Text(
            desc,
            style: _theme.bodySmall!.copyWith(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
