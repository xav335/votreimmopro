<?php require_once '../inc/inc.config.php';?>
<?php
require '../admin/classes/Newsletter.php';

if (!empty($_GET)){
	$newsletter = new Newsletter();
	$newsletter->journalNewsletterTrack($_GET['id']);
	$newsletter = null;
}