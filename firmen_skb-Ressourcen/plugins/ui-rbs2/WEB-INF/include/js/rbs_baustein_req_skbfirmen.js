var mustbeBerlin = true;

var urlrbsstrliste;
var urlrbsdata; 

function geturlrbsstrliste(){
    var res = "";
    res = assistants.xpath.select("urlrbs", "string(rbs_url/url_1)");
    return res;
}



function geturlrbsdata(){
    var res = "";
    res =  assistants.xpath.select("urlrbs", "string(rbs_url/url_2)");
    return res;
}


function getcompanydata(){
    var comdata = false;
    if (myForm.getcompanydata != undefined){
        if (myForm.getcompanydata == true){
            comdata = true;
        }
    }
    return comdata;
}




function isSKB(){
    if (!myForm.user || myForm.user == undefined){
        return false;
    }else{
        return true;
    }
}

function getSKBPerson(){
    var pers = '';
    if (isSKB()){
        pers = myForm.user.modeid;
    }
    return pers;
}


function getSKBDate(dat){
    var result = '';
    var year = '';
    var month = '';
    var day = '';
    year = dat.substring(0,4);
    month = dat.substring(4,6);
    day = dat.substring(6,8);
    result = day + '.' + month + '.' + year; // year + '-' + month + '-' + day;
    return result;
}

//-----Get SKB Data according to usermode------

function getSKBStreet(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.Street_Name : (myForm.user) ? myForm.user.street : ""
    var res = '';
    if (isSKB()) {           
        if(getcompanydata()){
            if (myForm.user.companystreet){
                res = myForm.user.companystreet;
            }
        }else if (myForm.user.userstreet){
            res = myForm.user.userstreet;
        }
    }
    return res;
}

function getSKBStreetNr(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.Street_Number : (myForm.user) ? myForm.user.streetnumber : ""    
    var res = '';
    if (isSKB()) {           
        if(getcompanydata()){
            if (myForm.user.companystreetnumber){
                res = myForm.user.companystreetnumber;
            }
        }else if (myForm.user.userstreetnumber){
            res = myForm.user.userstreetnumber;
        }
    }
    return res;
}

// function getSKBStreetExt(){
//     //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.Street_Number : (myForm.user) ? myForm.user.streetnumber : ""    
//     var res = '';
//     if (isSKB()) { 
//         if(myForm.user.streetextension){
//             res = myForm.user.streetextension;
//             return res;
//         }
//     }
//     return res;
// }


function getSKBPLZ(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.ZipCode : (myForm.user) ? myForm.user.zipcode : ""
    var res = '';
    if (isSKB()) {           
        if(getcompanydata()){
            if (myForm.user.companyzipcode){
                res = myForm.user.companyzipcode;
            }
        }else if (myForm.user.userzipcode){
            res = myForm.user.userzipcode;
        }
    }
    return res;
}


function getSKBCity(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.City : (myForm.user) ? myForm.user.city : ""
    var res = 'Berlin';
    if (isSKB()) {           
        if(getcompanydata()){
            if (myForm.user.companycity){
                res = myForm.user.companycity;
            }
        }else if (myForm.user.usercity){
            res = myForm.user.usercity;
        }
    }
    return res;
}

function getSKBLand() {
    var res = 'Deutschland';
    if (isSKB()) {           
        if(getcompanydata()){
            if (myForm.user.companycountry){
                res = myForm.user.companycountry;
            }
        }else if (myForm.user.usercountry){
            res = myForm.user.usercountry;
        }
        res = getLandCode(res);
    }
    return res;
}

function getLandCode(land){
    var res = "000";
    var myland = land;
    if (myland === "Deutschland"){
        res = "000";
        return res;
    }else if(myland != "Deutschland"){
        res = assistants.xpath.select("C00000009", "string(//Row/Value[SimpleValue=$code]//../Value[@ColumnRef='DESTATIS_Schluessel_Staat']/SimpleValue)", { code : myland });
        return res;
    }
    
}


function checkSelectedLand(){
    var res = "";
    if ((myForm.landh == "|---bitte auswählen---") || (myForm.landh == "")){
        res = getSKBLand();
    }else{
        res = myForm.landh;
    }
    return res;
}

function isBerlin(){
    if (isSKB()){
        var city = getSKBCity();
        if (city.toLowerCase() == "berlin"){
            return true;
        }else {
            return false;
        }
    }
}

function isSKBBerlin(){
    if (isSKB()){
        var city = getSKBCity();
        if (city.toLowerCase() == "berlin"){
            return true;
        }
    }
    return false;
}

function ifReadSKB(){
    var getSKB;
    getSKB = false;
    if (mustbeBerlin == true && isSKBBerlin() == true){
        getSKB = true;
        return getSKB;
    }else if(mustbeBerlin == false && isSKBBerlin() == true){
        getSKB = true;
        return getSKB;
    }else if(mustbeBerlin == false && isSKBBerlin() == false ){
        getSKB = true; 
        return getSKB;
    }
    return getSKB;

}



function getskbaddressdata(){
    var html = "";
    if (isSKB()){
        html = "<tr><strong><td>Straße </td><td>" + getSKBStreet() + "</td></strong></tr>";
        html += "<tr><strong><td>Hausnummer </td><td>" + getSKBStreetNr() + "</td></strong></tr>"; //getSKBStreetExt()
        html += "<tr><strong><td>Postleitzahl </td><td>" + getSKBPLZ() + "</td></strong></tr>";
        html += "<tr><strong><td>Ort </td><td>" + getSKBCity() + "</td></strong></tr>";
        var landname = "";
        if(getSKBLand() === "000"){
            landname = "Deutschland";
        }
        html += "<tr><strong><td>Land </td><td>" + landname + "</td></strong></tr>"        
    }
    return html;
}


function checkReadOnly(){
	if (assistants.scope.current === 'eid'){
        return true; //read from eID
	}else{
		if (myForm.user){
			if (myForm.user.modeid == '3'){
				return true; //Firmenkunde
			}else{
				if (myForm.user.levelid == '3') {
					return true; //hÃ¶here Sicherheitstufe BÃ¼rger
				}else{
					return false;
				}
			}
		}else{
			return false;
		}
	}
}


function prefillLand(){
    var res = "";
    if (isSKB()){
        res = getSKBLand();
    }else{
        res = "000";
    }
    return res;
}


function validateAddress(){
    var res = false
    if (myForm.transaction){
        if (myForm.F00000035h.toLowerCase() !== "berlin"){
            return false;
        }else if (myForm.f00000035.toLowerCase() != "berlin"){
            return false;
        }else if (myForm.f00000035.toLowerCase() == "berlin") {
            if (myForm.bzrnr != '') {
                var adr = callbzrinfo();
                myForm.bzrnameh = adr.bzrname;
                myForm.otnameh = adr.otname;
                res = true;
            }
        }else{
            res = false
        }
    }    
	return res;
}

function callbzrinfo(){
    var res;
    var strname = myForm.F00000053h;
    var hnr = myForm.F00000016h;
    var hnrz = myForm.F00000084h;
    var plz = myForm.F00000054h;
    var city = "berlin";
    res = callCheckAddress(strname,hnr,hnrz,plz,city)
    return res;
}

function rbsrule(){
    var res = true;
    if (myForm.rbs_valid != undefined && myForm.F00000035h != undefined){
        if (myForm.rbs_valid !== true){
            if (myForm.F00000035h.toLowerCase() === "berlin"){
                res = false;
            }
        }
    }
    return res;
}

function selectDistrict(){
    myForm.bzrnr = myForm.beznum;
    myForm.otnr = myForm.otnum;
    if (myForm.bzrnr != ""){
        myForm.bzrname = myForm['beznum/@label'];
    }else{
        myForm.bzrname = "";
    }
    if (myForm.otnr != ""){
        myForm.otname = myForm['otnum/@label'];
    }else{
        myForm.otname = "";
    }
}

/*
	the values for res are the names of the pages (<body id="">)
	where only Berlin addresses are allowed and 
	should be validated.
*/

function onlyBerlin(){
    var res = "foo; bar; rbs";
    return res;
}

function ro(){
    if (assistants.scope.current === 'eid' && myForm.id_feld){
        return true;
    } else {
        return false;
    }
}
//---------------- Server side address validation --------------------------//


function validateSKBaddress(){
    var address = "";
    if (isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        
        if (city.toLowerCase() !== "berlin"){ return "";}

        adr = callCheckAddress(strname,hnr,hnrz,plz,city);
        address = "strname: " + adr.strname + "; " + "strnr: " + adr.strnr + "; " + "hausnr: " + adr.hnr + "; " + "hausnrz: " + adr.hnrz + "; " +  "plz: " + adr.zipcode + "; " +  "beznr: " + adr.beznr + "; " +  "otnr: " + adr.otnr + "; " + "etrs89_x" + adr.etrs89x  + "; " + "etrs89_y" + adr.etrs89y;
        return address;

    }else{
        return "";
    }
}

function testskbvalidation(){
    var address = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        address = validateTestaddress (strname, hnr, hnrz, plz, city);
    }
    return address;
}

function validateTestaddress(strnam, hnur, hnurz, zipcode, city){
    var address = "";
        if (city.toLowerCase() !== "berlin"){ return "";}

        adr = callCheckAddress(strnam,hnur,hnurz,zipcode,city);
        address = "strname: " + adr.strname + "; " + "strnr: " + adr.strnr + "; " + "hausnr: " + adr.hausnr + "; " + "hausnrz: " + adr.hausnrz + "; " +  "plz: " + adr.plz + "; " +  "bezname: " + adr.bzrname + "; " + "beznr: " + adr.beznr + "; " + "otname: " + adr.otname + "; " + "otnr: " + adr.otnr + "; " + "etrs89_x: " + adr.etrs89_x  + "; " + "etrs89_y: " + adr.etrs89_y;
        return address;
}

function callSKBeIDbeznr(){
    res = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.beznr;
    }
    return res;
}

function callSKBeIDbezname(){
    res = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.bzrname;
    }
    return res;
}

function callSKBeIDotname(){
    res = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.otname;
    }
    return res;
}

function callSKBeIDotnr(){
    res = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.otnr;
    }
    return res;
}

function callSKBeIDstrnr(){
    res = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.strnr;
    }
    return res;
}


function callSKBeIDetrs89x(){
    res = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.etrs89_x;
    }
    return res;
}

function callSKBeIDetrs89y(){
    res = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = ""; //getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.etrs89_y;
    }
    return res;
}





assistants.xpath.addNamespace('rbs', 'https://fbinter.stadt-berlin.de/rbs');

function isObjectEmpty(value) {
    return (
      Object.prototype.toString.call(value) === '[object Object]' &&
      JSON.stringify(value) === '{}'
    );
  }


function callCheckAddress(strname, hnr, hnrz, zipcode, city){
	var strnr = "";
	var arg = "";
    var address = {
        strname: "",
        strnr: "",
        hausnr: "",
        hausnrz: "",
        plz: "",
        bzrname: "",
        beznr: "",
        otname: "",
        otnr: "",
        etrs89_x: "",
        etrs89_y: ""
    };
    if (city.toLowerCase() !== 'berlin'){
        return address;
    }

    urlrbsstrliste = geturlrbsstrliste();
    urlrbsdata = geturlrbsdata();

	var oneAddress = assistants.rest(urlrbsdata + "strname={street}&hausnr={housenr}&hausnrz={housenrsx}", {
        street: strname,
        housenr: hnr,
        housenrsx: hnrz
    }).lazy()
    .get()
    .entity({
		200: response => {
			return response.entity;
			},
		404: response => {
			return undefined;
			}
	});
	
    if (oneAddress === undefined) {
        assistants.log.error("Diese Adresse existiert nicht");
        return address;
        //return {fehler: true, fehlerDetail: "Diese Adresse existiert nicht"};
    }else{
        var crbsadr = assistants.xpath.select(oneAddress, "count(/rbs:rbs-adr-liste/rbs:rbs-adr)");
        print("crbsadr: " + crbsadr);
        if (crbsadr == undefined){return address;}
        //if (crbsadr == 0){return address;}
        
        if (crbsadr < 1){
            //if address is not exact
            var strlist =[];
            //get the street numbers that correspond to this street name
            strlist = callStreetList(strname);
            //try each street nummer and house number until zipcodes are the same
            if(strlist.length > 0){
                for (var i = 0; i < strlist.length; i++){
                    // address = "";
                    print("checking street: " + strlist[i] + " from " + strlist.length + " streetnumbers");
                    address = getUniqueAddress(strlist[i],hnr,hnrz,zipcode);
                    // print ("address: " + address);
                    // if (address.beznr !== ""){
                        return address;
                    // }             
                }
            }else{
                return address;
            }
            
        }else if(crbsadr === 1){
            //Address is exact and verifiable
            var strname = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/rbs:strname)");
            var strnr = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@strnr)");
            var beznr = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@beznr)");
            var bezname = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/rbs:bezname)");
            var otnr =  assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@otnr)");
            var otname =  assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/rbs:otname)");
            var etrs89x = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@etrs89_x)");
            var etrs89y = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@etrs89_y)");
            address = {
                strname: strname,
                strnr: strnr,
                hausnr: hnr,
                hausnrz: hnrz,
                plz: zipcode,
                beznr: beznr,
                bzrname: bezname,
                otnr: otnr,
                otname: otname,
                etrs89_x: etrs89x,
                etrs89_y: etrs89y
            };
            // address = "strname: " + strname + "; " + "strnr: " + strnr + "; " + "hausnr: " + hnr + "; " + "hausnrz: " + hnrz + "; " +  "plz: " + zipcode + "; " +  "beznr: " + beznr + "; " +  "otnr: " + otnr + "; " + "etrs89_x" + etrs89x  + "; " + "etrs89_y" + etrs89y;
            // print ("address: " + address);
            return address;
            
        }else{
            return address;
        }
        //return ("count rbs-adr-liste: " + strlist.length);
    }
}

function callStreetList(street){
    urlrbsstrliste = geturlrbsstrliste();
    var strarr = [];
    var streetlist = assistants.rest(urlrbsstrliste + "strname={street}", {
        street: street
    }).lazy()
    .get()
    .entity({
        200: response => {
            return response.entity;
        },
        404: response => {
            return undefined;
        }
    });
    if (streetlist === undefined) {
        assistants.log.error("Diese Adresse existiert nicht");
        return (strarr);
        //return {fehler: true, fehlerDetail: "Diese Adresse existiert nicht"};
    }else{
        var cliste = assistants.xpath.select(streetlist, "count(//rbs:rbs-str/@strnr)");
        //return cliste;
        if (cliste > 1) {
            var results = [];
            for (var i=1;i < cliste + 1; i++){
                var arg1 = "string(//rbs:rbs-str[";
                var arg2 = i;
                var arg3 = "]/@strnr)"
                var arg = arg1 + arg2 + arg3;
                var res = assistants.xpath.select(streetlist, arg);
                results.push(res);
            
            
        }
        
        return (results);
        }
    }
}

function getUniqueAddress(strnr,hnr,hnrz,zipcode){
    urlrbsstrliste = geturlrbsstrliste();
    urlrbsdata = geturlrbsdata();
    var address = {
        strname: "",
        strnr: "",
        hausnr: "",
        hausnrz: "",
        plz: "",
        bzrname: "",
        beznr: "",
        otname: "",
        otnr: "",
        etrs89_x: "",
        etrs89_y: ""
    };
    var streetlist = assistants.rest(urlrbsdata + "strnr={street}&hausnr={housenr}&hausnrz={housenrsx}", {
        street: strnr,
        housenr: hnr,
        housenrsx: hnrz
    }).lazy()
    .get()
    .entity({
		200: response => {
			return response.entity;
			},
		404: response => {
			return undefined;
			}
	});
    if (streetlist === undefined) {
        assistants.log.error("Diese Adresse existiert nicht");
        return address;
        //return {fehler: true, fehlerDetail: "Diese Adresse existiert nicht"};
    }else{
        var crbsadr = assistants.xpath.select(streetlist, "count(/rbs:rbs-adr-liste/rbs:rbs-adr)");
        print( "getunique: " + crbsadr);
        if(crbsadr === 1){
            var plz = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@postleit)");
            
            if (zipcode === plz){ //compare zipcode and plz
                var strname = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/rbs:strname)");
                var strnr = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@strnr)");
                var beznr = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@beznr)");
                var bezname = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/rbs:bezname)");
                var otnr =  assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@otnr)");
                var otname =  assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/rbs:otname)");
                var etrs89x = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@etrs89_x)");
                var etrs89y = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@etrs89_y)");
                address = {
                    strname: strname,
                    strnr: strnr,
                    hausnr: hnr,
                    hausnrz: hnrz,
                    plz: zipcode,
                    beznr: beznr,
                    bzrname: bezname,
                    otnr: otnr,
                    otname: otname,
                    etrs89_x: etrs89x,
                    etrs89_y: etrs89y
                };
                // address = "strname: " + strname + "; " + "strnr: " + strnr + "; " + "hausnr: " + hnr + "; " + "hausnrz: " + hnrz + "; " +  "plz: " + zipcode + "; " +  "beznr: " + beznr + "; " +  "otnr: " + otnr + "; " + "etrs89_x" + etrs89x  + "; " + "etrs89_y" + etrs89y;
                return address;
            }else{
                return address;
            }
            
            
        }else{
            return address;
        }
    }


}

//---------------- Server side address validation --------------------------//