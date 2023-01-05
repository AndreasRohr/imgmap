const pic1 = {tag:"ground", latitude:DMStoDD(46, 54, 57.31), longitude:DMStoDD(7, 26, 49.74), imgDirection: 40, date: "2022-07-06", name: "IMG_4766.JPG"}
const pic2 = {tag:"ground", latitude:DMStoDD(46, 55, 4.64), longitude:DMStoDD(7, 26, 22.63), imgDirection: 212, date: "2022-07-08", name: "IMG_4901.JPG"}
const pic3 = {tag:"ground", latitude:DMStoDD(46, 54, 58.62), longitude:DMStoDD(7, 26, 45.08), imgDirection: 303, date: "2022-07-06", name: "IMG_4983.JPG"}

let markersArray = []
let overlayButton = document.getElementById("overlayButton");
let latInput = document.getElementById("lat");
let lngInput = document.getElementById("lng");
let confirmButton = document.getElementById("confirmInputLNGLAT");
let groundArr = [];
let airArr = [];
let orthoArr = [];



groundArr.push(pic1, pic2, pic3);
//airArr.push(pic3);


let historicalOverlay;
let map;

let a = 46.91783849056467
let b = 46.90783849056467
let c = 7.441518321128134
let d = 7.431518321128134

let lngDefault = 7.441518321128134
let latDefault = 46.91783849056467

let overlayCoordinates = {
    north: a,
    south: b,
    east: c,
    west: d,
};

// center: { lat: 46.91783849056467, lng: 7.441518321128134 },

function initMap() {
    map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: parseFloat(modelData[0].lat), lng: parseFloat(modelData[0].lng) },
        zoom: parseFloat(modelData[0].zoom),
    });



    groundArr.forEach(element => {
        addMarker(element.latitude, element.longitude, element.imgDirection, "ground", element.date, element.name)
    })
    airArr.forEach(element => {
        addMarker(element.latitude, element.longitude, element.imgDirection, "air", element.date, element.name)
    })
    orthoArr.forEach(element => {
        addMarker(element.latitude, element.longitude, element.imgDirection, "ortho", element.date, element.name)
    })

    drawOverlay()


}
function addMarker(lat, lng, direction, type, date, name){
    let color
    switch (type){
        case "ground":
            color = 'blue';
            break;
        case "air":
            color = 'green';
            break;
        case "ortho":
            color = 'red';
            break;
    }



    let marker = new google.maps.Marker({
        map: map,
        position: {lat: lat, lng: lng},
        title: date,
        icon: {
            path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
            scale: 4.5,
            strokeColor: color,
            rotation: direction,
            draggable: true,
        },
    });


    let imgPath = "../../assets/" + type + "/" + name

    marker.addListener("click", () => {
        // infowindow.open({
        //     content: content,
        //     anchor: marker,
        //     map,
        // });
        document.getElementById("image").setAttribute('src', imgPath);

        if( document.getElementById("image").style.display === "block"){
            document.getElementById("image").style.display = "none";
        }else{
            document.getElementById("image").style.display = "block";
        }

    });
    markersArray.push(marker);
}


function DMStoDD(deg, min, sec){
    let dd = deg + (min/60) + (sec/3600);
    return dd;
}

function closeImage(){
    //document.getElementById("image").style.visibility = "hidden";
    document.getElementById("image").style.display = "none";
}

overlayButton.onclick = function(){
    historicalOverlay.setMap(null);

    a= a + 0.0001,
        b= b - 0.0001,
        c= c + 0.0001,
        d= d -0.0001,

        drawOverlay()
    console.log(overlayCoordinates)
};

confirmButton.onclick = function(){
    latDefault = parseFloat(latInput.value)
    lngDefault = parseFloat(lngInput.value)
    console.log(latDefault)
    console.log(lngDefault)
    initMap()
};

function drawOverlay(){
    historicalOverlay = new google.maps.GroundOverlay(
        "https://storage.googleapis.com/geo-devrel-public-buckets/newark_nj_1922-661x516.jpeg",
        {north: a, south: b, east: c, west: d,},
    );
    historicalOverlay.setMap(map);
}

window.initMap = initMap;