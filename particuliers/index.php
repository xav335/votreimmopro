<?
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_part.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_type_bien_part.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_image_part.php" ;
    require $_SERVER['DOCUMENT_ROOT'] .'/admin/classes/News_part.php';
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/utils.php" ;
	session_start();
	
	$debug = false;
	
	$offre = new Offre_part();
	$offre_type_bien = new Offre_type_bien_part();
	$offre_image = new Offre_image_part();
	
	$mon_action = $_POST[ "mon_action" ];
	$anti_spam = $_POST[ "as" ];


    /////////////////////////  GOOGLE CAPTCHA //////////////////////////
    // Ma clé privée
    //$secret = "6Le4bsYUAAAAAL-nUWFWqRsAelcnrspXQWcidBZx"; //prod
    $secret = "6LdhMg4lAAAAAAAd23Z9ryv3EkzAX72kfs_fD64d"; //localxav

    // Paramètre renvoyé par le recaptcha
    $response = $_POST['g-recaptcha-response'];
    // On récupère l'IP de l'utilisateur
    $remoteip = $_SERVER['REMOTE_ADDR'];
    $api_url = "https://www.google.com/recaptcha/api/siteverify?secret="
        . $secret
        . "&response=" . $response
        . "&remoteip=" . $remoteip;
    //print_r($api_url);
    $decode = json_decode(file_get_contents($api_url), true);
    //print_r($decode);
    error_log(date("Y-m-d H:i:s") . " : " . $_POST['email'] . "BeforeFORM\n", 3, "spy.log");

	
	// ---- Actions à mener --------------------------- //
	if ( $mon_action == "poster" && $decode['success'] == true) {
		//echo "On poste...<br>";
		
	    error_log(date("Y-m-d H:i:s") ." : ". $_POST['email'] .  " FromHome\n", 3, "spy.log");
	    
		$entete = "From: ". $_POST[ "nom"] ." <". $_POST[ "email"]. ">\n";
		$entete .= "MIME-version: 1.0\n";
		$entete .= "Content-type: text/html; charset= iso-8859-1\n";
		//$entete .= "Bcc:webmaster@worldselectholidays.com\n";
		//echo "Entete :<br>" . $entete . "<br><br>";
		
		$sujet = utf8_decode( "Demande d'estimation " );
		
		//$_to = "NePasRepondre@votreimmopro.com";
		$_to = "fjavi.gonzalez@gmail.com";
		//$_to = "contact@votreimmopro.com";
		//echo "Envoi du message à : " . $_to . "<br><br>";
		
		$message = "Bonjour,<br><br>";
		$message .= "La personne suivante souhaite estimer un bien :<br>";
		$message .= "Nom : <b>" . $_POST[ "nom" ] . "</b><br>";
		$message .= "E-mail / Téléphone : <b>" . $_POST[ "email" ] . " / " . $_POST[ "tel" ] . "</b><br>";
		$message .= "Type de bien : <b>" . $_POST[ "type_bien" ] . "</b><br>";
		$message .= "Surface : <b>" . $_POST[ "surface" ] . "</b><br>";
		$message .= "Ville : <b>" . $_POST[ "ville" ] . "</b><br><br>";
		$message .= "Cordialement.";
		$message = utf8_decode( $message );
		if ( $debug ) echo $message;
		
		mail( $_to, $sujet, stripslashes( $message ), $entete );
	} else {
        // C'est un robot ou le code de vérification est incorrecte
        error_log(date("Y-m-d H:i:s") . " : " . $_POST['email'] . "FAIL\n", 3, "spy.log");
    }
	// ------------------------------------------------ //
	
	
	// ---- Liste des offres à la une ----------------- //
	if ( 1 == 1 ) {
		unset( $recherche );
		$recherche[ "a_la_une" ] = "oui";
		$liste_offre = $offre->getListe( $recherche, $debug );
	}
	// ------------------------------------------------ //
	
?>

<!doctype html>
<html class="no-js" lang="fr">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Votre Immo Pro:votre partenaire en immobilier d’entreprise</title>
		<?php include('include/meta.php'); ?>
		<link rel="stylesheet" href="css/foundation.css" />
	    <link rel="stylesheet" href="js/vendor/swiper/css/swiper.min.css">
		<link rel="stylesheet" href="style.css" />
		<script src="js/vendor/modernizr.js"></script>
	</head>
	
	<body>

		<?
		// ---- Header de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/particuliers/include/header.php" );
		?>
		
		<!-- Slider -->
		<div>
            <div class="slogan">


                <h4>
                Votreimmopro est à votre
                écoute et met tout en
                oeuvre pour vous
                accompagner dans la
                réussite de votre projet
                immobilier.<br>

                Notre philosophie s’appuie
                sur 4 piliers.<br>
                - Le sur-mesure<br>
                - l’exigence<br>
                - La confiance<br>
                - La confidentialité</h4>

            </div>

            <form method="post" id="formulaire" action="index.php" class="estimation">
                <input type="hidden" name="mon_action" value="poster" />
                <input type="hidden" name="as" value="" />

                <h2>Estimer un bien</h2>
                <label><input type="text" name="nom" placeholder="Nom" /></label>
                <label><input type="email" name="email" placeholder="e-mail" required /></label>
                <label><input type="tel" name="tel" placeholder="Téléphone" /></label>
                <div class="row collapse">
                    <div class="large-6 columns">
                        <select name="type_bien" id="type">
                            <option value="">Type de bien</option>
                            <option value="Maison">Maison</option>
                            <option value="Appartement">Appartement</option>
                            <option value="Terrain">Terrain</option>
                        </select>
                    </div>
                    <div class="large-6 columns">
                        <label><input type="text" name="surface" placeholder="Surface (m2)" /></label>
                    </div>
                </div>
                <label><input type="text" name="ville" placeholder="Ville" /></label>
                <button class="g-recaptcha" data-sitekey="6LdhMg4lAAAAAFEXkAf5TRTFYY5JZJ7gTN1mwUlt"
                        data-callback="onSubmit" >Estimer mon bien</button>
            </form>
            <script type="text/javascript">
                function onSubmit(token) {
                    console.log(token);
                    document.getElementById("formulaire").submit();
                }
            </script>

            <div class="swiper-slider">
				<div class="motif"></div>
				<div class="swiper-wrapper">
					<div class="swiper-slide" style="background-image:url('img/slider-04.jpg');"></div>
					<div class="swiper-slide" style="background-image:url('img/slider-03.jpg');"></div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>
		</div>
		<!-- End Slider -->
		
		<!-- Offres à la une -->
		<div class="row offres-une">
			<h1>Offres à la une</h1>
			<div class="swiper-offres">
				<div class="swiper-wrapper">
					<?
					// ---- Affichage des offres "A la une" ---------------- //
					if ( !empty( $liste_offre ) ) {
						foreach ( $liste_offre as $_offre ) { 
							
							// ---- Type de bien --------- //
							if ( 1 == 1 ) {
								unset( $recherche );
								$recherche[ "num_offre" ] = $_offre[ "num_offre" ];
								$liste_type_bien = $offre_type_bien->getListe( $recherche, $debug );
								$num_type_bien = ( !empty( $liste_type_bien ) ) ? $liste_type_bien[ 0 ][ "num_type_bien" ] : 0;
								
								if ( $num_type_bien == 1 ) $type_bien = "<div class='type'>Location</div>\n";
								else if ( $num_type_bien == 2 ) $type_bien = "<div class='type'>Vente</div>\n";
								else if ( $num_type_bien == 3 ) $type_bien = "<div class='type'>Investisseur</div>\n";
								else $type_bien = '';
							}
							
							// ---- Image par défaut ----- //
							$image_defaut = $offre_image->getImageDefaut( $_offre[ "num_offre" ], $debug );
							//print_pre( $image_defaut );
							
							echo "<div id='" . $_offre[ "num_offre" ] . "' class='swiper-slide pointer'>\n";
							echo $type_bien;
							echo "	<img src='/particuliers/photos/offre/vignette" . $image_defaut[ "fichier" ] . "' alt='' />\n";
							echo "	<h2>" . $_offre[ "titre" ] . "</h2>\n";
							echo "	<p>" . couper_correctement( $_offre[ "description" ], 100, ' ', false ) . " ...</p>\n";
							if ( $num_type_bien == 1 ){
							     echo "	<div class='prix'>" . number_format( $_offre[ "prix" ], 0, '', ' ' ) . " € </div>\n";
							} else {
							    echo "	<div class='prix'>" . number_format( $_offre[ "prix" ], 0, '', ' ' ) . " € FAI</div>\n";
							}    
							echo "</div>\n";
						}
					}
					// ----------------------------------------------------- //
					?>
					
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
		<!-- End Offres à la une -->
		
		<?
		// ---- Footer de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/particuliers/include/footer.php" );
		?>



		<script src="js/vendor/jquery.js"></script>
		<script src="js/foundation.min.js"></script>
	    <script src="js/vendor/swiper/js/swiper.min.js"></script>

		<script>
			
			// ---- Validation du formulaire de newsletter -------------- //
			if ( 1 == 1 ) {
				
				$( "#form_news" ).submit(function() {
					//alert( "validation..." );
					var erreur = 0;
					
					$.ajax({
						type: "POST",
						cache: false,
						url: '../ajax/ajax_newsletter.php?task=inscrire',
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
				$('.header .menu a:first-child').addClass('active');
			});

			var slidesP=3;
			if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
				slidesP=1;
			}
			
			var swiper = new Swiper('.swiper-slider', {
				pagination: '.swiper-pagination',
				paginationClickable: true
			});
			var swiper2 = new Swiper('.swiper-offres', {
				nextButton: '.swiper-button-next',
				prevButton: '.swiper-button-prev',
				slidesPerView: slidesP
			});
			
			$( ".pointer" ).click( function() {
				var val = $(this).attr( "id" );
				//alert( "click sur #" + val );
				
				window.location.href = "/particuliers/offre.php?id=" + val;
				return false;
			});

            /* Gestion du scroll et du menu */
            window.addEventListener('scroll', scrollEvent);
            window.addEventListener('DOMMouseScroll', scrollEvent); // Firefox
            function scrollEvent(evt) {
                var pos_top = (document.documentElement.scrollTop||document.body.scrollTop);
                if(pos_top < 98) {
                    $('.menu').removeClass('fixed');
                } else {
                    $('.menu').addClass('fixed');
                }
            };
            /* End Gestion du scroll et du menu */
		</script>
		
	</body>
</html>
