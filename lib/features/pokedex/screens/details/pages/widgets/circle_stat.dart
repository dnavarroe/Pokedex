import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircleStat extends StatelessWidget {
  final Color baseColor;
  final String statName;
  final int stat;
  const CircleStat(
      {super.key,
      required this.stat,
      required this.statName,
      required this.baseColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 115,
            child: Column(
              children: [
                Center(
                  child: SleekCircularSlider(
                    min: 0,
                    max: 1000,
                    initialValue: stat.toDouble(),
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            handlerSize: 0,
                            trackWidth: 12,
                            progressBarWidth: 12),
                        infoProperties: InfoProperties(
                            bottomLabelText: statName,
                            bottomLabelStyle: const TextStyle(
                              letterSpacing: 0.1,
                              height: 1.5,
                              fontSize: 12,
                            ),),
                        animationEnabled: true,
                        size: 115,
                        customColors: CustomSliderColors(
                            hideShadow: true,
                            trackColor: baseColor.withAlpha(100),
                            progressBarColors: [
                              baseColor,
                              baseColor.withOpacity(0.5)
                            ])),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
