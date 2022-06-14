import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({
    Key? key,
    required this.image,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.desc,
  })  : 
        super(key: key);

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
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: _theme.bodyText1,
          ),
          subtitle: Text(
            desc,
            style: _theme.bodySmall!.copyWith(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
