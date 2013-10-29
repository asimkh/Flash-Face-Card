<?php
	require_once('connect.php');
	
	 // to
	$friend_name = $_REQUEST['friend_name'];
	$friend_email = $_REQUEST['friend_email'];
	//from
	$your_name = $_REQUEST['your_name'];
	$your_email = $_REQUEST['your_email'];
	$imgname = $_REQUEST['imgname'];
	
	$headers = "From: ".strip_tags($your_name)."\r\n";
	$headers .= "Reply-To: ".strip_tags($your_email)."\r\n";
	$headers .= "MIME-Version: 1.0\r\n";
	$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
	
	$subject = "$friend_name! sent you greeting card from Charag.com";
	
	$message = '
		<html>
			<body>
				<table style="text-align:center;">
					<tr>
						<td><a href="http://www.charag.com/card/"><img src="http://www.charag.com/card/images/'.$imgname.'" border="0" alt="Message"/></a></td>
					</tr>
					<tr>
						<td style="height:20px;">&nbsp;</td>
					</tr>
					<tr>
						<td><a href="http://www.charag.com/card/images/'.$imgname.'">Click here if you cannot see the message.</a></td>
						<br>
						<td><a href="http://www.charag.com/card/'.$imgname.'">Click here if you want to send greeting card from Charag.com</a></td>
					</tr>
				</table>
			</body>
		</html>';
		
		
		if(!mail($friend_email, $subject, $message, $headers)){
			var_dump($message);
			die('Error Sending Email');
		}else{
			$query = "INSERT INTO people (`FriendName`, `FriendEmail`, `SenderName`, `SenderEmail`, `ImageName`)"
			."\n VALUES('".$friend_name."', '".$friend_email."', '".$your_name."', '".$your_email."', '".$imgname."'); ";
			$result = mysql_query($query);
			if(!$result){
				die('Error Saving:'.mysql_error());
			}
		}
?>