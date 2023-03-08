<?
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_type_bien.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/Offre_image.php" ;
	require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/utils.php" ;
	session_start();
	

	
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
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/include/header.php" );
		?>
        <div class="row fullwidth home">
            <div class="large-6 text-center columns" id="professionnels">
                <h3><a href="professionnels/index.php">Immobilier d'entreprise</a></h3>
                &nbsp;<!-- Slider -->
                <a href="professionnels/index.php">
                    <div>
                        <div class="swiper-slider">
                            <div id="decopro" class="motif"></div>
                            <div class="swiper-wrapper">
                                <div class="swiper-slide" style="background-image:url('img/slider-02.jpg');"></div>

                            </div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </a>
                <!-- End Slider -->
            </div>


            <div class="large-6 text-center columns " id="particuliers">
                <h3><a href="particuliers/index.php">Espace particuliers</a></h3>
                &nbsp;<!-- Slider -->
                <a href="particuliers/index.php">
                <div>
                    <div class="swiper-slider">
                        <div id="decopart"  class="motif"></div>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" style="background-image:url('img/slider-04.jpg');"></div>

                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                </a>
                <!-- End Slider -->
            </div>


        </div>

		

		<?
		// ---- Footer de la page ------------------ //
		include_once( $_SERVER['DOCUMENT_ROOT'] . "/include/footer.php" );
		?>
	
		<script src="js/vendor/jquery.js"></script>
		<script src="js/foundation.min.js"></script>
	    <script src="js/vendor/swiper/js/swiper.min.js"></script>
	    
    <script>
        $(document).ready(function() {
            console.log('hello');
          // $('#particuliers').css({'background-color': '#fff'});


            $("#particuliers").mouseenter(function(){
                //...On ajoute une couleur de fond au div
                $('#particuliers').css({'background': '#FFFFFF19'});
                $("#decopart").attr('class', 'motif2');
            });
            $("#particuliers").mouseleave(function(){
                //...On ajoute une couleur de fond au div
                $('#particuliers').css({'background': '#191919FF'});
                $("#decopart").attr('class', 'motif');
            });

            $("#professionnels").mouseenter(function(){
                //...On ajoute une couleur de fond au div
                $('#professionnels').css({'background': '#FFFFFF19'});
                $("#decopro").attr('class', 'motif2');
            });
            $("#professionnels").mouseleave(function(){
                //...On ajoute une couleur de fond au div
                $('#professionnels').css({'background': '#191919FF'});
                $("#decopro").attr('class', 'motif');
            });

        });
    </script>


		
	</body>
</html>
