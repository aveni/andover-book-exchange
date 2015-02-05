SUBJECTS = {
"Mathematics" => "MATH",
"Chemistry" => "CHEM",
"Biology" => "BIO",
"Computer Science" => "COMPSCI",
"Physics" => "PHYS",
"English" => "ENG", 
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
"Art" => "ART"
}.sort_by{|k, v| k}

QUALITY = {
"Book is new with no markings on the inside"=>"New",
"Book is fairly new with some wear. No markings inside"=>"Like New", 
"Book is slightly worn or has a few markings inside"=> "Good",
"Book is fairly worn or has marking throughout"=>"Acceptable"
}.sort_by{|k,v| v}

TYPE = {
	"Buy it Now"=> "Buy it Now",
	"Auction"=> "Auction",
	"Borrow"=> "Borrow"
}.sort_by{|k,v| v}