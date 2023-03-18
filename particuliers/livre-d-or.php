<?
    require $_SERVER['DOCUMENT_ROOT'] . '/admin/classes/Goldbook.php';
    require $_SERVER['DOCUMENT_ROOT'] . '/admin/classes/Contact.php';
    require $_SERVER['DOCUMENT_ROOT'] . '/admin/classes/utils.php';
    require $_SERVER['DOCUMENT_ROOT'] . '/admin/classes/News_part.php';
	session_start();
	
	$debug = false;
	
	$goldbook = new Goldbook();
	$contact = new Contact();
	
	$mon_action = $_POST[ "mon_action" ];
	$anti_spam = $_POST[ "as" ];
	//print_pre( $_POST );
	
	// ---- Post du commentaire ---------------------------- //
	if ( $mon_action == "poster" && $anti_spam == '' ) {
		if ( $debug ) echo "On poste...<br>";
		
		// ---- Enregistrement dans "goldbook" ------- //
		if ( 1 == 1 ) {
			unset( $val );
			$val[ "datepicker"] = date( "d/m/Y" );
			$val[ "name"] = $_POST[ "nom" ];
			$val[ "email"] = $_POST[ "email" ];
			$val[ "message"] = $_POST[ "message" ];
			$goldbook->goldbookAdd( $val, $debug );
		}
		// ------------------------------------------- //
		
		// ---- Enregistrement dans "contact" -------- //
		if ( 1 == 1 ) {
			$num_contact = $contact->isContact( $_POST[ "email" ], $debug );
			
			unset( $val );
			$val[ "id"] = $num_contact;
			$val[ "name"] = $_POST[ "nom" ];
			$val[ "email"] = $_POST[ "email" ];
			$val[ "message"] = $_POST[ "message" ];
			$val[ "newsletter"] = $_POST[ "newsletter" ];
			$val[ "fromgoldbook"] = "on";
			if ( $num_contact <= 0 ) $contact->contactAdd( $val, $debug );
			else $contact->contactModify( $val, $debug );
		}
		// ------------------------------------------- //
		
		// ---- Envoi du mail à l'admin -------------- //
		if ( 1 == 1 ) {
		    error_log(date("Y-m-d H:i:s") ." : ". $_POST['email'] .  " FromGoldBook\n", 3, "spy.log");
		    
			$entete = "From: ". $val[ "name"] ." <". $val[ "email"]. ">\n";
			$entete .= "MIME-version: 1.0\n";
			$entete .= "Content-type: text/html; charset= iso-8859-1\n";
			//$entete .= "Bcc:webmaster@worldselectholidays.com\n";
			//echo "Entete :<br>" . $entete . "<br><br>";
			
			$sujet = utf8_decode( "Nouveau commentaire" );
			
			//$_to = "NePasRepondre@votreimmopro.com";
			//$_to = "fjavi.gonzalez@gmail.com";
			$_to = "contact@votreimmopro.com";
			//echo "Envoi du message à : " . $_to . "<br><br>";
			
			$message = "Bonjour,<br><br>";
			$message .= "La personne suivante a laissé un commentaire de votre site :<br>";
			$message .= "Nom : <b>" . $_POST[ "nom" ] . "</b><br>";
			$message .= "E-mail : <b>" . $_POST[ "email" ] . "</b><br>";
			$message .= "Message : <br><i>" . nl2br( $_POST[ "message" ] ) . "</i><br><br>";
			$message .= "Cordialement.";
			$message = utf8_decode( $message );
			if ( $debug ) echo $message;
			
			mail( $_to, $sujet, stripslashes( $message ), $entete );
			//exit();
		}
		// ------------------------------------------- //
		
	}
	// ----------------------------------------------------- //
	
	// ---- Liste des commentaires valides ----------------- //
	$result = $goldbook->goldbookValidGet();
	$goldbook = null;
?>

<!doctype html>
<html class="no-js" lang="fr">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>VotreImmoPro.com:votre partenaire en immobilier d’entreprise</title>
		<?php include('include/meta.php'); ?>
		<link rel="stylesheet" href="css/foundation.css" />
	    <link rel="stylesheet" href="js/vendor/swiper/css/swiper.min.css">
		<link rel="stylesheet" href="style.css" />
		<script src="js/vendor/modernizr.js"></script>
	</head>
	
	<body class="contact">
		
		<?
		// ---- Header de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/particuliers/include/header.php" );
		?>
		
		
		<!-- Livre d'Or -->
		<div class="row livre-or">
			<div class="large-7 columns">
				<h1>Livre d'or</h1>
				<ul>
					<?if (!empty($result)) :
						$i=0;
						foreach ($result as $value) : 
							$i++; ?>
							<li>
    							<p class="citation"><?php echo nl2br( $value[ "message" ] )?></p>
    							<p class="signature"><?php echo  $value[ "nom" ] ?></p>
							</li>
				  <?php endforeach;
					endif;?>
				</ul>
			</div>
			
			<div class="large-5 columns">
				<h1>Votre message</h1>
				<form id="formulaire" method="post" action="livre-d-or.php">
					<input type="hidden" name="mon_action" id="mon_action" value="" />
					<input type="hidden" name="as" value="" />
					
					<div class="row">
						<div class="large-12 columns">
							<label><input type="text" name="nom" id="nom" placeholder="Nom" /></label>
						</div>
						<div class="large-12 columns">
							<label><input type="text" name="email" id="email" placeholder="e-mail" /></label>
						</div>
					</div>
					<textarea name="message" id="message" rows="6" placeholder="Votre message"></textarea>
					<div class="large-12 columns">
						<p class="signature_gauche"><input type="checkbox" name="newsletter" value="on" />&nbsp;Je souhaite m'inscrire à votre newsletter</p>
					</div>
					<button>Poster votre commentaire</button>
				</form>
			</div>
		</div>
		<!-- End Livre d'Or -->
		
		<?
		// ---- Footer de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/particuliers/include/footer.php" );
		?>
	
		<script src="js/vendor/jquery.js"></script>
		<script src="js/foundation.min.js"></script>
	    <script src="js/vendor/swiper/js/swiper.min.js"></script>
	    
		<script>
			
			// ---- Validation du formulaire ---------------------------- //
			if ( 1 == 1 ) {
				
				function initialiser() {
					$( "#nom" ).removeClass( "erreur" );
					$( "#email" ).removeClass( "erreur" );
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
					
					if ( $.trim( $( "#email" ).val() ) == '' ) {
						erreur = 1;
						$( "#email" ).addClass( "erreur" );
					}
					else if ( !checkEmail( $.trim( $( "#email" ).val() ) ) ) {
						erreur = 1;
						$( "#email" ).addClass( "erreur" );
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
				$('.header .menu a:nth-child(4)').addClass('active');
			});
			
			/* Gestion du scroll et du menu */
			window.addEventListener('scroll', scrollEvent);
			window.addEventListener('DOMMouseScroll', scrollEvent); // Firefox
			function scrollEvent(evt) {
				var pos_top = (document.documentElement.scrollTop||document.body.scrollTop);
				if(pos_top < 58) {
					$('.menu').removeClass('fixed');
				} else {
					$('.menu').addClass('fixed');
				}
			};
			/* End Gestion du scroll et du menu */
			
		</script>
		
	</body>
</html>
