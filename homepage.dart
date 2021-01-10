import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
Completer<GoogleMapController> _controller = Completer();
@override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  //scgm

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.arrow_back),
          onPressed: (){},
          ),
          title: Text('UUM Sintok'),
          actions:<Widget> [
            IconButton(
              icon:Icon(Icons.location_on),
              onPressed: (){

              },
            ),
          ],
        
      ),
    //cgm (view minus n plus)
      body: Stack(
        children:<Widget> [
          _googlemap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
     //scgm 
    );
  }
  //zin
  Widget _zoomminusfunction(){
  return Align(
    alignment: Alignment.topLeft,
    child: IconButton(
      icon:Icon(Icons.search_off,color:Colors.pink[900]),
      onPressed: (){
        zoomVal--;
        _minus(zoomVal);
      },
    ),
  );

  }
 Widget _zoomplusfunction(){
  return Align(
    alignment: Alignment.topRight,
    child: IconButton(
      icon:Icon(Icons.search_outlined,color:Colors.pink[900]),
      onPressed: (){
        zoomVal++;
        _plus(zoomVal);
      },
    ),
  );

  }

  Future<void> _minus(double zoomVal)async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(6.4676929,100.5067673),zoom:zoomVal)));
  }

  Future<void> _plus(double zoomVal)async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(6.4676929,100.5067673),zoom:zoomVal)));
  }
  //cgmc
  Widget _buildContainer(){
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical:20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:<Widget> [
            SizedBox(width:10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/cas.jpg",6.4676929,100.5067673,"CAS"),
              ),
              SizedBox(width:10.0),

             Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/uumcas.jpg",6.4678998,100.5054261,"UUM CAS Office"),
              ),

              SizedBox(width:10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/seduc.jpg",6.465847,100.504732,"School of Education and Modern Language"),
              ),

              SizedBox(width:10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/dkg1.jpg",6.4654912,100.5060008,"Dewan Kuliah Gugusan 1"),
              ),

              SizedBox(width:10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/dkg3.jpg",6.4645872,100.506273,"Dewan Kuliah Gugusan 3"),
              ),

              SizedBox(width:10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/msh.jpg",6.466392,100.5030692,"Muadzam Shah Hall"),
              ),

              SizedBox(width:10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/tsoh.jpg",6.4653842,100.5017615,"Tan Sri Othman Hall"),
              ),

              SizedBox(width: 10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/efb1.jpg",6.4648736,100.504482,"School Of Economics Finance and Bank"),
              ),

              SizedBox(width:10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/uumit.jpg",6.4640614,100.5049081,"UUM Information Technology"),
              ),

              SizedBox(width:10.0),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/yasmeen.jpg",6.4638571,100.5038668,"Yasmeen Cafe"),
              ),

              SizedBox(
                width:10.0),
              

             Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/dkg2.jpg",6.464036,100.5057889,"Dewan Kuliah 2"),
              ),
              
              SizedBox(
                width:10.0),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/ajc.jpg",6.4656755,100.5071156,"Alumni Junction Cafe"),
              ),

              SizedBox(
                width:10.0
              ),

               Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/otya.jpg",6.467045,100.5078287,"Othman Yeop Abdullah Graduate"),
              ),

          ], 
            ),
      ),
    );
  }
Widget _boxes(String _image,double lat, double long,String placeName){
  return GestureDetector(
    onTap: (){
      _gotoLocation(lat,long);   
    },
    child: Container(
      child: new FittedBox(
        child: Material(
          color: Colors.pink[900],
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Container(
                width:180,
                height: 200,
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(24.0),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(_image),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myDetailContainer(placeName),
                ),
              ),
            ],
          ),
        ),
      )
    ),
  );
}

Widget myDetailContainer (String placeName){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget> [
      Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: Container(
          child: Text(placeName,style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        ),
        SizedBox(height:5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text("Smile",style: TextStyle(color:Colors.pink[100],
                fontSize: 18.0,
                ),
                ),
              ),
              Container(
                child: Icon(Icons.star,
                color:Colors.amber,
                size:15.0,
                ),
              ),


              Container(
                child: Icon(Icons.star,
                color:Colors.amber,
                size:15.0,
                ),
              ),

              Container(
                child: Icon(Icons.star,
                color:Colors.amber,
                size:15.0,
                ),
              ),

              Container(
                child: Icon(Icons.star,
                color:Colors.amber,
                size:15.0,
                ),
              ),

              Container(
                child: Icon(Icons.star_half,
                color:Colors.amber,
                size:15.0,
                ),
              ),
              Container(
                child: Text(
                  "Always",
                style:TextStyle(color: Colors.pink[100],
                fontSize:18.0,
                ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height:5.0),
        Container(
          child: Text("UUM Sintok",
          style: TextStyle(color: Colors.pink[100],
          fontSize: 18.0,
          ),
          ),
        ),
        SizedBox(height:5.0),
        Container(
          child: Text("Closed\u0087 Open: office Hour",
          style:TextStyle(color:Colors.pink[100],
          fontSize: 18.0,
          fontWeight:FontWeight.bold),
          ),
        ),
    ],
  );
}
//scgmc

//cgm set gmm

Widget _googlemap(BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(target:LatLng(6.4676929,100.5067673),zoom: 17),
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },
      markers: {
        casMarker,uumcasofficeMarker,schoolofeducationMarker,dewankuliahgugusan1Marker,dewankuliahgugusan3Marker,muadzamshahhallMarker,tansriothmanhallMarker,schoolofeconomicsMarker,uumitMarker,yasmeencafeMarker,dewankuliah2Marker,alumnijunctioncafeMarker,othmanyeopabdullahgraduateMarker
      },
    ),
  );
}
Future<void> _gotoLocation(double lat, double long) async {
  final GoogleMapController controller=await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat,long),zoom:17,tilt:50.0,bearing:45.0,)));
}
}
//snw


Marker casMarker=Marker(
  markerId: MarkerId('cas'),
  position:LatLng(6.4676929,100.5067673),
  infoWindow: InfoWindow(title: 'CAS'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker uumcasofficeMarker=Marker(
  markerId: MarkerId('uumcasoffice'),
  position:LatLng(6.4678998,100.5054261),
  infoWindow: InfoWindow(title: 'UUM CAS Office'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker schoolofeducationMarker=Marker(
  markerId: MarkerId('schoolofeducation'),
  position:LatLng(6.465847,100.504732),
  infoWindow: InfoWindow(title: 'School of Education and Modern Language'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker dewankuliahgugusan1Marker=Marker(
  markerId: MarkerId('dewankuliahgugusan1'),
  position:LatLng(6.4654912,100.5060008),
  infoWindow: InfoWindow(title: 'Dewan Kuliah Gugusan 1'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker dewankuliahgugusan3Marker=Marker(
  markerId: MarkerId('dewankuliahgugusan3'),
  position:LatLng(6.4645872,100.506273),
  infoWindow: InfoWindow(title: 'Dewan Kuliah Gugusan 3'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker muadzamshahhallMarker=Marker(
  markerId: MarkerId('muadzamshahhall'),
  position:LatLng(6.466392,100.5030692),
  infoWindow: InfoWindow(title: 'Muadzam Shah Hall'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker tansriothmanhallMarker=Marker(
  markerId: MarkerId('tansriothmanhall'),
  position:LatLng(6.4653842,100.5017615),
  infoWindow: InfoWindow(title: ' Tan Sri Othman Hall'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker schoolofeconomicsMarker=Marker(
  markerId: MarkerId('schoolofeconomics'),
  position:LatLng(6.4648736,100.504482),
  infoWindow: InfoWindow(title: 'School of Economics Finance and Bank'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker uumitMarker=Marker(
  markerId: MarkerId('uumit'),
  position:LatLng(6.4640614,100.5049081),
  infoWindow: InfoWindow(title: 'UUM Information Technology'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker yasmeencafeMarker=Marker(
  markerId: MarkerId('yasmeencafe'),
  position:LatLng(6.4638571,100.5038668),
  infoWindow: InfoWindow(title: 'Yasmeen Cafe'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker dewankuliah2Marker=Marker(
  markerId: MarkerId('dewankuliah2'),
  position:LatLng(6.464036,100.5057889),
  infoWindow: InfoWindow(title: 'Dewan Kuliah 2'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker alumnijunctioncafeMarker=Marker(
  markerId: MarkerId('alumnijunctioncafe'),
  position:LatLng(6.4656755,100.5071156),
  infoWindow: InfoWindow(title: 'Alumni Junction Cafe'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker othmanyeopabdullahgraduateMarker=Marker(
  markerId: MarkerId('othmanyeopabdullahgraduate'),
  position:LatLng(6.467045,100.5078287),
  infoWindow: InfoWindow(title: 'Othman Yeop Abdullah Graduate'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);
//scgmm
