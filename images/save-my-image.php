<?php
   
   $fileName = $_GET['filename'];
   
   $fp = fopen( $fileName, 'wb' );
   
   fwrite( $fp, $GLOBALS['HTTP_RAW_POST_DATA'] );    
   
   fclose( $fp );
  
  include_once('../send.php');
?>
