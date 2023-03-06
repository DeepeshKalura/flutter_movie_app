import 'package:flutter/material.dart';

import '../../../../model/cast_model.dart';
import '../../../../view/widget/cast_card.dart';

class CastWidget extends StatefulWidget {
  const CastWidget({super.key, required this.castList});
  final List<Cast> castList;

  @override
  State<CastWidget> createState() => _CastWidgetState();
}

class _CastWidgetState extends State<CastWidget> {
  @override
  Widget build(BuildContext context) {
    String? castUrl;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200, maxWidth: 1000),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.castList.length,
          itemBuilder: (context, index) {
            final cast = widget.castList[index];
            final profilePath = cast.profilePath;
            if (profilePath == null) {
              castUrl = 'https://www.computerhope.com/jargon/g/guest-user.png';
            } else {
              castUrl = 'https://image.tmdb.org/t/p/w500${cast.profilePath}';
            }
            return CastCard(
              character: cast.character,
              imageUrl: castUrl ??
                  'https://www.computerhope.com/jargon/g/guest-user.png',
              name: cast.name,
            );
          }),
    );
  }
}
