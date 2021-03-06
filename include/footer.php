	<? 
	require_once 'admin/classes/News.php';
	require_once 'admin/classes/utils.php';
	session_start();
	
	$debug = false;
	
	$news = new News();
	$result = $news->newsValidGet( $debug );
	//print_r($result);
	?>

	<div class="row fullwidth footer">
		<div class="row">
			<div class="large-8 medium-8 small-12 columns actualites">
				<h2>Actualité</h2>
				<ul>
					<?
					if (!empty($result)) {
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
						<div class="large-6 columns">
							<input type="email" name="email_news" value="" placeholder="Inscrivez-vous à la newsletter" />
						</div>
						<div class="large-6 columns">
							<button>OK</button>
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
				<a href="mentions-legales.php">Mentions légales</a>
				<a href="conditions-generales-utilisation.php">Conditions générales d’utilisation</a><br/>
				© 2015 - votreimmopro.com
			</div>
		</div>
	</div>