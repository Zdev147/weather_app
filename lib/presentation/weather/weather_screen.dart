import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/utils/location_util.dart';
import 'package:task/presentation/weather/bloc/weather_bloc.dart';
import 'package:task/presentation/weather/models/weather_model.dart';
import 'package:task/presentation/weather/widgets/section1.dart';
import 'package:task/presentation/weather/widgets/section2.dart';
import 'package:task/widgets/loading_view.dart';
import 'package:task/widgets/location_search_field.dart';

import '../../core/app_export.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) {
        if (LocationUtil.locationData == null)
          return WeatherBloc();
        else
          return WeatherBloc()..add(GetWeatherEvent(LocationUtil.locationData));
      },
      child: WeatherScreen(),
    );
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlue, Colors.greenAccent],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              print(state.runtimeType);
              if (state is WeatherLoadingState)
                return LoadingView();
              else if (state is WeatherInitialState)
                return Column(
                  children: [
                    _searchField(context),
                    _dataList([]),
                  ],
                );
              else if (state is WeatherFailureState)
                return Column(
                  children: [
                    _searchField(context),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.v),
                          child: Text(
                            state.error,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              else if (state is WeatherNoInternetState)
                return Column(
                  children: [
                    _searchField(context),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.v),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.signal_wifi_connected_no_internet_4),
                              Text(
                                'No internet connection',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              else if (state is WeatherSuccessState)
                return Column(
                  children: [
                    _searchField(context),
                    _dataList(state.weatherData.daily),
                  ],
                );
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
      child: LocationSearchField(
        controller: searchController,
        onFieldSubmit: (txt) {
          if (txt.isNotEmpty) BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent(txt.trim()));
        },
      ),
    );
  }

  Widget _dataList(List<Daily> data) {
    return Expanded(
      child: data.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.v),
                child: Text(
                  'Please seach for a location or enable you location and restart the app',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _detail(context, data[index]);
              },
            ),
    );
  }

  Widget _detail(BuildContext context, Daily data) {
    final address = searchController.text.trim().isEmpty ? 'Current Location' : searchController.text.trim();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
      child: Column(
        children: [
          SizedBox(height: 50.v),
          CachedNetworkImage(
            imageUrl: 'https://openweathermap.org/img/wn/${data.weather.isEmpty ? '' : data.weather.first.icon}@2x.png',
            placeholder: (_, __) => CupertinoActivityIndicator(radius: 30.h),
            errorWidget: (_, __, ___) => Icon(
              Icons.warning_rounded,
              size: 70.h,
              color: appTheme.gray500,
            ),
            height: 120.adaptSize,
            width: 120.adaptSize,
          ),
          SizedBox(height: 14.v),
          Column(
            children: [
              Text(
                address,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.temp.day}',
                    style: CustomTextStyles.poppinsBluegray900,
                  ),
                  Container(
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    margin: EdgeInsets.only(top: 20.v, bottom: 76.v),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.h),
                      border: Border.all(color: appTheme.blueGray900, width: 1.h),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Section1(data),
          SizedBox(height: 20.v),
          Section2(data),
        ],
      ),
    );
  }
}
