<?php 
include_once('esp-database.php');
?>


<!doctype html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ESP32 Web-Based IR Controller</title>
<link href="css/singlePageTemplate.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- Main Container -->
<div class="container"> 
  <!-- Navigation -->
  <header> <a href="">
    <h4 class="logo">GVSU&nbsp;&nbsp;</h4>
    </a>
    <nav>
      <ul>
        
        <li> <a href="#contact">ABOUT</a></li>
      </ul>
    </nav>
  </header>
  <!-- Hero Section -->
  <section class="hero" id="hero">
    <h2 class="hero_header">GVSU: CIS350-02 SUMMER 2021&nbsp; <span class="light">GROUP PROJECT&nbsp;</span></h2>
    <p class="tagline">AN ESP32 AND MYSQL POWERED INFRARED CONTROLLER</p>
    <p class="tagline">BY DALE BETTS, AUSTIN ELLSWORTH, &amp;&nbsp; NATHAN HANCHEY</p>
  </section>
  <!-- About Section -->
  <section class="about" id="about">
	 
	  
	  
    <h2 class="hidden">About</h2>
	<form id="form-device1" name="form-device1" method="post">
    <p class="text_column"> 
	DEVICE NAME 1
	<br>
	STATUS: <span style="	color: #00D80D ">COMMAND RECEIVED</span>
	<br>
	<br>
	POWER&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<input type="button" name="device1-power" id="device1-power" value="SEND">
	<br>
	VOLUME UP&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
		<input type="button" name="device1-volup" id="device1-volup" value="SEND">
    <br>
	VOLUME DOWN&nbsp; &nbsp; &nbsp; &nbsp;
		<input type="button" name="device1-voldown" id="device1-voldown" value="SEND">
	<br>
	CHANNEL UP&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<input type="button" name="device1-chup" id="device1-chup" value="SEND">
	<br>
	CHANNEL DOWN&nbsp; &nbsp;&nbsp;
		<input type="button" name="device1-chdown" id="device1-chdown" value="SEND">
    </p>	
	</form>
    <form id="form-device1" name="form-device1" method="post">
    <p class="text_column"> 
	DEVICE NAME 2
	<br>
	STATUS: <span style="	color: #E3070A ">COMMAND SENT</span> <br>
	<br>
	POWER&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<input type="button" name="device1-power" id="device1-power" value="SEND">
	<br>
	TEMP UP&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
<input type="button" name="device1-volup" id="device1-volup" value="SEND">
    <br>
	TEMP DOWN&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type="button" name="device1-voldown" id="device1-voldown" value="SEND">
	
    </p>	
	</form>
	  
    <p class="text_column">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
  </section>
 
  <!-- Stats Gallery Section -->
  <!-- Parallax Section -->
  <section class="banner">
    <h2 class="parallax">ABOUT THE PROJECT&nbsp;</h2>
    <p class="parallax_description">We created this project to fulfill the requirements for our CIS350 course and learn from one another in our group by combining computer science and computer engineering students to create an interesting yet functional system within our 7 week time constraint. This webpage updates a SQL table when an action iis submitted and an&nbsp; ESP32 microcontroller polls the database for a new action and then writes a confirmation of receipt back to the database to update the webpage.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
  </section>
  <!-- More Info Section -->
  <!-- Footer Section -->
  <!-- Copyrights Section -->
  <div class="copyright"> <strong>created 2021 summer semester&nbsp;&nbsp;</strong></div>
</div>
<!-- Main Container Ends -->
</body>
</html>
