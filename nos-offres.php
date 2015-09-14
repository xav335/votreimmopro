<?
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_image.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/utils.php" ;
	session_start();
	
	$debug = false;
	
	$offre = new Offre();
	$offre_image = new Offre_image();
?>

<!doctype html>
<html class="no-js" lang="fr">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Votreimmopro.com | Nos offres</title>
		<link rel="stylesheet" href="css/foundation.css" />
	    <link rel="stylesheet" href="js/vendor/swiper/css/swiper.min.css">
		<link rel="stylesheet" href="style.css" />
		<script src="js/vendor/modernizr.js"></script>
	</head>
	
	<body>
		
		<?
		// ---- Header de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/include/header.php" );
		?>
		
		<!-- Nos Offres -->
		<div class="row offres">
			<h1>Nos Offres</h1>
			
			<ul class="tabs" data-tab role="tablist">
				<li class="tab-title active" role="presentation"><a href="#panel-location" role="tab" tabindex="0" aria-selected="true" aria-controls="panel-location">À la location</a></li>
				<li class="tab-title" role="presentation"><a href="#panel-vente" role="tab" tabindex="0" aria-selected="false" aria-controls="panel-vente">À la vente</a></li>
				<li class="tab-title" role="presentation"><a href="#panel-investisseur" role="tab" tabindex="0" aria-selected="false" aria-controls="panel-investisseur">Spéciales investisseurs</a></li>
			</ul>
			
			<div class="tabs-content">
				
				<?
				// ---- Offres dispo "A la location" ---------------------------- //
				if ( 1 == 1 ) {
					unset( $recherche );
					$recherche[ "num_type_bien" ] = 1;
					
					$result = $offre->getListeAvecTypeBien( $recherche, $debug );
					
					echo "<section role='tabpanel' aria-hidden='true' class='nos-offres content active' id='panel-location'>\n";
					if ( !empty( $result ) ) {
						foreach ( $result as $value ) { 
							
							// ---- Image par défaut ----- //
							$image_defaut = $offre_image->getImageDefaut( $value[ "num_offre" ], $debug );
							
							echo "	<a class='bien' href='offre.php?id=" . $value[ "num_offre" ] . "'>\n";
							echo "		<img src='/photos/offre/vignette" . $image_defaut[ "fichier" ] . "' alt='' />\n";
							echo "		<h2>" . $value[ "titre" ] . "</h2>\n";
							echo "		<p>" . couper_correctement( $value[ "description" ], 200, ' ', false ) . " ...</p>\n";
							echo "		<div class='prix'>" . number_format( $value[ "prix" ], 0, '', ' ' ) . " € FAI</div>\n";
							echo "	</a>\n";
						}
					}
					echo "</section>\n";
				}
				// -------------------------------------------------------------- //
				
				// ---- Offres dispo "A la vente" ------------------------------- //
				if ( 1 == 1 ) {
					unset( $recherche );
					$recherche[ "num_type_bien" ] = 2;
					
					$result = $offre->getListeAvecTypeBien( $recherche, $debug );
					
					echo "<section role='tabpanel' aria-hidden='true' class='nos-offres content' id='panel-vente'>\n";
					if ( !empty( $result ) ) {
						foreach ( $result as $value ) { 
							
							// ---- Image par défaut ----- //
							$image_defaut = $offre_image->getImageDefaut( $value[ "num_offre" ], $debug );
							
							echo "	<a class='bien' href='offre.php?id=" . $value[ "num_offre" ] . "'>\n";
							echo "		<img src='/photos/offre/vignette" . $image_defaut[ "fichier" ] . "' alt='' />\n";
							echo "		<h2>" . $value[ "titre" ] . "</h2>\n";
							echo "		<p>" . couper_correctement( $value[ "description" ], 200, ' ', false ) . " ...</p>\n";
							echo "		<div class='prix'>" . number_format( $value[ "prix" ], 0, '', ' ' ) . " € FAI</div>\n";
							echo "	</a>\n";
						}
					}
					echo "</section>\n";
				}
				// -------------------------------------------------------------- //
				
				// ---- Offres dispo "Investisseur" ----------------------------- //
				if ( 1 == 1 ) {
					unset( $recherche );
					$recherche[ "num_type_bien" ] = 3;
					
					$result = $offre->getListeAvecTypeBien( $recherche, $debug );
					
					echo "<section role='tabpanel' aria-hidden='true' class='nos-offres content' id='panel-investisseur'>\n";
					if ( !empty( $result ) ) {
						foreach ( $result as $value ) { 
							
							// ---- Image par défaut ----- //
							$image_defaut = $offre_image->getImageDefaut( $value[ "num_offre" ], $debug );
							
							echo "	<a class='bien' href='offre.php?id=" . $value[ "num_offre" ] . "'>\n";
							echo "		<img src='/photos/offre/vignette" . $image_defaut[ "fichier" ] . "' alt='' />\n";
							echo "		<h2>" . $value[ "titre" ] . "</h2>\n";
							echo "		<p>" . couper_correctement( $value[ "description" ], 200, ' ', false ) . " ...</p>\n";
							echo "		<div class='prix'>" . number_format( $value[ "prix" ], 0, '', ' ' ) . " € FAI</div>\n";
							echo "	</a>\n";
						}
					}
					echo "</section>\n";
				}
				// -------------------------------------------------------------- //
				?>
				
				<!--
				<section role="tabpanel" aria-hidden="true" class="nos-offres content" id="panel-vente">
					<div class="bien">
						<img src="img/photo-01.jpg" alt="" />
						<h2>Bordeaux Nord</h2>
						<p>Etiam blandit justo est, eget sollicitudin velit commodo non. Vestibulum eu velit enim. Morbi vulputate venenatis ante a commodo...</p>
						<div class="prix">500 000 € FAI</div>
					</div>
					<div class="bien">
						<img src="img/photo-02.jpg" alt="" />
						<h2>Bordeaux Nord</h2>
						<p>Etiam blandit justo est, eget sollicitudin velit commodo non. Vestibulum eu velit enim. Morbi vulputate venenatis ante a commodo...</p>
						<div class="prix">500 000 € FAI</div>
					</div>
					<div class="bien">
						<img src="img/photo-03.jpg" alt="" />
						<h2>Bordeaux Nord</h2>
						<p>Etiam blandit justo est, eget sollicitudin velit commodo non. Vestibulum eu velit enim. Morbi vulputate venenatis ante a commodo...</p>
						<div class="prix">500 000 € FAI</div>
					</div>
				</section>
				
				<section role="tabpanel" aria-hidden="true" class="nos-offres content" id="panel-investisseur">
					<div class="bien">
						<img src="img/photo-01.jpg" alt="" />
						<h2>Bordeaux Nord</h2>
						<p>Etiam blandit justo est, eget sollicitudin velit commodo non. Vestibulum eu velit enim. Morbi vulputate venenatis ante a commodo...</p>
						<div class="prix">500 000 € FAI</div>
					</div>
					<div class="bien">
						<img src="img/photo-02.jpg" alt="" />
						<h2>Bordeaux Nord</h2>
						<p>Etiam blandit justo est, eget sollicitudin velit commodo non. Vestibulum eu velit enim. Morbi vulputate venenatis ante a commodo...</p>
						<div class="prix">500 000 € FAI</div>
					</div>
					<div class="bien">
						<img src="img/photo-03.jpg" alt="" />
						<h2>Bordeaux Nord</h2>
						<p>Etiam blandit justo est, eget sollicitudin velit commodo non. Vestibulum eu velit enim. Morbi vulputate venenatis ante a commodo...</p>
						<div class="prix">500 000 € FAI</div>
					</div>
					<div class="bien">
						<img src="img/photo-03.jpg" alt="" />
						<h2>Bordeaux Nord</h2>
						<p>Etiam blandit justo est, eget sollicitudin velit commodo non. Vestibulum eu velit enim. Morbi vulputate venenatis ante a commodo...</p>
						<div class="prix">500 000 € FAI</div>
					</div>
				</section>
				-->
				
			</div>
		</div>
		<!-- End Nos Offres -->
		
		<?
		// ---- Footer de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/include/footer.php" );
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
				$('.header .menu a:nth-child(2)').addClass('active');
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
