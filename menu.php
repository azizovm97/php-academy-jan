<?php
/*
  Recipe for one pan of carrot_cutlets  (6 ):
 1 carrots,
 1 egg,
 100 ml milk,
 20 gr butter,
 55 gr manka,
 1 ch lozh salt,
*/

function carrot_cutlets
(int $carrots,
 int $egg,
 int $milk,
 int $butter,
 int $manka,
 int $salt,

 string $wishes)
{
	echo 
	"1.Peel the $carrots, grate on a small grater. <br>
	 2.In a suitable size pan, melt $butter. <br>
	 3.Simmer $carrots on moderate heat <br>
	 4.Pour $milk into the pan, $salt a little, stir <br>
	 5.Cool $carrots. <br>
	 6.Add the whipped $egg to the cooled $carrot mass. <br>
	 7.It turns out a thick, viscous mass. It practically does not stick to the hands and cutlets are easy to form.<br>
	 $wishes";
	 /*Serve carrot cutlets warm or cooled as an independent dish. 
     It can be with sour cream or with milk or cream sauce. Enjoy your meal!*/
 }	 
 carrot_cutlets(1, 1, 100, 20, 55, 1,'Bon Appetit');	 