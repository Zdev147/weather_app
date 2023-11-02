import 'package:meta/meta.dart';
import 'package:task/core/app_export.dart';
import 'package:task/core/utils/location_util.dart';
import 'package:location/location.dart' as location_plugin;
import 'package:task/data/apiClient/api_client.dart';
import 'package:task/data/apis/apis.dart';
import 'package:task/presentation/weather/models/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<GetWeatherEvent>((event, emit) async {
      /// check internet connection
      emit(WeatherLoadingState());

      if (!(await NetworkInfo().isConnected())) {
        emit(WeatherNoInternetState());
        return;
      }

      /// get location
      double lat=0, lng=0;
      if (event.address is String) {
        final latLng = await LocationUtil.addressToLatLng(event.address);
        if (latLng == null) {
          emit(WeatherFailureState('Address is not correct'));
          return;
        }
        lat = latLng['lat']!;
        lng = latLng['lng']!;
      } else if (event.address is location_plugin.LocationData) {
        lat = (event.address as location_plugin.LocationData).latitude!;
        lng = (event.address as location_plugin.LocationData).longitude!;
      } else {
        emit(WeatherFailureState('Address is not correct'));
        return;
      }

      /// calling api
      try {
       final response = await  ApiClient.get(Apis.getWeather, parameters: {
          'lat': lat,
          'lon': lng,
          'appid': Constants.apiKey,
          'exclude': 'minutely,hourly,alerts',
          'units': 'metric',
        });

       final model = WeatherModel.fromJson(response);
       emit(WeatherSuccessState(model));

      } catch (e) {
        emit(WeatherFailureState(e.toString()));
      }
    });
  }
}
