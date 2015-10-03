<?php
require_once("StorageManager.php");
class Offre extends StorageManager {

	public function __construct(){

	}
	
	public function getListe( $tab=array(), $debug=false ){
		$this->dbConnect();
		$requete = "SELECT * FROM `offre`" ;
		
		if ( $tab[ "where" ] == '' ) {
			$requete .= " WHERE num_offre > 0";
			
			if ( !empty( $tab ) ) {
				foreach( $tab as $champ => $val ) {
					if ( $champ != "champ" && $champ != "order_by" && $champ != "sens" )
						$requete .= " AND " . $champ . " = '" . addslashes( $val ) . "'";
				}
			}
			
			$order_by = ( $tab[ "order_by" ] != "" ) ? $tab[ "order_by" ] : "num_offre";
			$sens = ( $tab[ "sens" ] != "" ) ? $tab[ "sens" ] : "ASC";
			$requete .= " ORDER BY " . $order_by . " " . $sens;
		}
		else $requete .= $tab[ "where" ];
		
		if ( $debug ) print_r( $requete );
		
		$new_array = null;
		$result = mysqli_query($this->mysqli,$requete);
		while( $row = mysqli_fetch_assoc( $result)){
			$new_array[] = $row;
		}
		$this->dbDisConnect();
		return $new_array;
	}
	
	public function getListeAvecTypeBien( $tab=array(), $debug=false ){
		$this->dbConnect();
		$requete = "SELECT * FROM `offre` " ;
		$requete .= "INNER JOIN `offre_type_bien` ON offre_type_bien.num_offre = offre.num_offre" ;
		
		if ( $tab[ "where" ] == '' ) {
			$requete .= " WHERE offre.num_offre > 0";
			
			if ( !empty( $tab ) ) {
				foreach( $tab as $champ => $val ) {
					if ( $champ != "champ" && $champ != "order_by" && $champ != "sens" )
						$requete .= " AND " . $champ . " = '" . addslashes( $val ) . "'";
				}
			}
			
			$order_by = ( $tab[ "order_by" ] != "" ) ? $tab[ "order_by" ] : "offre.num_offre";
			$sens = ( $tab[ "sens" ] != "" ) ? $tab[ "sens" ] : "ASC";
			$requete .= " ORDER BY " . $order_by . " " . $sens;
		}
		else $requete .= $tab[ "where" ];
		
		if ( $debug ) print_r( $requete );
		
		$new_array = null;
		$result = mysqli_query($this->mysqli,$requete);
		while( $row = mysqli_fetch_assoc( $result)){
			$new_array[] = $row;
		}
		$this->dbDisConnect();
		return $new_array;
	}
	
	public function load( $num_offre, $debug=false ) {
		$this->dbConnect();
		$requete = "SELECT * FROM `offre` WHERE num_offre=" . intval( $num_offre ) ;
		if ( $debug ) echo $requete . "<br>";
		$result = mysqli_query( $this->mysqli, $requete );
		
		$new_array = null;
		while( $row = mysqli_fetch_assoc( $result ) ){
			$new_array[] = $row;
		}
		$this->dbDisConnect();
		return $new_array;
	}
	
	public function ajouter( $value, $debug=false ) {
		$this->dbConnect();
		$this->begin();
		
		try {
			( $value[ 'online' ] == 'oui' ) ? $online = "oui" : $online = "non";
			( $value[ 'a_la_une' ] == 'oui' ) ? $a_la_une = "oui" : $a_la_une = "non";
			
			$sql = "INSERT INTO `offre`
				(`titre`, `surface`, `description`, `prix`, `a_la_une`, `online`)
				VALUES (
				'". addslashes( $value[ "titre" ] ) ."',
				". intval( $value[ "surface" ] ) .",
				'". addslashes( $value[ "description" ] ) ."',
				". intval( $value[ "prix" ] ) .",
				'". $online ." ',
				'". $a_la_une ." '
			);";
			if ( $debug ) echo $sql . "<br>";
			else {
				$result = mysqli_query( $this->mysqli, $sql );
				
				if ( !$result ) {
					throw new Exception( $sql );
				}
				$id_record = mysqli_insert_id( $this->mysqli );
			}
			
			$this->commit();
		
		} catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
		$this->dbDisConnect();
		return $id_record;
	}
	
	public function modifier( $value, $debug=false ) {
		$this->dbConnect();
		$this->begin();
		try {
			( $value[ 'online' ] == 'oui' ) ? $online = "oui" : $online = "non";
			( $value[ 'a_la_une' ] == 'oui' ) ? $a_la_une = "oui" : $a_la_une = "non";
			
			$sql = "UPDATE `offre` SET
				`titre` = '" . addslashes( $value[ "titre" ] ) . "', 
				`surface` = " . intval( $value[ "surface" ] ) . ", 
				`description` = '" . addslashes( $value[ "description" ] ) . "',
				`prix` = " . intval( $value[ "prix" ] ) . ",
				`a_la_une` = '" . $a_la_une ."'	 ,
				`online` = '" . $online ."'	 
				WHERE `num_offre` = " . $value[ "num_offre" ] . ";";
			
			if ( $debug ) echo $sql . "<br>";
			else {
				$result = mysqli_query($this->mysqli,$sql);
				
				if (!$result) {
					throw new Exception($sql);
				}
			}
		
			$this->commit();
		
		} catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
		
		return $value[ "num_offre" ];
		$this->dbDisConnect();
	}
	
	public function supprimer( $num_offre, $debug=false ) {
		if ( intval( $num_offre ) <= 0 ) return false;
		
		// ---- Chargement de l'offre --------------------------- //
		$data = $this->load( $num_offre, $debug );
		//print_pre( $data );
		
		// ---- Suppression des images associées ---------------- //
		if ( 1 == 1 ) {
			$offre_image = new Offre_image();
			
			unset( $recherche );
			$recherche[ "num_offre" ] = $num_offre;
			$liste_image = $offre_image->getListe( $recherche, $debug );
			
			if ( !empty( $liste_image ) ) {
				foreach( $liste_image as $_image ) {
					$offre_image->supprimer( $_image[ "num_image" ], $debug );
				}
			}
		}
		// ------------------------------------------------------ //
		
		// ---- Suppression du fichier PDF ---------------------- //
		if ( $data[ 0 ][ "fichier_pdf" ] != '' ) {
			$fichier_a_supprimer = $_SERVER['DOCUMENT_ROOT'] . "/fichier/pdf" . $data[ 0 ][ "fichier_pdf" ];
			if ( file_exists( $fichier_a_supprimer ) ) {
				if ( $debug ) echo "On supprime " . $fichier_a_supprimer . "<br>\n";
				if ( !$debug ) unlink( $fichier_a_supprimer );
			}
		}
		// ------------------------------------------------------ //
		
		$this->dbConnect();
		$this->begin();
		try {
			
			// ---- Suppression de l'enregistrement ----------------- //
			$sql = "DELETE FROM .`offre` WHERE `num_offre`=" . $num_offre . ";";
			if ( $debug ) echo $sql . "<br>";
			else {
				$result = mysqli_query( $this->mysqli, $sql );
					
				if ( !$result ) {
					throw new Exception($sql);
				}
			}
	
			$this->commit();
	
		} catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
	
	
		$this->dbDisConnect();
	}
	
	public function setChamp( $champ, $valeur=0, $num_offre=0, $debug=false ) {
		if ( intval( $num_offre ) <= 0 )  return false;
		
		$this->dbConnect();
		$this->begin();
		try {
			$requete = "UPDATE `offre` SET";
			$requete .= " " . $champ . " = '" . $this->traiter_champ( $valeur ) . "'";
			$requete .= " WHERE `num_offre`=" . $num_offre . ";";
			$result = mysqli_query( $this->mysqli, $requete );
			
			if ( $debug ) echo $requete . "<br>";
			else {
				if ( !$result ) {
					throw new Exception( $requete );
				}
		
				$this->commit();
				return false;
			}
			
			return $num_offre;
	
		} catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
	
	
		$this->dbDisConnect();
	}
	
	private function traiter_champ( $texte='' ) {
		$texte = trim( $texte );
		$texte = addslashes( $texte );
		$texte = utf8_decode( $texte );
		
		return $texte;
	}
	
}