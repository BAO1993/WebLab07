<!DOCTYPE html>
<html>
	<head>
		<title>Grade Store</title>
		<link href="http://selab.hanyang.ac.kr/courses/cse326/2015/problems/pResources/gradestore.css" type="text/css" rel="stylesheet" />
	</head>

	<body>

<?php

if(isset($_POST['dbname']) && $_POST['dbname']!="" && isset($_POST['query']) && $_POST['query']!="")
{
	$dbname=$_POST['dbname'];
	$query=$_POST['query'];
	$name = new PDO("mysql:dbname=$dbname", "root", "root");
	$results=$name->query($query);
	$col=$results->columnCount();
	$row;
	if ($results > 0) {
	
?>


		<ul>
		<?php 
		
		foreach($results as $result) {
		$row=null;
			for($i=0;$i<$col;$i++) {
			if($row==null)
			{
				$row=$result[$i];
			}
			else{
			$row=$row."&nbsp;&nbsp;&nbsp;".$result[$i];
			}
			}
		
		?>
		<li><?=$row?></li>
		<?php
		}
		?>
		</ul>
		

<?php	
	}
}
else{
?>

	<h1>Sorry</h1>
	<p>Missing data.<a href="query.html">Try again?</a></p>
	
<?php  
}
?>

	</body>
</html>