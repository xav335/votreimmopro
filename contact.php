<? 
	require 'admin/classes/Contact.php';
	include_once( $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/utils.php" );
	
	$debug = false;
	
	$contact = new Contact();
	
	$mon_action = $_POST[ "mon_action" ];
	$anti_spam = $_POST[ "as" ];
	//print_pre( $_POST );
	
	// ---- Post du formulaire ------------------------------- //
	if ( $mon_action == "poster" && $anti_spam == '' ) {
		if ( $debug ) echo "On poste...<br>";
		
		// ---- Enregistrement dans "contact" -------- //
		if ( 1 == 1 ) {
			$num_contact = $contact->isContact( $_POST[ "email" ], $debug );
			
			unset( $val );
			$val[ "id"] = $num_contact;
			$val[ "name"] = $_POST[ "nom" ];
			$val[ "email"] = $_POST[ "email" ];
			$val[ "message"] = $_POST[ "message" ];
			$val[ "newsletter"] = $_POST[ "newsletter" ];
			$val[ "fromcontact"] = "on";
			if ( $num_contact <= 0 ) $contact->contactAdd( $val, $debug );
			else $contact->contactModify( $val, $debug );
		}
		// ------------------------------------------- //
		
		// ---- Envoi du mail à l'admin -------------- //
		if ( 1 == 1 ) {
			$entete = "From:Votre immo pro <NePasRepondre@votreimmopro.com>\n";
			$entete .= "MIME-version: 1.0\n";
			$entete .= "Content-type: text/html; charset= iso-8859-1\n";
			//$entete .= "Bcc:webmaster@worldselectholidays.com\n";
			//echo "Entete :<br>" . $entete . "<br><br>";
			
			$sujet = utf8_decode( "Prise de contact" );
			
			//$_to = "NePasRepondre@votreimmopro.com";
			//$_to = "fjavi.gonzalez@gmail.com";
			$_to = "contact@votreimmopro.com";
			//echo "Envoi du message à : " . $_to . "<br><br>";
			
			$message = "Bonjour,<br><br>";
			$message .= "La personne suivante a rempli le formulaire de contact de votre site :<br>";
			$message .= "Nom : <b>" . $_POST[ "nom" ] . " " . $_POST[ "prenom" ] . "</b><br>";
			$message .= "E-mail / Téléphone : <b>" . $_POST[ "email" ] . " / " . $_POST[ "tel" ] . "</b><br>";
			$message .= "Type de bien : <b>" . $_POST[ "type_bien" ] . "</b><br>";
			$message .= "Surface : <b>" . $_POST[ "surface" ] . "</b><br>";
			$message .= "Code postal : <b>" . $_POST[ "cp" ] . "</b><br>";
			$message .= "Ville : <b>" . $_POST[ "ville" ] . "</b><br>";
			$message .= "Message : <br><i>" . nl2br( $_POST[ "message" ] ) . "</i><br><br>";
			$message .= "Cordialement.";
			$message = utf8_decode( $message );
			if ( $debug ) echo $message;
			
			mail( $_to, $sujet, stripslashes( $message ), $entete );
			//exit();
		}
		// ------------------------------------------- //
		
	}
	// ------------------------------------------------------- //
?>

<!doctype html>
<html class="no-js" lang="fr">
	<head>
	    <?php include('inc/meta.php'); ?>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Votreimmopro.com | Contact</title>
		<link rel="stylesheet" href="css/foundation.css" />
	    <link rel="stylesheet" href="js/vendor/swiper/css/swiper.min.css">
		<link rel="stylesheet" href="style.css" />
		<script src="js/vendor/modernizr.js"></script>
	</head>
	
	<body class="contact">
		
		<?
		// ---- Header de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/include/header.php" );
		?>
		
		<!-- Google maps -->
		<div id="map-canvas"></div>
		<!-- End Google maps -->
		
		
		<!-- Contact -->
		<div class="row">
			<div class="large-12 columns">
				<h1>Contactez-nous</h1>
			</div>
			<div class="large-8 medium-8 small-12 columns">
				<form id="formulaire" method="post" action="contact.php">
					<input type="hidden" name="mon_action" id="mon_action" value="" />
					<input type="hidden" name="as" value="" />
					
					<div class="row">
						<div class="large-6 columns">
							<label><input type="text" name="nom" id="nom" placeholder="Nom" /></label>
						</div>
						<div class="large-6 columns">
							<label><input type="text" name="prenom" id="prenom" placeholder="Prénom" /></label>
						</div>
					</div>
					<div class="row">
						<div class="large-6 columns">
							<label><input type="text" name="email" id="email" placeholder="e-mail" /></label>
						</div>
						<div class="large-6 columns">
							<label><input type="tel" name="tel" id="tel" placeholder="Téléphone" /></label>
						</div>
					</div>
					<div class="row">
						<div class="large-6 columns">
							<select name="type_bien" id="type_bien">
								<option value="-">Type de bien</option>
								<option value="Bureau">Bureau</option>
								<option value="Bâtiment">Bâtiment</option>
								<option value="Terrain">Terrain</option>
							</select>
						</div>
						<div class="large-6 columns">
							<label><input type="text" name="surface" placeholder="Surface (m2)" /></label>
						</div>
					</div>
					<div class="row">
						<div class="large-4 columns">
							<label><input type="text" name="cp" placeholder="Code postal" /></label>
						</div>
						<div class="large-8 columns">
							<label><input type="text" name="ville" placeholder="Ville" /></label>
						</div>
					</div>
					<textarea name="message" id="message" rows="6" placeholder="Votre message"></textarea>
					<div class="large-12 columns coordonnees">
						<p><input type="checkbox" name="newsletter" value="on" />&nbsp;Je souhaite m'inscrire à votre newsletter</p>
					</div>
					<button>Envoyer votre demande</button>
				</form>
			</div>
			
			<div class="large-4 medium-4 small-12 columns coordonnees">
				<h3>Votre immo pro</h3>
				<p>
					40 Allée de la Pépinière<br/>
					33450 Saint-Sulpice-et-Cameyrac, France
				</p>
				<p>
					Tél. 05 57 57 57 57<br/>
					Fax. 05 57 57 57 58
				</p>
				<p>
					email : contact@votreimmopro.com
				</p>
			</div>
		</div>
		<!-- End Offres à la une -->
		
		<?
		// ---- Footer de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/include/footer.php" );
		?>
	
		<script src="js/vendor/jquery.js"></script>
		<script src="js/foundation.min.js"></script>
	    <script src="js/vendor/swiper/js/swiper.min.js"></script>
	    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
	    
		<script>
			
			// ---- Google Maps ----------------------------------------- //
			if ( 1 == 1 ) {
				
				var map;
				function initialize() {
					var mapOptions = {
						mapTypeId: google.maps.MapTypeId.ROADMAP,
						mapTypeControl: false,
						zoom: 11,
						scrollwheel: false,
						zoomControl: false,
						panControl: false,
						streetViewControl: false,
						scaleControl: false,
						overviewMapControl: false,
						center: new google.maps.LatLng(44.901272, -0.38138100000003305)
					};
					map = new google.maps.Map(document.getElementById('map-canvas'),
						mapOptions);
					var mapStyles = [
						{
							"featureType": "landscape",
							"stylers": [
								{ "visibility": "on" },
								{ "hue": "#ff0000" },
								{ "saturation": -100 },
								{ "lightness": 0 },
								{ "gamma": 1 }
							]
						},{
							"featureType": "water",
							"stylers": [
								{ "visibility": "on" },
								{ "hue": "#ff0000" },
								{ "saturation": -100 },
								{ "lightness": 0 },
								{ "gamma": 1 }
							]
						},{
							"featureType": "water",
							"elementType": "labels",
							"stylers": [
								{ "visibility": "on" }
							]
						},{
							"featureType": "administrative",
							"stylers": [
								{ "visibility": "on" },
								{ "hue": "#ff0000" },
								{ "saturation": -100 },
								{ "lightness": 0 },
								{ "gamma": 1 }
							]
						},{
							"featureType": "administrative",
							"elementType": "labels",
							"stylers": [
								{ "visibility": "on" }
							]
						},{
							"featureType": "poi",
							"stylers": [
								{ "visibility": "on" },
								{ "hue": "#ff0000" },
								{ "saturation": -100 },
								{ "lightness": 0 },
								{ "gamma": 1 }
							]
						},{
							"featureType": "road",
							"stylers": [
								{ "visibility": "on" },
								{ "hue": "#ff0000" },
								{ "saturation": -100 },
								{ "lightness": 0 },
								{ "gamma": 1 }
							]
						},{
							"featureType": "transit",
							"stylers": [
								{ "visibility": "on" },
								{ "hue": "#ff0000" },
								{ "saturation": -100 },
								{ "lightness": 0 },
								{ "gamma": 1 }
							]
						}
					];
					map.setOptions({styles: mapStyles});
					var icon = {
						path: 'M16.5,51s-16.5-25.119-16.5-34.327c0-9.2082,7.3873-16.673,16.5-16.673,9.113,0,16.5,7.4648,16.5,16.673,0,9.208-16.5,34.327-16.5,34.327zm0-27.462c3.7523,0,6.7941-3.0737,6.7941-6.8654,0-3.7916-3.0418-6.8654-6.7941-6.8654s-6.7941,3.0737-6.7941,6.8654c0,3.7916,3.0418,6.8654,6.7941,6.8654z',
						anchor: new google.maps.Point(16.5, 51),
						fillColor: '#ff1900',
						fillOpacity: 1,
						strokeWeight: 0,
						scale: 0.66
					};
					var marker = new google.maps.Marker({
						position: new google.maps.LatLng(44.901272, -0.38138100000003305),
						map: map,
						icon: icon,
						title: 'marker'
					});
				}
				google.maps.event.addDomListener(window, 'load', initialize);
				function checkResize(){
					var center = map.getCenter();
					google.maps.event.trigger(map, 'resize');
					map.setCenter(center);
				}
				window.onresize = checkResize;
			}
			// ---------------------------------------------------------- //
			
			// ---- Validation du formulaire ---------------------------- //
			if ( 1 == 1 ) {
				
				function initialiser() {
					$( "#nom" ).removeClass( "erreur" );
					$( "#prenom" ).removeClass( "erreur" );
					$( "#email" ).removeClass( "erreur" );
					$( "#tel" ).removeClass( "erreur" );
					$( "#message" ).removeClass( "erreur" );
				}
				
				function checkEmail( adr ) {
					if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(adr)) {
							return (true);
					}
					return (false);
				}
				
				$( "#formulaire" ).submit(function() {
					//alert( "validation..." );
					var erreur = 0;
					initialiser();
					
					if ( $.trim( $( "#nom" ).val() ) == '' ) {
						erreur = 1;
						$( "#nom" ).addClass( "erreur" );
					}
					
					if ( $.trim( $( "#prenom" ).val() ) == '' ) {
						erreur = 1;
						$( "#prenom" ).addClass( "erreur" );
					}
					
					if ( $.trim( $( "#email" ).val() ) == '' ) {
						erreur = 1;
						$( "#email" ).addClass( "erreur" );
					}
					else if ( !checkEmail( $.trim( $( "#email" ).val() ) ) ) {
						erreur = 1;
						$( "#email" ).addClass( "erreur" );
					}
					
					if ( $.trim( $( "#tel" ).val() ) == '' ) {
						erreur = 1;
						$( "#tel" ).addClass( "erreur" );
					}
					
					if ( $.trim( $( "#message" ).val() ) == '' ) {
						erreur = 1;
						$( "#message" ).addClass( "erreur" );
					}
					
					if ( erreur == 0 ) $( "#mon_action" ).val( "poster" );
					return ( erreur == 0 ) ? true : false;
				});
			}
			// ---------------------------------------------------------- //
			
			// ---- Validation du formulaire de newsletter -------------- //
			if ( 1 == 1 ) {
				
				$( "#form_news" ).submit(function() {
					//alert( "validation..." );
					var erreur = 0;
					
					$.ajax({
						type: "POST",
						cache: false,
						url: '/ajax/ajax_newsletter.php?task=inscrire',
						data: $( "#form_news" ).serialize(),
						error: function() { alert( "Une erreur s'est produite..." ); },
						success: function( data ){
							var obj = $.parseJSON( data );
							
							// Tout s'est bien passé!
							if ( !obj.error ) {
								
							}
							else {
								
							}
							
						}
					});
					
					return false;
				});
			}
			// ---------------------------------------------------------- //
			
			$(document).foundation();
			$(document).ready(function(){
				$('.header .menu a:last-child').addClass('active');
			});
			
			var swiper = new Swiper('.swiper-slider', {
				pagination: '.swiper-pagination',
				paginationClickable: true
			});
			var swiper2 = new Swiper('.swiper-offres', {
				nextButton: '.swiper-button-next',
				prevButton: '.swiper-button-prev',
				slidesPerView: 3
			});
		</script>
		
	</body>
</html>
