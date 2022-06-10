import 'package:flutter/material.dart';
import 'package:heal_point/utilities/utilities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HealButton extends ConsumerWidget {
   const HealButton({
    Key? key,
    
    required  this.label,
    required  this.onTap,
  }) :
        super(key: key);

 
  final String label;
 final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _theme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: secondaryColorLight,
        shape: StadiumBorder(
        ),
      ),
      child: Text(
        label,
        style: _theme.button!.copyWith(color: Colors.white),
      ),
    );
  }
}
