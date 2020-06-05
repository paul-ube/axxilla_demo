import 'package:flutter/material.dart';

class IconPlusName extends StatelessWidget {
  final String name;
  final IconData icon;

  const IconPlusName({Key key, @required this.name, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.black54,
          size: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            name,
            style: Theme.of(context).textTheme.caption.apply(
                  color: Colors.black54,
              fontSizeDelta: -2,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
