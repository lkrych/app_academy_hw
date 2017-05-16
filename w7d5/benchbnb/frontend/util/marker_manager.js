export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    benches.forEach(bench => {
      if(!this.markers[bench.id]){
        this.createMarkerFromBench(bench);
      }
    });
  }

  createMarkerFromBench(bench){
    let myLatLng = {lat: bench.lat, lng: bench.lon};
    let marker = new google.maps.Marker({
        position: myLatLng,
        map: this.map,
      });
    this.markers[bench.id] = marker;
  }
  //...
}
