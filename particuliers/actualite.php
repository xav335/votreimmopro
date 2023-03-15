<? 
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/News_part.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/utils.php" ;
	session_start();
	
	$debug = false;
	
	$news = new News_part();
	$result = $news->newsGet( '', $debug );
	//print_r($result);
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


        <!-- Actualité -->
        <div class="row actualite">
            <h1>Actualité</h1>
            <ul>
                <?
                if (!empty($result)) :
                    foreach ($result as $value) :
                        $mon_image = ($value["image1"] != '' && file_exists($_SERVER['DOCUMENT_ROOT'] . "/particuliers/photos/news" . $value["image1"]))
                            ? "/particuliers/photos/news" . $value["image1"]
                            : "/img/default.png"; ?>
                        <li class="row">
                            <div class='large-3 columns' >
                                <img src='<? echo $mon_image ?>' alt=''/>
                            </div>
                            <div class='large-9 columns'>
                                <h4><? echo $value["titre"] ?> . "</h4>
                                <h5><? echo traitement_datetime_affiche($value["date_news"]) ?></h5>
                                <p><? echo nl2br($value["contenu"]) ?></p>
                                <? if (isset($value["accroche"])) : ?>
                                    <p><a href="<? echo ($value["accroche"]) ?>" target="_blank">En savoir plus...</a></p>
                                <? endif; ?>
                            </div>
                        </li>
                    <?php
                    endforeach;
                endif; ?>

            </ul>
        </div>
        <!-- End Actualité -->
		
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
				$('.header .menu a:nth-child(3)').addClass('active');
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
