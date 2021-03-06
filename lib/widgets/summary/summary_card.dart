
import 'package:covid19in/widgets/decoration_animation_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class SummaryData {
  final String title;
  final Category category;
  final String total;
  final String diff;
  final bool showDiff;
  final bool isSelected;

  SummaryData(
      {this.title,
        this.category,
        this.total,
        this.diff,
        this.isSelected = false,
        this.showDiff = true});
}

class SummaryCard extends StatelessWidget {
  final Color summaryColor;
  final SummaryData data;
  final Function onSelected;

  const SummaryCard({
    this.summaryColor,
    this.data,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final unselectedDecoration = BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(8.0));
    final selectedDecoration = BoxDecoration(color: summaryColor.withAlpha(32), borderRadius: BorderRadius.circular(8.0), boxShadow: [BoxShadow(color: summaryColor.withOpacity(0.2), blurRadius: 8.0, offset: new Offset(0.0, 4.0))]);

    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(8.0),
      child: DecorationAnimationBuilder(
        endDecoration: data.isSelected ? selectedDecoration : unselectedDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "${data.title}\n\n",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: summaryColor),
                children: <InlineSpan>[
                  TextSpan(
                      text: data.showDiff ? "${data.diff}\n" : "\n",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: summaryColor)),
                  TextSpan(
                      text: "${data.total}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: summaryColor)),
                ]),
          ),
        ),
      ),
    );
  }
}
