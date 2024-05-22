function string_thousand(number) {
	var str, stl, rtn, place;
	
	str = string(floor(real(number)));
	stl = string_length(str);
	rtn = "";
	
	if stl <= 3 {
		return str;
	} else {
		place = ((stl - 1) mod 3) + 1;
		
		rtn += string_copy(str, 1, place);
		
		while place < string_length(str) {
			rtn += ",";
			rtn += string_copy(str, place + 1, 3);
			place += 3;
		}
		
		return rtn;
	}
}