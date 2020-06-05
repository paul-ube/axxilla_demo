import 'package:flutter/material.dart';

class IconPlusName extends StatelessWidget {
  final String name;
  final IconData icon;
  final TextStyle textStyle;
  final Color iconColor;

  const IconPlusName({
    Key key,
    @required this.name,
    @required this.icon,
    this.textStyle,
    this.iconColor = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            name,
            style: textStyle ??
                Theme.of(context).textTheme.caption.apply(
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
