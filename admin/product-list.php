<?php include_once 'inc-auth-granted.php';?>
<?php include_once 'classes/utils.php';?>
<?php include_once 'classes/pagination.php';?>
<?php 
require 'classes/Catproduct.php';

	if (!empty($_POST)){
		$categ = $_POST['categorie'];
	} else {
		$categ = null;
	}
	//print_r($categ);
	try {
		$catproduct = new Catproduct();
		
		$total = $catproduct->productNumberGet($categ);
		//$result = $contact->contactGet(null, $offset, $count);
		
		$epp = 15; // nombre d'entrées à afficher par page (entries per page)
		$nbPages = ceil($total/$epp); // calcul du nombre de pages $nbPages (on arrondit à l'entier supérieur avec la fonction ceil())
		 
		// Récupération du numéro de la page courante depuis l'URL avec la méthode GET
		// S'il s'agit d'un nombre on traite, sinon on garde la valeur par défaut : 1
		$current = 1;
		if (isset($_GET['p']) && is_numeric($_GET['p'])) {
			$page = intval($_GET['p']);
			if ($page >= 1 && $page <= $nbPages) {
				// cas normal
				$current=$page;
			} else if ($page < 1) {
				// cas où le numéro de page est inférieure 1 : on affecte 1 à la page courante
				$current=1;
			} else {
				//cas où le numéro de page est supérieur au nombre total de pages : on affecte le numéro de la dernière page à la page courante
				$current = $nbPages;
			}
		}
		
		// $start est la valeur de départ du LIMIT dans notre requête SQL (dépend de la page courante)
		$start = ($current * $epp - $epp);
		
		// Récupération des données à afficher pour la page courante
		$result = $catproduct->productGet(null, $start, $epp, $categ);
		
		$catproduct->catproduitViewIterative(null);
		$catresult = $catproduct->tabView;
		//print_r($result);
		$catproduct =null;
	} catch (Exception $e) {
		echo 'Erreur contactez votre administrateur <br> :',  $e->getMessage(), "\n";
		$goldbook = null;
		exit();
	}	
	
	if (empty($result)) {
		$message = 'Aucun enregistrements';
	} else {
		$message = '';
	}

?>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<?php include_once 'inc-meta.php';?>
</head>
<body>	
	<?php require_once 'inc-menu.php';?>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<?php echo paginate('product-list.php', '?p=', $nbPages, $current); ?>
			</div>
		</div>
		<div class="row">
			<div class="row">
				<form name="formulaire" class="form-horizontal" method="POST"  action="product-list.php" >
				<div class="col-md-3">	
					<label  >&nbsp;Filtez par catégorie :</label>
				</div>
				<div class="col-md-6">		
					<select name="categorie" id="categorie">
					<option value="" selected>-- afficher tout --</option>
					<?
					foreach ($catresult as $value) { 
						$decalage = "";
						for ($i=0; $i<($value['level'] * 5); $i++) {
							$decalage .= "&nbsp;";
						}
						?>
						<option value="<?php echo $value['id'] ?>" <? if ( $categ ==  $value['id'] ) { ?> selected <? } ?>>
							<?=$decalage?><?php echo $value['label'] ?>
						</option>
						<?
					}
					?>
					</select>	
				</div>	
				<div class="col-md-3">		
					<button class="btn btn-success col-sm-3" type="submit" >Filtrer</button>
				</div>
				<br><br>
			</div>	
		</div>	
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">

				<table class="table table-hover table-bordered table-condensed table-striped" >
					<thead>
						<tr>
							
							<th class="col-md-1" style="">
								Ref
							</th>
							<th class="col-md-3" style="">
								Nom Produit
							</th>
							<th class="col-md-1" style="">
								Prix
							</th>
							<th class="col-md-3" style="">
								Catégorie
							</th>
							<th class="col-md-1" colspan="2" style="">
								Actions
							</th>
							
						</tr>
					</thead>
					<tbody>
						<?php 
						if (!empty($result)) {
							$i=0;
							foreach ($result as $value) { 
							$i++;
								//Catégries
								//print_r($value['categories']);
								$categs = '';
								if (!empty($value['categories'])) {
									foreach ($value['categories'] as $value2) {
										$categs .= '- '. $value2['catlabel'] .' <br> ';
									}
								} 
							?>
							<tr class="<?php if ($i%2!=0) echo 'info'?>">
								<td><?php echo $value['reference']?></td>
								<td><?php echo $value['label'] ?></td>
								<td><?php echo $value['prix']?></td>
								<td><?php echo $categs?></td>
								<td><a href="product-edit.php?id=<?php echo $value['id'] ?>"><img src="img/modif.png" width="30" alt="Modifier" ></a></td>
								<td>
									<div style="display: none;" class="supp<?php echo $value['id']?> alert alert-warning alert-dismissible fade in" role="alert">
								      <button type="button" class="close"  aria-label="Close" onclick="$('.supp<?php echo $value['id']?>').css('display', 'none');"><span aria-hidden="true">×</span></button>
								      <strong>Voulez vous vraiment supprimer ?</strong>
								      <button type="button" class="btn btn-danger" onclick="location.href='formprocess.php?reference=product&action=delete&id=<?php echo $value['id'] ?>'">Oui !</button>
								 	</div>
								<img src="img/del.png" width="20" alt="Supprimer" onclick="$('.supp<?php echo $value['id']?>').css('display', 'block');"> </td>
							</tr>
							<?php } ?>
						<?php } ?>	
					</tbody>
				</table>

				<h3><?php echo $message?></h3>
			</div>
			<?php echo paginate('product-list.php', '?p=', $nbPages, $current); ?>
		</div>
	</div>
</body>
</html>


