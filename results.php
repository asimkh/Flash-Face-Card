<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Results</title>
<style type="text/css">
	td{
		border-bottom:1px solid #DDD;
		padding:3px;
	}
</style>
</head>

<?php
require_once('connect.php');

$query = "SELECT * FROM people";

$result = mysql_query($query);
?>
<body>
<table cellpadding="0" cellspacing="0" style="font-size:11px; font-family:Arial, Helvetica, Sans-serif; width: 700px;">
<tr>
	<th>ID</th>
	<th>Friend Name</th>
	<th>Friend Email</th>
	<th>Sender's Name</th>
	<th>Sender's Email</th>
	<th style="width:90px">Image</th>
</tr>
<?php
while($row = mysql_fetch_object($result)){
?>
<tr>
	<td><?php echo $row->ID; ?></td>
	<td><?php echo $row->FriendName; ?></td>
	<td><?php echo $row->FriendEmail; ?></td>
	<td><?php echo $row->SenderName; ?></td>
	<td><?php echo $row->SenderEmail; ?></td>
	<td><img src="images/<?php echo $row->ImageName; ?>" title="<?php echo $row->FriendName;?>" alt="<?php echo $row->ImageName; ?>" style="width:90px;"/></td>	
</tr>
<?php	
}
?>
</table>
</body>
</html>
