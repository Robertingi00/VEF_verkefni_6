<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="static/maine.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
</head>
<body>
	
	<div class="tekka">
		<p>Seinast tékkt: {{timi[:10]}}, klukkan {{timi[11:16]}}</p>
	</div>
	<header>Ódýrustu Bensínstöðvar</header>
	<header>Fyrsta er Bensín seinni er Díesel</header>
	<div class="wrapper-sida">
		<section class="odyrt">
			% for x in odyrt:
				<article>
					<div class="mynd">
						<img src="static/svg/{{x['key'][:2]}}.png" style="width: 160px; height: 123px" alt="myndir af logoi hjá fyrirtækunum">
						<a href="/stodvar/{{x['company']}}/{{x['key']}}"><div class="meira"><h3></h3><h4>{{x['company']}}</h4></div></a>
					</div>
				</article>
			% end
		</section>
	<header>Íslenskar Bensínstöðvar</header>
		<section class="lala">
			% for x in data:
				<article>
					<div class="mynd">
						<img src="static/svg/{{x['key'][:2]}}.png" style="width: 160px; height: 123px " alt="myndir af logoi hjá fyrirtækunum">
						<a href="/stodvar/{{x['company']}}"><div class="meira"><h4>{{x['company']}}</h4></div></a>
					</div>
				</article>
			% end
		</section>
	</div>

</body>
</html>