<?php
require_once("StorageManager.php");
class Offre_type_bien_part extends StorageManager {

	public function __construct(){

	}
	
	public function getListe( $tab=array(), $debug=false ){
		$this->dbConnect();
		$requete = "SELECT * FROM `offre_type_bien_part`" ;
		
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
		$result = mysqli_query( $this->mysqli, $requete );
		while( $row = mysqli_fetch_assoc( $result ) ) {
			$new_array[] = $row;
		}
		$this->dbDisConnect();
		return $new_array;
	}
	
	public function load( $num_offre=0, $num_type_bien=0, $debug=false ) {
		//if ( $debug ) echo "num_offre : " . $num_offre . "<br>";
		//if ( $debug ) echo "num_type_bien : " . $num_type_bien . "<br>";
		
		$this->dbConnect();
		$requete = "SELECT * FROM `offre_type_bien_part` 
			WHERE num_offre = " . intval( $num_offre ) . "
			AND num_type_bien = " . intval( $num_type_bien );
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
			$sql = "INSERT INTO `offre_type_bien_part`
				(`num_offre`, `num_type_bien`)
				VALUES (
				". intval( $value[ "num_offre" ] ) .",
				". intval( $value[ "num_type_bien" ] ) ."
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
	
	public function supprimer( $num_offre=0, $num_type_bien=0, $debug=false ) {
		$this->dbConnect();
		$this->begin();
		try {
			$sql = "DELETE FROM `offre_type_bien_part` 
					WHERE `num_offre` > 0";
			if ( intval( $num_offre ) > 0 ) $sql .= " AND `num_offre`=" . intval( $num_offre );
			if ( intval( $num_type_bien ) > 0 ) $sql .= " AND `num_type_bien`=" . intval( $num_type_bien );
			if ( $debug ) echo $sql . "<br>";
			else {
				$result = mysqli_query( $this->mysqli, $sql );
					
				if ( !$result ) {
					throw new Exception($sql);
				}
			}
	
			$this->commit();
	
		}
		catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
	
		$this->dbDisConnect();
	}
	
}