<?xml version="1.0" encoding="utf-8"?>
<%@ page contentType="application/xhtml+xml; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.cit.de/ns/jsp" prefix="cit" %>
<%@ page import="de.cit.jsp.control.PageProcessor" %>
<%! private boolean isVisited(final HttpSession session, final String id) { return ((java.util.Set)session.getAttribute("composer.visitedPages")).contains(id); } %>
<% if (session.getAttribute("composer.visitedPages") == null) { session.setAttribute("composer.visitedPages", java.util.Collections.synchronizedSet(new java.util.HashSet())); } %>
<% PageProcessor pageProcessor = PageProcessor.getSessionInstance(session); %>
<% pageProcessor.createSyncPoint("firmen-skb"); %>
<% ((java.util.Set)session.getAttribute("composer.visitedPages")).add("firmen-skb"); %>

<%!
static java.lang.reflect.Method getComments;
static {
  try {
    getComments = de.cit.jsp.tags.FormTag.class.getMethod("getComments", String.class);
  } catch (NoSuchMethodException e) {
  }
}
   static String getComments(final Object form, final String fieldname) {
      try {
         return form != null && getComments != null ? (String) getComments.invoke(form, fieldname) : "";
      } catch (Exception e) {
         return "";
      }
   }
%>
    

<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:cit="http://www.cit.de/ns/jsp" xmlns:html="http://www.w3.org/1999/xhtml" lang="de-DE" class="no-js">
   <head>
      <cit:useBean name="myForm" class="de.cit.assistants.DataBean"/>
      <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
      <meta content="width=device-width, initial-scale=1, user-scalable=yes" name="viewport"/><% String buildRelease = application.getInitParameter("build.release"); if (buildRelease != null) {%><meta name="build.release" content="<%= buildRelease %>"/><% } %><% String buildNumber = application.getInitParameter("build.number"); if (buildNumber != null) {%><meta name="build.number" content="<%= buildNumber %>"/><% } %><% String buildRevision = application.getInitParameter("build.revision"); if (buildRevision != null) {%><meta name="build.revision" content="<%= buildRevision %>"/><% } %><!--plugin:theme-html5-->
    <cit:theme/>
    
      <script charset="utf-8" src="_plugins/theme-html5/script.js?-8236014590501371310" type="text/javascript"/>
  <!--plugin:ui-rbs2-->
        
      <script src="_plugins/ui-rbs2/ui-rbs2.js?-680575039288711931" type="text/javascript"/>
        
      <script src="_plugins/ui-rbs2/bsnrbs.AutoSuggest_2.1.3.js?5851351268818775181" type="text/javascript"/>
		
      <cit:script fileEncoding="utf-8" href="/WEB-INF/include/js/rbs_baustein_req_skbfirmen.js"/>
		
      <cit:script fileEncoding="utf-8" href="/WEB-INF/include/js/persoenliche_angaben_skb2.js"/>
        
      <cit:script fileEncoding="utf-8" href="/WEB-INF/include/js/kontaktdaten_skb_firmen.js"/>
        
      <cit:script fileEncoding="utf-8" href="/WEB-INF/include/js/juristische_person.js"/>
   
      <title id="page-title">
         <cit:conditional test="!assistants.request.valid">Fehler beim Ausfüllen - </cit:conditional>firmen_skb - Firmen SKB</title>
      <cit:script href="/WEB-INF/etc/commons.js">/**/</cit:script>
      <cit:script href="/WEB-INF/etc/script.js" fileEncoding="utf-8">/**/</cit:script>
      <cit:template select="/.." xhtml="true"/>
      <cit:control>
         <cit:link rel="helpbase" href="help.jsp"/>
         <cit:flow/>
      </cit:control>
   </head>
   <body id="firmen-skb">
      <div id="custom_top"/>
      <div id="if">
         <div id="page" class=" has_roadmap_right">
            <header>
               <div class="dynamic_area">
                  <div class="headercontent">
                     <div id="logo"/>
                     <h1>firmen_skb</h1>
                     <section id="useraccount"/>
                  </div>
               </div>
            </header>
            <nav id="roadmap" class="roadmap roadmap_right">
               <h3 class="accessibility">Dialogverlauf</h3>
               <button class="switch" type="button" onclick="return false;" aria-haspopup="true" aria-expanded="true" disabled="disabled">
                  <span class="icon-switch" aria-hidden="true"/>
                  <span class="accessibility">Dialogverlauf öffnen/schließen</span>
               </button>
               <ul class="icons"><% final boolean unvisited_d4e2 = !isVisited(session, "firmen-skb"); %><li class='present<%= unvisited_d4e2 ? " unvisited" : "" %>'>
                     <span class="item">
                        <span class="label">
                           <span class="labeltext">Firmen SKB</span>
                           <span class="labelicon" title='<%= unvisited_d4e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %>'>
                              <span class="accessibility"><%= unvisited_d4e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %></span>
                           </span>
                        </span>
                     </span>
                  </li>
               </ul>
            </nav>
            <div class="dynamic_area">
               <article>
                  <section id="content" class=" narrow">
                     <cit:form beanName="myForm">
                        <div class="wizard-body">
                           <h2 id="title">Firmen SKB</h2>
                           <cit:conditional test="!assistants.request.valid &amp;&amp; (assistants.request.strictInvalid === undefined || assistants.request.strictInvalid === true)">
                              <p class="invalidInfo v2">
                                 <span class="icon-warning-sign" aria-hidden="true"/>
                                 <strong>Fehler beim Ausfüllen: Bitte überprüfen Sie Ihre Angaben.</strong>
                              </p>
                           </cit:conditional>
                           <cit:conditional test="!assistants.request.valid &amp;&amp; assistants.request.softInvalid === true">
                              <p class="invalidInfo v2 loose">
                                 <span class="icon-exclamation-sign" aria-hidden="true"/>
                                 <strong>Mögliche Fehler beim Ausfüllen: Bitte kontrollieren Sie Ihre Angaben nochmals. Wenn Sie sicher sind, klicken Sie erneut auf <em class="button-name icon-arrow-right">Weiter</em>.</strong>
                              </p>
                           </cit:conditional>
                           <p class="required-hint">
                              <em>
                                 <span class="required-mark" aria-hidden="true">*</span>
                                 <span aria-hidden="true"> Pflichtfelder</span>
                                 <span class="accessibility">Diese Seite enthält Pflichtfelder.</span>
                              </em>
                           </p>
                           <section class="group narrow">
                              <header>
                                 <h3>Personendaten</h3>
                              </header>
                              <cit:conditional test="isSKB()">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getSKBpersondata())"/></p></section>
                              </cit:conditional>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "anredeh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('anredeh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="anredeh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="anredeh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="anredeh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="anredeh" v="2">
                                       <span id="$$ID$$">Anrede:</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="anredeh" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getSKBPrefix() : &#34;&#34;">
                                          <cit:option value="">keine Anrede</cit:option>
                                          <cit:option value="Frau">Frau</cit:option>
                                          <cit:option value="Herr">Herr</cit:option>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000043_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000043_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000043_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000043_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000043_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000043_h" v="2">
                                       <span id="$$ID$$">Titel:</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="F00000043_h" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getSKBTitle() : &#34;&#34;">
                                          <cit:option value="">kein Titel</cit:option>
                                          <cit:option value="Dr.">Dr.</cit:option>
                                          <cit:option value="Dr. h.c.">Dr. h.c.</cit:option>
                                          <cit:option value="Prof.">Prof.</cit:option>
                                          <cit:option value="Prof. Dr.">Prof. Dr.</cit:option>
                                          <cit:option value="Prof. Dr. Dr.">Prof. Dr. Dr.</cit:option>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000013_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000013_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000013_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000013_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000013_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000013_h" v="2">
                                       <span id="$$ID$$">Familienname</span>
                                       <span class="tooltip">
                                          <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000013_h") %>' aria-describedby="d0e79_tooltip">
                                             <span class="accessibility">Hilfe öffnen</span>
                                          </a>
                                       </span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000013_h" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getSKBLastname() : &#34;&#34;"/>
                                    </div>
                                    <div class="tooltip_overlay">
                                       <div class="tooltip_text" id="d0e79_tooltip"><p>Familienname<br/>Geben Sie den Nachnamen, Zunamen bzw. Familiennamen an.</p><span> 
                                             <a target="intelliform_help" class="more" title="Hilfeseite in neuem Fenster öffnen" href='<%= response.encodeURL("help.jsp#f00000013_h") %>'>mehr …</a>
                                          </span>
                                          <button class="close" type="button" onclick="return false;">
                                             <span class="icon-close" aria-hidden="true"/>
                                             <span class="accessibility">Schließen</span>
                                          </button>
                                       </div>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000045_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000045_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000045_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000045_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000045_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000045_h" v="2">
                                       <span id="$$ID$$">Vorname</span>
                                       <span class="tooltip">
                                          <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000045_h") %>' aria-describedby="d0e94_tooltip">
                                             <span class="accessibility">Hilfe öffnen</span>
                                          </a>
                                       </span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000045_h" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getSKBFirstname() : &#34;&#34;"/>
                                    </div>
                                    <div class="tooltip_overlay">
                                       <div class="tooltip_text" id="d0e94_tooltip"><p>Vorname<br/>Geben Sie einen Vornamen an.</p><span> 
                                             <a target="intelliform_help" class="more" title="Hilfeseite in neuem Fenster öffnen" href='<%= response.encodeURL("help.jsp#f00000045_h") %>'>mehr …</a>
                                          </span>
                                          <button class="close" type="button" onclick="return false;">
                                             <span class="icon-close" aria-hidden="true"/>
                                             <span class="accessibility">Schließen</span>
                                          </button>
                                       </div>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000066_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000066_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000066_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000066_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000066_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000066_h" v="2">
                                       <span id="$$ID$$">Geburtsdatum</span>
                                       <span class="tooltip">
                                          <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000066_h") %>' aria-describedby="d0e109_tooltip">
                                             <span class="accessibility">Hilfe öffnen</span>
                                          </a>
                                       </span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputDate name="F00000066_h" class="tiny focus-mark-before" ariaLabelledby="$label-id $error-ids d0e109_date_format_hint" showChooser="true" onDefault="isSKB() ? (myForm.user.dateofbirth) ? getSKBDate(myForm.user.dateofbirth) : &#34;&#34; : &#34;&#34;"/>
                                    </div>
                                    <div class="tooltip_overlay">
                                       <div class="tooltip_text" id="d0e109_tooltip">
                                          <p class="date_format_hint" id="d0e109_date_format_hint">Bitte geben Sie hier ein Datum im Format TT.MM.JJJJ ein.</p><p>Geburtsdatum<br/>Geben Sie Tag, Monat und Jahr der Geburt an.</p><span> 
                                             <a target="intelliform_help" class="more" title="Hilfeseite in neuem Fenster öffnen" href='<%= response.encodeURL("help.jsp#f00000066_h") %>'>mehr …</a>
                                          </span>
                                          <button class="close" type="button" onclick="return false;">
                                             <span class="icon-close" aria-hidden="true"/>
                                             <span class="accessibility">Schließen</span>
                                          </button>
                                       </div>
                                    </div>
                                 </div>
                              </section>
                              <cit:inputComputed name="anrede" value="myForm.anredeh"/>
                              <cit:inputComputed name="f00000043" value="myForm.F00000043_h"/>
                              <cit:inputComputed name="f00000013" value="myForm.F00000013_h"/>
                              <cit:inputComputed name="f00000045" value="myForm.F00000045_h"/>
                              <cit:inputComputed name="f00000066" value="myForm.F00000066_h"/>
                           </section>
                           <section class="group narrow">
                              <header>
                                 <h3>Kontaktdaten</h3>
                              </header>
                              <cit:conditional test="isSKB()">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getSKBcontactdata())"/></p></section>
                              </cit:conditional>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000069h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000069h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:conditional test="!My.isCustomReason('F00000069h')">
                                             <cit:errorText name="F00000069h"/>
                                          </cit:conditional>
                                          <cit:conditional test="My.isCustomReason('F00000069h')">
                                             <cit:errorText name="F00000069h">
                                                <span id="$$ID$$">
                                                   <span class="accessibility">Fehler: </span>Bitte geben Sie eine valide Telefonnummer ein</span>
                                             </cit:errorText>
                                          </cit:conditional>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000069h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000069h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000069h" v="2">
                                       <span id="$$ID$$">Telefon (Mobil)</span>
                                       <span class="tooltip">
                                          <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000069h") %>' aria-describedby="d0e181_tooltip">
                                             <span class="accessibility">Hilfe öffnen</span>
                                          </a>
                                       </span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000069h" ariaLabelledby="$label-id $error-ids" pattern="/(^\s*$)|(^(^([0(+][0-9\.-\/ ()]{7,})$)$)/" errtitle="Bitte geben Sie eine valide Telefonnummer ein" onDefault="isSKB() ? getSKBTelefon() : &#34;&#34;"/>
                                    </div>
                                    <div class="tooltip_overlay">
                                       <div class="tooltip_text" id="d0e181_tooltip"><p>Telefon<br/>Geben Sie die Telefonnummer an unter der Sie erreibar sind.</p><span> 
                                             <a target="intelliform_help" class="more" title="Hilfeseite in neuem Fenster öffnen" href='<%= response.encodeURL("help.jsp#f00000069h") %>'>mehr …</a>
                                          </span>
                                          <button class="close" type="button" onclick="return false;">
                                             <span class="icon-close" aria-hidden="true"/>
                                             <span class="accessibility">Schließen</span>
                                          </button>
                                       </div>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000071h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000071h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:conditional test="!My.isCustomReason('F00000071h')">
                                             <cit:errorText name="F00000071h"/>
                                          </cit:conditional>
                                          <cit:conditional test="My.isCustomReason('F00000071h')">
                                             <cit:errorText name="F00000071h">
                                                <span id="$$ID$$">
                                                   <span class="accessibility">Fehler: </span>Dies ist keine gültige E-Mail-Adresse</span>
                                             </cit:errorText>
                                          </cit:conditional>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000071h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000071h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000071h" v="2">
                                       <span id="$$ID$$">E-Mail-Adresse</span>
                                       <span class="tooltip">
                                          <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000071h") %>' aria-describedby="d0e199_tooltip">
                                             <span class="accessibility">Hilfe öffnen</span>
                                          </a>
                                       </span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000071h" ariaLabelledby="$label-id $error-ids" onValidate="(/^\s*$/.test(value))||(/* E-Mail-Adresse mit MX-Prüfung */ assistants.validate.checkEmailAddress(value, true))" errtitle="Dies ist keine gültige E-Mail-Adresse" onDefault="isSKB() ? getSKBEmail() : &#34;&#34;"/>
                                    </div>
                                    <div class="tooltip_overlay">
                                       <div class="tooltip_text" id="d0e199_tooltip"><p>E-Mail<br/>Geben Sie Ihre E-Mail-Adresse an.</p><span> 
                                             <a target="intelliform_help" class="more" title="Hilfeseite in neuem Fenster öffnen" href='<%= response.encodeURL("help.jsp#f00000071h") %>'>mehr …</a>
                                          </span>
                                          <button class="close" type="button" onclick="return false;">
                                             <span class="icon-close" aria-hidden="true"/>
                                             <span class="accessibility">Schließen</span>
                                          </button>
                                       </div>
                                    </div>
                                 </div>
                              </section>
                              <cit:inputComputed name="f00000069" value="myForm.F00000069h"/>
                              <cit:inputComputed name="f00000071" value="myForm.F00000071h"/>
                           </section>
                           <section class="group narrow">
                              <header>
                                 <h3>Organisationsangaben</h3>
                              </header>
                              <cit:conditional test="isSKB()">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getSKBjurpersondata())"/></p></section>
                              </cit:conditional>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000034h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000034h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000034h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000034h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000034h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000034h" v="2">
                                       <span id="$$ID$$">Organisationsname / Bezeichnung:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000034h" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getOrgName() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "unterorganisationh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('unterorganisationh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="unterorganisationh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="unterorganisationh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="unterorganisationh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="unterorganisationh" v="2">
                                       <span id="$$ID$$">Unterorganisation:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="unterorganisationh" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getUnterOrgName() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "oberorganisationh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('oberorganisationh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="oberorganisationh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="oberorganisationh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="oberorganisationh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="oberorganisationh" v="2">
                                       <span id="$$ID$$">Oberorganisation:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="oberorganisationh" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getOberOrgName() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "registernummerh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('registernummerh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="registernummerh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="registernummerh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="registernummerh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="registernummerh" v="2">
                                       <span id="$$ID$$">Handelsregisternummer:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="registernummerh" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getRegNumber() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "mailboxh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('mailboxh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="mailboxh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="mailboxh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="mailboxh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="mailboxh" v="2">
                                       <span id="$$ID$$">Postfach:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="mailboxh" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getMailbox() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "boxzipcodeh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('boxzipcodeh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="boxzipcodeh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="boxzipcodeh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="boxzipcodeh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="boxzipcodeh" v="2">
                                       <span id="$$ID$$">Postleitzahl des Postfachs:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="boxzipcodeh" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getBoxzipcode() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:inputComputed name="f00000034" value="myForm.F00000034h"/>
                              <cit:inputComputed name="unterorganisation" value="myForm.unterorganisationh"/>
                              <cit:inputComputed name="oberorganisation" value="myForm.oberorganisationh"/>
                              <cit:inputComputed name="registernummer" value="myForm.registernummerh"/>
                              <cit:inputComputed name="mailbox" value="myForm.mailboxh"/>
                              <cit:inputComputed name="boxzipcode" value="myForm.boxzipcodeh"/>
                           </section>
                           <section class="group narrow rbs">
                              <header>
                                 <h3>Adressdaten</h3>
                              </header>
                              <cit:conditional test="(isSKB())">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getskbaddressdata())"/></p></section>
                              </cit:conditional>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "onlyberlin") %>'>
                                 <cit:conditional test="!assistants.request.isValid('onlyberlin')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="onlyberlin"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="onlyberlin" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="onlyberlin" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="onlyberlin" v="2">
                                       <span id="$$ID$$">onlyberlin:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="onlyberlin" ariaLabelledby="$label-id $error-ids" onDefault="onlyBerlin()"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:xmlResource id="rbsurl" src="js:{myForm.transaction ? 'vfs:///root/intelliForm-Mandanten/default/Ressourcen/xml/rbs_url.xml' : '/WEB-INF/data/rbs_url.xml' }" scope="CONTEXT"/>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "urlrbsdata") %>'>
                                 <cit:conditional test="!assistants.request.isValid('urlrbsdata')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="urlrbsdata"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="urlrbsdata" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="urlrbsdata" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="urlrbsdata" v="2">
                                       <span id="$$ID$$">urlrbsdata:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="urlrbsdata" ariaLabelledby="$label-id $error-ids" onDefault="geturlrbsdata()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "urlrbsstrliste") %>'>
                                 <cit:conditional test="!assistants.request.isValid('urlrbsstrliste')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="urlrbsstrliste"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="urlrbsstrliste" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="urlrbsstrliste" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="urlrbsstrliste" v="2">
                                       <span id="$$ID$$">urlrbsstrliste:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="urlrbsstrliste" ariaLabelledby="$label-id $error-ids" onDefault="geturlrbsstrliste()"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:xmlResource id="C00000009" src="js:{myForm.transaction ? 'vfs:///root/intelliForm-Mandanten/default/Ressourcen/xml/staat_2019-04-01.xml' : '/WEB-INF/data/staat_2019-04-01.xml' }" scope="CONTEXT"/>
                              <section class="block live narrow 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "objtype") %>' data-live-stay="stay_nonval_d0e398">
                                 <cit:conditional test="!assistants.request.isValid('objtype')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="objtype"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="objtype" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="objtype" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="objtype" v="2">
                                       <span id="$$ID$$">Objekttyp</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="objtype" immediate="true" ariaLabelledby="$label-id $error-ids" default="'*STRASSE*">
                                          <cit:option value="*STRASSE*">*STRASSE*</cit:option>
                                          <cit:option value="AUTOBAHN">AUTOBAHN</cit:option>
                                          <cit:option value="AUTOBAHNABSCHNITT">AUTOBAHNABSCHNITT</cit:option>
                                          <cit:option value="BAHNHOF">BAHNHOF</cit:option>
                                          <cit:option value="BRUECKE">BRUECKE</cit:option>
                                          <cit:option value="BRUECKE_IN_PARK">BRUECKE_IN_PARK</cit:option>
                                          <cit:option value="FLUGHAFEN">FLUGHAFEN</cit:option>
                                          <cit:option value="FORST">FORST</cit:option>
                                          <cit:option value="FORSTAMT">FORSTAMT</cit:option>
                                          <cit:option value="FUSS-/RADWEG">FUSS-/RADWEG</cit:option>
                                          <cit:option value="FUSSGAENGERBRUECKE">FUSSGAENGERBRUECKE</cit:option>
                                          <cit:option value="GEWAESSER">GEWAESSER</cit:option>
                                          <cit:option value="GRUENANLAGE">GRUENANLAGE</cit:option>
                                          <cit:option value="HALBINSEL">HALBINSEL</cit:option>
                                          <cit:option value="INSEL">INSEL</cit:option>
                                          <cit:option value="KLEINGARTENANLAGE">KLEINGARTENANLAGE</cit:option>
                                          <cit:option value="OBJEKT">OBJEKT</cit:option>
                                          <cit:option value="OERTL.BEGRIFF">OERTL.BEGRIFF</cit:option>
                                          <cit:option value="PARK">PARK</cit:option>
                                          <cit:option value="PARKPLATZ">PARKPLATZ</cit:option>
                                          <cit:option value="PLATZ">PLATZ</cit:option>
                                          <cit:option value="PLATZ_IN_FORST">PLATZ_IN_FORST</cit:option>
                                          <cit:option value="PRIVATSTRASSE">PRIVATSTRASSE</cit:option>
                                          <cit:option value="SCHLEUSE">SCHLEUSE</cit:option>
                                          <cit:option value="SIEDLUNG">SIEDLUNG</cit:option>
                                          <cit:option value="SPORTSTAETTE">SPORTSTAETTE</cit:option>
                                          <cit:option value="STADTBAHNBOGEN">STADTBAHNBOGEN</cit:option>
                                          <cit:option value="STRASSE">STRASSE</cit:option>
                                          <cit:option value="STRASSE_IN_FORST">STRASSE_IN_FORST</cit:option>
                                          <cit:option value="STRASSE_IN_KGA">STRASSE_IN_KGA</cit:option>
                                          <cit:option value="STRASSE_IN_PARK">STRASSE_IN_PARK</cit:option>
                                          <cit:option value="TUNNEL">TUNNEL</cit:option>
                                          <cit:option value="VERWALTUNGSWEG">VERWALTUNGSWEG</cit:option>
                                          <cit:option value="WALDWEG">WALDWEG</cit:option>
                                          <cit:option value="WASSERWERK">WASSERWERK</cit:option>
                                          <cit:option value="WOHNSCHIFF">WOHNSCHIFF</cit:option>
                                          <cit:option value="ZUFAHRT">ZUFAHRT</cit:option>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                                 <cit:inputSubmit type="stay.nonval.d0e398" id="stay.nonval.d0e398" value="OK" title="Klicken Sie auf OK, um die Seite zu aktualisieren."/>
                                 <script type="text/javascript">document.getElementById('stay_nonval_d0e398').style.display='none';</script>
                                 <cit:script>_unmask(myForm, "objtype", "string");</cit:script>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000053h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000053h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000053h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000053h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000053h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000053h" v="2" required="true">
                                       <span id="$$ID$$">Straße<span class="required-mark">
                                             <span aria-hidden="true">*</span>
                                             <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                          </span>
                                       </span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000053h" ariaLabelledby="$label-id $error-ids" required="true" onDefault="isSKB() ? getSKBStreet() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above width-xs 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "hnrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('hnrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:conditional test="!My.isCustomReason('hnrh')">
                                             <cit:errorText name="hnrh"/>
                                          </cit:conditional>
                                          <cit:conditional test="My.isCustomReason('hnrh')">
                                             <cit:errorText name="hnrh">
                                                <span id="$$ID$$">
                                                   <span class="accessibility">Fehler: </span>Bitte wählen Sie eine Hausnummer aus!</span>
                                             </cit:errorText>
                                          </cit:conditional>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="hnrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="hnrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="hnrh" v="2">
                                       <span id="$$ID$$">Hausnummer</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="hnrh" ariaLabelledby="$label-id $error-ids" onValidate="(/^\s*$/.test(value))||(myForm.objtype.includes(&#34;STRASSE&#34;) == true &amp;&amp; value.length == 0 ? false : true)" errtitle="Bitte wählen Sie eine Hausnummer aus!" onDefault="(isSKB()) ? getSKBStreetNr(): &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000016h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000016h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000016h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000016h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000016h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000016h" v="2">
                                       <span id="$$ID$$">hausnr:</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000016h" ariaLabelledby="$label-id $error-ids" onDefault="(isSKB()) ? getSKBStreetNr() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000084h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000084h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000084h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000084h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000084h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000084h" v="2">
                                       <span id="$$ID$$">hausnrz:</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000084h" ariaLabelledby="$label-id $error-ids"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above width-xs 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "bisf00000016") %>'>
                                 <cit:conditional test="!assistants.request.isValid('bisf00000016')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="bisf00000016"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="bisf00000016" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="bisf00000016" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="bisf00000016" v="2">
                                       <span id="$$ID$$">Hausnummer (bis)</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="bisf00000016" ariaLabelledby="$label-id $error-ids"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "adrzs") %>'>
                                 <cit:conditional test="!assistants.request.isValid('adrzs')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="adrzs"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="adrzs" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="adrzs" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="adrzs" v="2">
                                       <span id="$$ID$$">weiterer Adresshinweis</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="adrzs" ariaLabelledby="$label-id $error-ids"/>
                                    </div>
                                 </div>
                                 <footer><p><abbr title="zum Beispiel">z. B.</abbr> Hinterhof</p></footer>
                              </section>
                              <section class="block narrow label_above width-xs 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000054h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000054h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000054h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000054h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000054h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000054h" v="2">
                                       <span id="$$ID$$">Postleitzahl</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000054h" ariaLabelledby="$label-id $error-ids" onDefault="(isSKB()) ? getSKBPLZ() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "otnameh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('otnameh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="otnameh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="otnameh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="otnameh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="otnameh" v="2">
                                       <span id="$$ID$$">Ortsteil</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="otnameh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDotname()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "bzrnameh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('bzrnameh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="bzrnameh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="bzrnameh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="bzrnameh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="bzrnameh" v="2">
                                       <span id="$$ID$$">Bezirk</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="bzrnameh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDbezname()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "otnrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('otnrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="otnrh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="otnrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="otnrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="otnrh" v="2">
                                       <span id="$$ID$$">otnrh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="otnrh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDotnr()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "beznrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('beznrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="beznrh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="beznrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="beznrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="beznrh" v="2">
                                       <span id="$$ID$$">beznrh:</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="beznrh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDbeznr()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "strnrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('strnrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="strnrh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="strnrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="strnrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="strnrh" v="2">
                                       <span id="$$ID$$">strnrh:</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="strnrh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDstrnr()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000035h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000035h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000035h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000035h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000035h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="F00000035h" v="2">
                                       <span id="$$ID$$">Ort</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000035h" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getSKBCity() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_above 2_ro 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "landh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('landh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="landh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="landh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="landh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="label">
                                    <cit:inputLabel name="landh" v="2">
                                       <span id="$$ID$$">Land</span>
                                    </cit:inputLabel>
                                 </div>
                                 <div class="formline">
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="landh" ariaLabelledby="$label-id $error-ids" onDefault="prefillLand()">
                                          <cit:option value="">---bitte auswählen---</cit:option>
                                          <cit:xmlOptions src="urn:xmlid:C00000009" select="/*/SimpleCodeList/Row" text="Value[@ColumnRef=&#34;Staatsname_kurz&#34;]/SimpleValue" value="Value[@ColumnRef=&#34;DESTATIS_Schluessel_Staat&#34;]/SimpleValue"/>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "etrs89_xh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('etrs89_xh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="etrs89_xh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="etrs89_xh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="etrs89_xh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="etrs89_xh" v="2">
                                       <span id="$$ID$$">etrs89_xh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="etrs89_xh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDetrs89x()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "etrs89_yh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('etrs89_yh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="etrs89_yh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="etrs89_yh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="etrs89_yh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="etrs89_yh" v="2">
                                       <span id="$$ID$$">etrs89_yh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="etrs89_yh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDetrs89y()"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:inputComputed name="f00000053" value="myForm.F00000053h"/>
                              <cit:inputComputed name="hnr" value="myForm.hnrh"/>
                              <cit:inputComputed name="f00000016" value="myForm.F00000016h"/>
                              <cit:inputComputed name="f00000084" value="myForm.F00000084h"/>
                              <cit:inputComputed name="f00000054" value="myForm.F00000054h"/>
                              <cit:inputComputed name="otname" value="myForm.otnameh"/>
                              <cit:inputComputed name="bzrname" value="myForm.bzrnameh"/>
                              <cit:inputComputed name="otnr" value="myForm.otnrh"/>
                              <cit:inputComputed name="bzrnr" value="myForm.beznrh"/>
                              <cit:inputComputed name="strnr" value="myForm.strnrh"/>
                              <cit:inputComputed name="f00000035" value="myForm.F00000035h"/>
                              <cit:inputComputed name="land" value="myForm.landh"/>
                              <cit:inputComputed name="etrs89_x" value="myForm.etrs89_xh"/>
                              <cit:inputComputed name="etrs89_y" value="myForm.etrs89_yh"/>
                              <cit:inputComputed name="rbs_valid" value="validateAddress()"/>
                              <cit:inputComputed name="bezirk_nummer" value="myForm.bzrnr"/>
                           </section>
                        </div>
                        <nav id="roadmap_bottom" class="roadmap">
                           <h3 class="accessibility">Dialogverlauf</h3>
                           <ul class="icons"><% final boolean unvisited_d10e2 = !isVisited(session, "firmen-skb"); %><li class='present<%= unvisited_d10e2 ? " unvisited" : "" %>'>
                                 <span class="item">
                                    <span class="label">
                                       <span class="labeltext">Firmen SKB</span>
                                       <span class="labelicon" title='<%= unvisited_d10e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %>'>
                                          <span class="accessibility"><%= unvisited_d10e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %></span>
                                       </span>
                                    </span>
                                 </span>
                              </li>
                           </ul>
                        </nav>
                        <div class="wizard-buttons">
                           <div class="wizard-buttons-row">
                              <div class="button">
                                 <cit:inputSubmit type="cancel" class="submit-cancel prio3 icon-remove-sign" tabindex="0" value="Abbrechen"/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit type="save" class="submit-save prio3 icon-save" tabindex="0" value="Unterbrechen..." title="Klicken Sie hier, wenn Sie den Vorgang jetzt unterbrechen und später fortsetzen möchten."/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit type="back" class="submit-back prio2 icon-arrow-left" tabindex="0" value="Zurück"/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit class="submit-forward" tabindex="0" value="Weiter" type="forward"/>
                              </div>
                           </div>
                        </div>
                     </cit:form>
                     <footer>
                        <div class="footercontent">
                           <span>Powered by cit intelliForm</span>
                        </div>
                     </footer>
                  </section>
               </article>
            </div>
         </div>
      </div>
      <div id="custom_bottom"/>
   </body>
</html>