 
 //initialize a new map
  function map_initialize() {
    geocoder = new google.maps.Geocoder();
    var mapOptions = {
    zoom: 8
    };
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    if(navigator.geolocation){
      navigator.geolocation.getCurrentPosition(showPosition);
    }
    else{
      alert("your browser doesn't support HTML5. Please enter address");
    }

  }

  //get the current latitude and logitude of the user and do reverse geo ciding 
  function showPosition(position)
  {

     pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);
    var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
      });
    


    //do reverse geo coding to get the current address 
    geocoder.geocode({'latLng': pos}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[1]) {
        map.setZoom(11);
        map.setCenter(pos);
        marker = new google.maps.Marker({
            position: pos,
            map: map
        });
        infowindow.setContent(results[0].formatted_address);
        infowindow.open(map, marker);
        document.getElementById("lat").value = position.coords.latitude;  
        document.getElementById("lon").value = position.coords.longitude;
        document.getElementById("address").value = results[0].formatted_address;
        
      } else {
        alert('No results found');
      }
    } else {
      alert('Geocoder failed due to: ' + status);
    }
  });
  }



function codeAddress() {
    //its redundant when the user hasn't updated, but can't fix this right now 
    var address = document.getElementById('address').value;
    $('#post-submit').unbind('submit');
    geocoder.geocode( { 'address': address}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                if( confirm('do you want to use this address??'.concat(results[0].formatted_address)) ) 
                {
                  document.getElementById("lat").value = results[0].geometry.location.lat();
                  document.getElementById("lon").value = results[0].geometry.location.lng();
                  document.getElementById("address").value = results[0].formatted_address;
                  $('#post-submit').submit();
                }
                else
                {
                  $("#post-submit").bind('submit',codeAddress);
                }

              } else {
                alert("There seems to be a problem with address. please enter again");
                $("#post-submit").bind('submit',codeAddress);
              }
            });
                  
       return false;
  
}


  



