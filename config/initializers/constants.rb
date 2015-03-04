SUBJECTS = {
"Mathematics" => "MATH",
"Chemistry" => "CHEM",
"Biology" => "BIO",
"Computer Science" => "COMPSCI",
"Physics" => "PHYS",
"English" => "ENGL", 
"French" => "FRA", 
"Spanish" => "ESP", 
"Russian" => "RUS", 
"German" => "GER", 
"Japanese" => "JPN", 
"Chinese" => "CHIN", 
"History" => "HIST",
"Religion & Philosophy" => "RELPHIL",
"Classics" => "CLSS",
"Music" => "MUSIC",
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
"BIO" => 5,
"COMPSCI" => 7,
"PHYS" => 5,
"ENGL" => 0, 
"FRA" => 3, 
"ESP" => 3, 
"RUS" => 3, 
"GER" => 3, 
"JPN" => 3, 
"CHIN" => 3, 
"HIST" => 2,
"RELPHIL" => 2,
"CLSS" => 3,
"MUSIC" => 4,
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