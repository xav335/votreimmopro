<?php
require $_SERVER['DOCUMENT_ROOT'] . '/admin/classes/Contact.php';
require $_SERVER['DOCUMENT_ROOT'] . "/admin/classes/News_part.php";
include_once($_SERVER['DOCUMENT_ROOT'] . '/admin/classes/utils.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/inc.config.php');

$debug = false;

$contact = new Contact();

//print_pre( $_POST );

/////////////////////////  GOOGLE CAPTCHA //////////////////////////
// Ma clé privée
//$secret = "6Le4bsYUAAAAAL-nUWFWqRsAelcnrspXQWcidBZx"; //prod
$secret = "6LdhMg4lAAAAAAAd23Z9ryv3EkzAX72kfs_fD64d"; //localxav

// Paramètre renvoyé par le recaptcha
$response = $_POST['g-recaptcha-response'];
// On récupère l'IP de l'utilisateur
$remoteip = $_SERVER['REMOTE_ADDR'];
$api_url = "https://www.google.com/recaptcha/api/siteverify?secret="
    . $secret
    . "&response=" . $response
    . "&remoteip=" . $remoteip;
print_r($api_url);
$decode = json_decode(file_get_contents($api_url), true);
print_r($decode);
error_log(date("Y-m-d H:i:s") . " : " . $_POST['email'] . "BeforeFORM\n", 3, "spy.log");

if ($decode['success'] == true) {
    error_log(date("Y-m-d H:i:s") . " : " . $_POST['email'] . "SUCCESS\n", 3, "spy.log");
    // ---- Post du formulaire ------------------------------- //
    //echo "On poste...<br>";

    // ---- Enregistrement dans "contact" -------- //
    if (1 == 1) {
        $num_contact = $contact->isContact($_POST["email"], $debug);

        unset($val);
        $val["id"] = $num_contact;
        $val["name"] = $_POST["nom"];
        $val["email"] = $_POST["email"];
        $val["message"] = $_POST["message"];
        $val["newsletter"] = $_POST["newsletter"];
        $val["fromcontact"] = "on";
        if ($num_contact <= 0) $contact->contactAdd($val, $debug);
        else $contact->contactModify($val, $debug);
    }
    // ------------------------------------------- //

    // ---- Envoi du mail à l'admin -------------- //
    if (1 == 1) {
        $entete = "From: " . $val["name"] . " <" . $val["email"] . ">\n";
        $entete .= "MIME-version: 1.0\n";
        $entete .= "Content-type: text/html; charset= iso-8859-1\n";
        $entete .= "Bcc:" . $mailBcc . "\n";
        //$entete .= "Bcc:webmaster@worldselectholidays.com\n";
        //echo "Entete :<br>" . $entete . "<br><br>";

        $sujet = utf8_decode("Prise de contact VOTREIMMOPRO.COM");

        //$_to = "NePasRepondre@votreimmopro.com";
        //$_to = "fjavi.gonzalez@gmail.com";
        $_to = $mailContact;
        //echo "Envoi du message à : " . $_to . "<br><br>";

        $message = "Bonjour,<br><br>";
        $message .= "La personne suivante a rempli le formulaire de contact de votre site :<br>";
        $message .= "Nom : <b>" . $_POST["nom"] . " " . $_POST["prenom"] . "</b><br>";
        $message .= "E-mail / Téléphone : <b>" . $_POST["email"] . " / " . $_POST["tel"] . "</b><br>";
        $message .= "Type de bien : <b>" . $_POST["type_bien"] . "</b><br>";
        $message .= "Surface : <b>" . $_POST["surface"] . "</b><br>";
        $message .= "Code postal : <b>" . $_POST["cp"] . "</b><br>";
        $message .= "Ville : <b>" . $_POST["ville"] . "</b><br>";
        $message .= "Message : <br><i>" . nl2br($_POST["message"]) . "</i><br><br>";
        $message .= "Cordialement.";
        $message = utf8_decode($message);
        if ($debug) echo $message;

        mail($_to, $sujet, stripslashes($message), $entete);
        //exit();
    }
    // ------------------------------------------- //

} else {
    // C'est un robot ou le code de vérification est incorrecte
    error_log(date("Y-m-d H:i:s") . " : " . $_POST['email'] . "FAIL\n", 3, "spy.log");
}
//////////////   FIN GOOGLE CAPTCHA ///////////////////

?>

<!doctype html>
<html class="no-js" lang="fr">
<head>
    <?php include('include/meta.php'); ?>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Votreimmopro.com | Contact</title>
    <link rel="stylesheet" href="css/foundation.css"/>
    <link rel="stylesheet" href="js/vendor/swiper/css/swiper.min.css">
    <link rel="stylesheet" href="style.css"/>
    <script src="js/vendor/modernizr.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>

<body class="contact">

<?php
// ---- Header de la page ------------------ //
include_once($_SERVER['DOCUMENT_ROOT'] . "/particuliers/include/header.php");
?>


<!-- Contact -->
<div class="row">
    <div class="large-12 columns">
        <h1>Contactez-nous</h1>
    </div>
    <div class="large-8 medium-8 small-12 columns">
        <form id="formulaire" method="post" action="contact.php">
            <div class="row">
                <div class="large-6 columns">
                    <label><input type="text" name="nom" id="nom" placeholder="Nom" required/></label>
                </div>
                <div class="large-6 columns">
                    <label><input type="text" name="prenom" id="prenom" placeholder="Prénom" required/></label>
                </div>
            </div>
            <div class="row">
                <div class="large-6 columns">
                    <label><input type="email" name="email" id="email" placeholder="e-mail" required/></label>
                </div>
                <div class="large-6 columns">
                    <label><input type="tel" name="tel" id="tel" placeholder="Téléphone" required/></label>
                </div>
            </div>
            <div class="row">
                <div class="large-6 columns">
                    <select name="type_bien" id="type_bien">
                        <option value="-">Type de bien</option>
                        <option value="Maison">Maison</option>
                        <option value="Appartement">Appartement</option>
                        <option value="Terrain">Terrain</option>
                    </select>
                </div>
                <div class="large-6 columns">
                    <label><input type="text" name="surface" placeholder="Surface (m2)"/></label>
                </div>
            </div>
            <div class="row">
                <div class="large-4 columns">
                    <label><input type="text" name="cp" placeholder="Code postal"/></label>
                </div>
                <div class="large-8 columns">
                    <label><input type="text" name="ville" placeholder="Ville"/></label>
                </div>
            </div>
            <textarea name="message" id="message" rows="6" placeholder="Votre message" required></textarea>
            <div class="large-12 columns coordonnees">
                <p><input type="checkbox" name="newsletter" value="on"/>&nbsp;Je souhaite m'inscrire à votre newsletter
                </p>
            </div>
            <div class="row">
                <!-- <div class="large-4 columns g-recaptcha" data-sitekey="6Le4bsYUAAAAAFIFRKYMtRNDcE2udNP3uDReY1B_"></div> -->
                <div class="large-4 columns">
              <button class="g-recaptcha" data-sitekey="6LdhMg4lAAAAAFEXkAf5TRTFYY5JZJ7gTN1mwUlt"
                            data-callback="onSubmit">Envoyer votre demande</button> localxav-->
                    <!-- <button class="g-recaptcha" data-sitekey="6Le4bsYUAAAAAFIFRKYMtRNDcE2udNP3uDReY1B_"
                data-callback="onSubmit">Envoyer votre demande</button> prod-->
                </div>
            </div>
        </form>
    </div>

    <div class="large-4 medium-4 small-12 columns coordonnees">
        <h3>Votre immo pro</h3>
        <p>
            40 Allée de la Pépinière<br/>
            33450 Saint-Sulpice-et-Cameyrac, France
        </p>
        <p>
            Tél 06.35.33.63.26
        </p>
        <p>
            email : contact@votreimmopro.com
        </p>
        <p>
            <a href="https://www.linkedin.com/company/votre-immo-pro/" target="_blank"><img alt="" src="img/linkin.png"></a>
        </p>
    </div>
</div>
<!-- End Offres à la une -->

<?php
// ---- Footer de la page ------------------ //
include_once($_SERVER['DOCUMENT_ROOT'] . "/particuliers/include/footer.php");
?>

<script src="js/vendor/jquery.js"></script>
<script src="js/foundation.min.js"></script>
<script src="js/vendor/swiper/js/swiper.min.js"></script>

<script type="text/javascript">
    var onloadCallback = function () {
        alert("grecaptcha is ready!");
    };

    function onSubmit(token) {
        console.log(token);
        document.getElementById("formulaire").submit();
    }
</script>

<script>
    // ---- Validation du formulaire ---------------------------- //
    if (1 == 1) {

        function initialiser() {
            $("#nom").removeClass("erreur");
            $("#prenom").removeClass("erreur");
            $("#email").removeClass("erreur");
            $("#tel").removeClass("erreur");
            $("#message").removeClass("erreur");
        }

        function checkEmail(adr) {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(adr)) {
                return (true);
            }
            return (false);
        }

        $("#formulaire").submit(function () {
            //alert( "validation..." );
            var erreur = 0;
            initialiser();

            if ($.trim($("#nom").val()) == '') {
                erreur = 1;
                $("#nom").addClass("erreur");
            }

            if ($.trim($("#prenom").val()) == '') {
                erreur = 1;
                $("#prenom").addClass("erreur");
            }

            if ($.trim($("#email").val()) == '') {
                erreur = 1;
                $("#email").addClass("erreur");
            } else if (!checkEmail($.trim($("#email").val()))) {
                erreur = 1;
                $("#email").addClass("erreur");
            }

            if ($.trim($("#tel").val()) == '') {
                erreur = 1;
                $("#tel").addClass("erreur");
            }

            if ($.trim($("#message").val()) == '') {
                erreur = 1;
                $("#message").addClass("erreur");
            }

            if (erreur == 0) $("#mon_action").val("poster");
            return (erreur == 0) ? true : false;
        });
    }
    // ---------------------------------------------------------- //

    // ---- Validation du formulaire de newsletter -------------- //
    if (1 == 1) {

        $("#form_news").submit(function () {
            //alert( "validation..." );
            var erreur = 0;

            $.ajax({
                type: "POST",
                cache: false,
                url: '/ajax/ajax_newsletter.php?task=inscrire',
                data: $("#form_news").serialize(),
                error: function () {
                    alert("Une erreur s'est produite...");
                },
                success: function (data) {
                    var obj = $.parseJSON(data);

                    // Tout s'est bien passé!
                    if (!obj.error) {

                    } else {

                    }

                }
            });

            return false;
        });
    }
    // ---------------------------------------------------------- //

    $(document).foundation();
    $(document).ready(function () {
        $('.header .menu a:last-child').addClass('active');
    });

    var swiper = new Swiper('.swiper-slider', {
        pagination: '.swiper-pagination',
        paginationClickable: true
    });
    var swiper2 = new Swiper('.swiper-offres', {
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 3
    });

    /* Gestion du scroll et du menu */
    window.addEventListener('scroll', scrollEvent);
    window.addEventListener('DOMMouseScroll', scrollEvent); // Firefox
    function scrollEvent(evt) {
        var pos_top = (document.documentElement.scrollTop || document.body.scrollTop);
        if (pos_top < 98) {
            $('.menu').removeClass('fixed');
        } else {
            $('.menu').addClass('fixed');
        }
    };
    /* End Gestion du scroll et du menu */
</script>

</body>
</html>
