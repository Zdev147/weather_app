import 'package:flutter/material.dart';
import 'package:task/presentation/weather/models/weather_model.dart';

import '../../../core/app_export.dart';

class Section1 extends StatelessWidget {
  final Daily data;
  const Section1( this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _column('Date', data.dt.format()),
        _column('Humidity', '${data.humidity}'),
        _column('Wind Speed', '${data.windSpeed}'),
        _column('Status', data.weather.isEmpty? 'N/A': data.weather.first.main),
      ],
    );
  }

  Widget _column (String heading, String subHeading) => Column(
    children: [
      Text(
        heading,
        style: theme.textTheme.labelLarge!.copyWith(color: Colors.black),
      ),
      SizedBox(height: 1.v),
      Text(
        subHeading,
        style: theme.textTheme.titleSmall!.copyWith(color: Colors.black),
      ),
    ],
  );
}
