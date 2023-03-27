	<?
    //require $_SERVER['DOCUMENT_ROOT'] .'/admin/classes/News.php';
    //require $_SERVER['DOCUMENT_ROOT'] .'/admin/classes/utils.php';
	session_start();
	
	$debug = false;
	
	$news = new News_part();
	$result = $news->newsValidGet( $debug );
	//print_r($result);
	?>

	<div class="row fullwidth footer">
		<div class="row">
            <div class="large-2 medium-2 small-2 columns text-center" >
                <a href="https://www.fnaim.fr/" target="_blank"><img src="/img/fnaim2.png"></a>
                <a href="#"><img src="/img/logoPro.png"></a>
            </div>
			<div class="large-6 medium-6 small-12 columns actualites">
				<h2>Actualité</h2>
				<ul>
					<?
					if (!empty($result)) {
                        //print_r($result);
						$i=0;
						foreach ($result as $value) { 
							$i++;
							
							echo "<li>\n";
							echo "	<h4>" . $value[ "titre" ] . "</h4>\n";
							echo "	<p>" . nl2br( $value[ "contenu" ] ) . "</p>\n";
							echo "</li>\n";
						}
					}
					?>
				</ul>
				<div class="row">
				    <form id="form_news" method="post" action="#" class="newsletter">
				        <input type="hidden" name="as" value="" />
						<div class="large-9 columns">
							<input type="email" name="email_news" value="" placeholder="Inscrivez-vous à la newsletter" />
                            <button>OK</button>
                        </div>
						<div class="large-3 columns text-left">
                            &nbsp;
						</div>
					</form>
				</div>
			</div>
			<div class="large-4 medium-4 small-12 columns links">
				<a href="index.php">Qui sommes-nous</a>
				<a href="nos-offres.php">Nos offres à la location</a>
				<a href="nos-offres.php">Nos offres à la vente</a>
				<a href="nos-offres.php">Nos offres pour les investisseurs</a>
				<a href="actualite.php">Actualité</a>
				<a href="livre-d-or.php">Livre d’or</a>
				<a href="contact.php">Contact</a><br/>
				<a href="../mentions-legales.php">Mentions légales</a>
				<a href="../conditions-generales-utilisation.php">Conditions générales d’utilisation</a><br/>
				© 2023 - votreimmopro.com
                <br> <br>
			</div>
		</div>
	</div>