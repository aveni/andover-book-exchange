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
"New"=>"0",
"Like New"=>"1", 
"Good"=> "2",
"Acceptable"=>"3"
}

TYPE = {
"Buy"=> "0",
"Auction"=> "1",
"Borrow"=> "2"
}.sort_by{|k,v| v}