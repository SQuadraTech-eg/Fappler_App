import 'package:geolocator/geolocator.dart';

class trackingSystem{

  Future<Position> currentPosition() async{
    bool serviceEnable;
    LocationPermission? permission;

    //checking if location service is enabled
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnable){
      return Future.error("Location service are disable");
    }
    // check the location permission status
    permission == await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error("Location permission denied");
      }

      if(permission == LocationPermission.deniedForever){
        return Future.error("Location denied permanently");
      }
    }

    if(permission == null || permission == LocationPermission.deniedForever){
      return Future.error("Location permission not granted");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}