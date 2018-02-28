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
<body style="background-color: #242329">
	<div class="tekka">
		<p>Seinast tékkt: {{timi[:10]}}, klukkan {{timi[11:16]}}</p>
	</div>
	<header><p>Bensínstöðvar og verð</p>
	<img src="/static/svg/{{stodvar[0]['key'][:2]}}.png"style="width: 160px; height: 123px " alt="myndir af logoi hjá fyrirtækunum"></header>
	<div class="wrapper-index">
		<section>
			% for x in stodvar:
				<div class="stod">
					<article class="fyrstu-dalkar">
						<h4>{{x['name']}}</h4>
						<div class="petrol">
							<div class="bensin">
								<p>Bensín</p>
								<h1>{{x['bensin95']}}</h1><h5>/kr,-</h5>
							</div>
							<div class="diesel">
								<p>Diesel</p>
								<h1>{{x['diesel']}}</h1><h5>/kr,-</h5>
							</div>
						</div>
					</article>
					<a href="/stodvar/{{x['company']}}/{{x['key']}}"><div class="meira">Meiri upplýsingar</div></a>
				</div>	
			% end
		</section>
	</div>
</body>
</html>