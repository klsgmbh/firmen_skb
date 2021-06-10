
function getSKBjurpersondata(){
    var html = "";
    if (isSKB()){
        var stg = "";

        if (getcompanydata() == undefined){
            stg = getUnterOrgName();
            html += "<tr><strong><td>Unterorganisation </td><td>" + stg + "</td></strong></tr>";
            stg = "";
            stg = getUserOrgName();
            html += "<tr><strong><td>Organisationseinheit des Benutzers </td><td>" + stg + "</td></strong></tr>";
        }else if (getcompanydata() == false){
            stg = getUnterOrgName();
            html += "<tr><strong><td>Unterorganisation </td><td>" + stg + "</td></strong></tr>";
            stg = "";
            stg = getUserOrgName();
            html += "<tr><strong><td>Organisationseinheit des Benutzers </td><td>" + stg + "</td></strong></tr>";
        }
        stg = "";

        if (getcompanydata() != undefined){
            if (getcompanydata()){
                stg = getOrgName();
                html = "<tr><strong><td>Company/Organisation </td><td>" + stg + "</td></strong></tr>"; 
                stg = "";
                stg = getOberOrgName();
                html += "<tr><strong><td>Organisationeinheit </td><td>" + stg + "</td></strong></tr>"
                stg = "";
                stg = getRegNumber();
                html += "<tr><strong><td>Handelsregisternummer </td><td>" + stg + "</td></strong></tr>"
                stg = "";
                stg = getMailbox();
                html += "<tr><strong><td>Postfach </td><td>" + stg + "</td></strong></tr>"
                stg = "";
                stg = getBoxzipcode();
                html += "<tr><strong><td>Postleitzahl des Postfaches </td><td>" + stg + "</td></strong></tr>"
            }
        }       
        stg = "";      
    }
    return html;
}

function getUserOrgName(){
    var res = "";
    if (isSKB()) {           
        if (myForm.user.userorganisation){
            res = myForm.user.userorganisation;
        }
    }
    return res;
}

function getOrgName(){
    var res = "";
    if (isSKB()) {           
        if (myForm.user.companyname){
            res = myForm.user.companyname;
        }
    }
    return res;
}

function getUnterOrgName(){
    var res = "";
    if (isSKB()) {           
        if (myForm.user.companysuborganisation){
            res = myForm.user.companysuborganisation;
        }
    }    
    return res;
}

function getOberOrgName(){
    var res = "";
        if (isSKB()) {           
            if (myForm.user.companyorganisation){
                res = myForm.user.companyorganisation;
            }
        }
    return res;
}

function getRegNumber(){
    var res = "";
    if (isSKB()) {           
        if (myForm.user.regnumber){
            res = myForm.user.regnumber;
        }
    }
    return res;
}

function getMailbox(){
    var res = "";
    if (isSKB()) {           
        if (myForm.user.mailbox){
            res = myForm.user.mailbox;
        }
    }
    return res;
}

function getBoxzipcode(){
    var res = "";
    if (isSKB()) {           
        if (myForm.user.boxzipcode){
            res = myForm.user.boxzipcode;
        }
    }
    return res;
}