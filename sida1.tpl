<!DOCTYPE html>
<html>
<head>
	 <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/static/maine.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
</head>
<body>
	<div class="takkar">
		<a href="/stodvar/{{stodvar[0]['company']}}"><img src="/static/svg/arrow.svg" style="height: 3em;"></a>
		<a href="/.."><img src="/static/svg/home.svg" style="height: 3em;"></a>
	</div>
	<div class="tekka">
		<p>Seinast tékkt: {{timi[:10]}}, klukkan {{timi[11:16]}}</p>
	</div>
	<header>Upplýsingar um stöð</header>
	<div class="wrapper-sida1">
		<section>
			<article class="fyrstu-dalkar">
				<h4>Bensín</h4>
				<div class="petrol">
					<div class="bensin">
						<p>Bensín</p>
						<h1>{{stodvar[0]['bensin95']}}</h1><h5>/kr,-</h5>
					</div>
					<div class="diesel">
						<p>Fyrir korthafendur</p>
						<h1>{{stodvar[0]['bensin95_discount']}}</h1><h5>/kr,-</h5>
					</div>
				</div>
			</article>
			<article class="fyrstu-dalkar">
				<h4>Díesel</h4>
				<div class="petrol">
					<div class="bensin">
						<p>Díesel</p>
						<h1>{{stodvar[0]['diesel']}}</h1><h5>/kr,-</h5>
					</div>
					<div class="diesel">
						<p>Fyrir korthafendur</p>
						<h1>{{stodvar[0]['diesel_discount']}}</h1><h5>/kr,-</h5>
					</div>
				</div>
			</article>
			<article class="map">
				 <div id="map"></div>
				    <script>
				      function initMap() {
				        var uluru = {
				          lat: {{stodvar[0]['geo']['lat']}},
				          lng: {{stodvar[0]['geo']['lon']}}
				        };
				        var map = new google.maps.Map(document.getElementById('map'), {
				          zoom: 17,
				          center: uluru
				        });
				        var marker = new google.maps.Marker({
				          position: uluru,
				          map: map
				        });
				      }
				    </script>
				    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBoAnJ1G2IPQoTQMi-5tIsF4OhgkoMPNPs&callback=initMap">
				   	</script>
			</article>
		</section>
	</div>
	<footer>
	</footer>

</body>
</html>


