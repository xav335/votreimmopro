<?php
require_once("StorageManager.php");
class Type_bien extends StorageManager {

	public function __construct(){

	}
	
	public function getListe( $tab=array(), $debug=false ){
		$this->dbConnect();
		$requete = "SELECT * FROM `type_bien`" ;
		
		if ( $tab[ "where" ] == '' ) {
			$requete .= " WHERE num_type_bien > 0";
			
			if ( !empty( $tab ) ) {
				foreach( $tab as $champ => $val ) {
					if ( $champ != "champ" && $champ != "order_by" && $champ != "sens" )
						$requete .= " AND " . $champ . " = '" . addslashes( $val ) . "'";
				}
			}
			
			$order_by = ( $tab[ "order_by" ] != "" ) ? $tab[ "order_by" ] : "num_type_bien";
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
	
	public function load( $num_type_bien, $debug=false ) {
		 $this->dbConnect();
		if (!isset($num_type_bien)){
			$requete = "SELECT * FROM `type_bien` ORDER BY date_news DESC" ;
		} else {
			$requete = "SELECT * FROM `type_bien` WHERE num_type_bien=" . intval( $num_type_bien ) ;
		}
		if ( $debug ) echo $requete . "<br>";
		$result = mysqli_query( $this->mysqli, $requete );
		
		$new_array = null;
		while( $row = mysqli_fetch_assoc( $result ) ){
			$new_array[] = $row;
		}
		$this->dbDisConnect();
		return $new_array;
	}
	
}