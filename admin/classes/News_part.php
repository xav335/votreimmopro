<?php
require_once("StorageManager.php");
class News_part extends StorageManager {

	public function __construct(){

	}
	
	public function newsValidGet( $debug=false ){
		$this->dbConnect();
		$requete = "SELECT * FROM `news_part` WHERE online=1 ORDER BY `date_news` DESC" ;
		print_r($requete);
		
		$new_array = null;
		$result = mysqli_query($this->mysqli,$requete);
		while( $row = mysqli_fetch_assoc( $result)){
			$new_array[] = $row;
		}
		$this->dbDisConnect();
		return $new_array;
	}
	
	
	public function newsGet( $id, $debug=false ){
		 $this->dbConnect();
		if ( !isset( $id ) || intval( $id ) <= 0 ) {
			$requete = "SELECT * FROM `news_part` ORDER BY date_news DESC" ;
		} else {
			$requete = "SELECT * FROM `news_part` WHERE id_news=". $id ;
		}
		//print_r($requete);

		if ( $debug ) echo $requete . "<br>";
		$new_array = null;
		$result = mysqli_query($this->mysqli,$requete);
		while( $row = mysqli_fetch_assoc( $result)){
			$new_array[] = $row;
		}
		$this->dbDisConnect();
		return $new_array;
	}
	
	public function newsAdd($value){
		//print_r($value);
		//exit();
		 $this->dbConnect();
		$this->begin();
		
		try {
			($value['online']=='on') ? $online = 1 : $online = 0;
			$sql = "INSERT INTO  `news_part`
						(`date_news`, `titre`, `accroche`, `image1`, `contenu`, `online`)
						VALUES (
						'". $this->inserer_date($value['datepicker']) ."', 
						'". addslashes($value['titre']) ."',
						'". addslashes($value['accroche']) ."',
						'". addslashes($value['url1']) ."',
						'". addslashes($value['contenu']) ."',
						". $online ." 	
					);";
			$result = mysqli_query($this->mysqli,$sql);
			
			if (!$result) {
				throw new Exception($sql);
			}
			$id_record = mysqli_insert_id($this->mysqli);
			$this->commit();
		
		} catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
		$this->dbDisConnect();
		return $id_record;
	}
	
	public function newsModify($value){
		//print_r($value);
		//exit();
		
		 $this->dbConnect();
		$this->begin();
		try {
			($value['online']=='on') ? $online = 1 : $online = 0;
			$sql = "UPDATE  .`news_part` SET
					`date_news`='". $this->inserer_date($value['datepicker']) ."', 
					`titre`='". addslashes($value['titre']) ."', 
					`accroche`='". addslashes($value['accroche']) ."', 
					`image1`='". addslashes($value['url1']) ."',
					`contenu`='". addslashes($value['contenu']) ."',
					`online`=". $online ."		 
					WHERE `id_news`=". $value['id'] .";";
			$result = mysqli_query($this->mysqli,$sql);
			
			if (!$result) {
				throw new Exception($sql);
			}
		
			$this->commit();
		
		} catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
		
		
		$this->dbDisConnect();
	}
	
	public function newsDelete($value){
		//print_r($value);
		//exit();
	
		 $this->dbConnect();
		$this->begin();
		try {
			$sql = "DELETE FROM  .`news_part` 
					WHERE `id_news`=". $value .";";
			$result = mysqli_query($this->mysqli,$sql);
				
			if (!$result) {
				throw new Exception($sql);
			}
	
			$this->commit();
	
		} catch (Exception $e) {
			$this->rollback();
			throw new Exception("Erreur Mysql ". $e->getMessage());
			return "errrrrrrooooOOor";
		}
	
	
		$this->dbDisConnect();
	}
	
	
}