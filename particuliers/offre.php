<?
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_part.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_image_part.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/utils.php" ;
    require $_SERVER['DOCUMENT_ROOT'] . '/admin/classes/News_part.php';
	session_start();
	
	$debug = false;
	
	$offre = new Offre_part();
	$offre_image = new Offre_image_part();
	$result = $offre->load( $_GET[ "id" ], $debug );
	//print_pre( $result );
	
	// ---- VERIFICATIONS PREALABLES --------------------------------- //
	if ( 1 == 1 ) {
		
		// ---- L'offre DOIT être en ligne pour être affiché ici! ------- //
		if ( $result[ 0 ][ "online" ] == "non" ) {
			if ( $debug ) echo "1 - Annonce OFFLINE!<br>";
			if ( !$debug ) header( "Location: /nos-offres.php" );
			exit();
		}
		
	}
	// --------------------------------------------------------------- //
	
	// ---- Informations à afficher ---------------------------------- //
	if ( 1 == 1 ) {
		
		// ---- Données de l'annonce ------------- //
		$titre = $result[ 0 ][ "titre" ];
		$surface = $result[ 0 ][ "surface" ];
		$description = nl2br( $result[ 0 ][ "description" ] );
		$prix = number_format( $result[ 0 ][ "prix" ], 0, '', ' ' );
		$fichier_pdf = $result[ 0 ][ "fichier_pdf" ];
		$num_type_bien = $result[ 0 ][ "num_type_bien" ];
		$type_bien="";
		switch ($num_type_bien) {
		    case 1:
		      $type_bien="Location";
		    break;
		    case 2:
		       $type_bien="Vente";
		    break;
		    case 3:
		       $type_bien="Spécial investisseurs";
		    break;
		    default:
		        $type_bien="";;
		    break;
		}
		
		// ---- Image par défaut ----- //
		$image_defaut = $offre_image->getImageDefaut( $result[ 0 ][ "num_offre" ], $debug );
		
		// ---- Liste des images ----- //
		if ( 1 == 1 ) {
			unset( $recherche );
			$recherche["num_offre"] = $result[ 0 ][ "num_offre" ];
			$liste_image = $offre_image->getListe( $recherche, $debug );
		}
		
	}
	// --------------------------------------------------------------- //
?>

<!doctype html>
<html class="no-js" lang="fr">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Votreimmopro.com | Offre</title>
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
		
		<!-- Offre -->
		<div class="row offre">
			<h1><?=$titre?></h1>
			<div class="large-6 columns">
				<a href="/particuliers/photos/offre/grande<?=$image_defaut[ "fichier" ]?>" class="fancybox photo-principale" rel="offre"><img src="/particuliers/photos/offre/normale<?=$image_defaut[ "fichier" ]?>" alt="" /></a>
				
				<div class="swiper-vignettes">
					<ul class="vignettes swiper-wrapper">
						<?
						// ---- Affichage des vignettes ------------------ //
						if ( !empty( $liste_image ) ) :
							foreach ( $liste_image as $_image ) : ?> 
								<li class="swiper-slide">
								    <a href="/particuliers/photos/offre/grande<?php echo $_image[ "fichier" ] ?>" class="fancybox" rel="offre">
								        <img src="/particuliers/photos/offre/vignette<?php echo $_image[ "fichier" ] ?>" alt='' /></a>
								</li>
					  <?php endforeach;
						endif;?>
					</ul>
					<div class="swiper-button-next vignettes-next"></div>
					<div class="swiper-button-prev vignettes-prev"></div>
				</div>
				<div class="prix"><?=$prix?> € <?php if ($num_type_bien!=1 ) echo "FAI" ?></div>
			</div>
			<div class="large-6 columns">
				<h4>Type d'offre</h4>
				<p><?php echo $type_bien?></p>
				<h4>Surface</h4>
				<p><?=$surface?> m<sup>2</sup></p>
				<h4>Descriptif du bien</h4>
				<p><?=$description?></p>
				
				<?
				// ---- PDF disponible --------------- //
				if ( $fichier_pdf != '' ) {
					echo "<h4>PDF disponible</h4>\n";
					echo "<p>\n";
					echo "	Télécharger ici notre fichier PDF :\n";
					echo "	<a href='/particuliers/fichier/pdf" . $fichier_pdf . "' target='_blank'><img src='/particuliers/img/pdf.png' /></a>\n";
					echo "</p>\n";
				}
				// ----------------------------------- //
				?>
				
			</div>
		</div>
		<!-- End Offre -->
		
		<?
		// ---- Footer de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/particuliers/include/footer.php" );
		?>
	
		<script src="js/vendor/jquery.js"></script>
		<script src="js/foundation.min.js"></script>
	    <script src="js/vendor/swiper/js/swiper.min.js"></script>
	    <script src="js/vendor/fancybox/jquery.mousewheel-3.0.6.pack.js"></script>
		<script src="js/vendor/fancybox/jquery.fancybox.js?v=2.1.5"></script>
		<script src="js/vendor/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
		<script src="js/vendor/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
		<script src="js/vendor/fancybox/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
		<link rel="stylesheet" type="text/css" href="js/vendor/fancybox/jquery.fancybox.css?v=2.1.5" media="screen" />
		<link rel="stylesheet" type="text/css" href="js/vendor/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
		<link rel="stylesheet" type="text/css" href="js/vendor/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
		
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
				$('.header .menu a:nth-child(2)').addClass('active');
				$('.fancybox').fancybox({
					helpers: {
						overlay: {
							locked: false
						}
					}
				});
				$('.vignettes a').hover(function(){
					var lien = $(this).attr('href');
					$('.photo-principale').attr('href',lien);
					$('.photo-principale img').attr('src',lien);
				});
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
			var swiper3 = new Swiper('.swiper-vignettes', {
				nextButton: '.vignettes-next',
				prevButton: '.vignettes-prev',
				slidesPerView: 3
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
