function calcAge(){
    var age = '';
    var value = myForm.F00000066;
    if (value != undefined){
        var now = new Date();
        var ageDifMs = now - value.getTime();
        var ageDate = new Date(ageDifMs);
        age = Math.abs(ageDate.getUTCFullYear() - 1970);
        return age;
    }
};

// ro > readonly: determines if fields are readonly (shows html) or not
function ro(){
    if (assistants.scope.current === 'eid' && myForm.id_feld){
        return true;
    } else {
        return false;
    }
}


// transforms SKB Date to Date field
function getSKBDate(dat){
    var result = '';
    var year = '';
    var month = '';
    var day = '';
    // if (dat){
        year = dat.substring(0,4);
        month = dat.substring(4,6);
        day = dat.substring(6,8);
        result = day + '.' + month + '.' + year; // year + '-' + month + '-' + day;
    // }else{
    //     result = "";
    // }
    return result;
}




function isSKB(){
    if (!myForm.user || myForm.user == undefined){
        return false;
    }else{
        return true;
    }
}

function getSKBTelefon(){
    var res = "";
    if (isSKB()) {
        if(getcompanydata()){
            if (myForm.user.phonenumber){
                res = myForm.user.phonenumber;
            }
        }else if (myForm.user.userphonenumber){
                res = myForm.user.userphonenumber;
        }        
    }
    return res;
}

function getSKBEmail(){
    var res = "";
    if (isSKB()) {
        if (myForm.user.email){
            res = myForm.user.email;
        }
    }
    return res;
}


function getSKBFax(){
    var res = "";
    if (isSKB()) {
        if (myForm.user.fax){
            res = myForm.user.fax;
        }
    }
    return res;
}


function getSKBcontactdata(){
    var html = "";
    if (isSKB()){
        var stg = "";
        stg = getSKBTelefon();
        html = "<tr><strong><td>Telefon </td><td>" + stg + "</td></strong></tr>";
        stg = "";
        if(getcompanydata()){
            stg = getSKBFax();
            html += "<tr><strong><td>Fax </td><td>" + stg + "</td></strong></tr>";
        }
        if(!getcompanydata()){
            stg = "";
            stg = getSKBEmail();
            html += "<tr><strong><td>E-Mail-Adresse </td><td>" + stg + "</td></strong></tr>";
        }
    }
    return html;
}