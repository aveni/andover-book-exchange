SUBJECTS = {
"Mathematics" => "MATH",
"Chemistry" => "CHEM",
"Biology" => "BIOL",
"Computer Science" => "COMP",
"Physics" => "PHYS",
"English" => "ENGL", 
"French" => "FREN", 
"Spanish" => "SPAN", 
"Russian" => "RUSS", 
"German" => "GERM", 
"Japanese" => "JAPA", 
"Chinese" => "CHIN", 
"History" => "HIST",
"Religion & Philosophy" => "PHRE",
"Latin" => "LATN",
"Music" => "MUSC",
"Art" => "ART",
"Miscellaneous" => "MISC"
}.sort_by{|k, v| k}

QUALITIES = {
"New"=>"0",
"Like New"=>"1", 
"Good"=> "2",
"Acceptable"=>"3"
}

TYPES = ["Buy","Auction","Borrow"]

TEACHERS = [
	"Jacque Hugon", 
	"Patrick Farrell", 
	"William Scott", 
	"Maria Litvin", 
	"Fei Yao",
	"Emma Staffaroni" 
]

SUBJECT_COLORS = {
"MATH" => 7,
"CHEM" => 5,
"BIOL" => 5,
"COMP" => 7,
"PHYS" => 5,
"ENGL" => 0, 
"FREN" => 3, 
"SPAN" => 3, 
"RUSS" => 3, 
"GERM" => 3, 
"JAPA" => 3, 
"CHIN" => 3, 
"HIST" => 2,
"PHRE" => 2,
"LATN" => 3,
"MUSC" => 4,
"ART" => 6,
"MISC" => 0
}


COLORS = [
	"EB65A0",						#"66, 139, 202, 1.00", Purple
	"73C5E1",						#"190, 95, 124, 1.00", Blue
	"5BB12F",						#"165, 198, 99, 1.00",  Green
	"EB65A0",						#"224, 68, 68, 1.00", Pink
	"CCDB05",						#"234, 229, 81, 1.00", Light Green
	"FF0000",						#"238, 130, 51, 1.00",	Red
	"F2E394",						#"76, 50, 164, 1.00", Yellow
	"00C8F8"						# blue
	]