
-----------//recuperer les ID des patients deja enregistré(fait par Brice Ronald Kouetcheu kakmeni)-------------

CREATE PROCEDURE "DBA"."recupID"()
RESULT (NumeroNational char(20) , NomPatient char(20))
  BEGIN
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    //call sa_set_http_header('content-type','text/html');
    SELECT IdPatient , nomPatient
    FROM Patient
end

CREATE SERVICE "testID" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call triParHopitaux();



//recuperer ID et le mot de passe des hopitaux deja enregistré(fait par brice Ronald kouetcheu kakmeni)
CREATE PROCEDURE "DBA"."recupLogin"()

RESULT(nomUtilisateur char(20) , motdepasse char(20))
  BEGIN
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    //call sa_set_http_header('content-type','text/html');
    SELECT DBA.Hopital.idHopital , DBA.Hopital.motDePasse
    FROM Hopital
end

---------------/affiche le nombre de cas total-----------


CREATE PROCEDURE "DBA"."recupNombrestotal"()
    result (nombresTotal int)
    begin
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    select count(idPatient) from Patient
	
end

---------------//tri selon les hopitaux(fait par Aurelle Tilly Awountsa Donhoungo )-----------

CREATE PROCEDURE "DBA"."triParHopitaux"()
       result (nomHopital char(20) , nombresInfecte char(3))
    BEGIN 
         Call sa_set_http_header('Access-Control-Allow-Origin', '*'); 
           select h.nomHopital, count(p.idPatient) as nombresInfectés
           FROM patient as p natural join Hopital as h 
            GROUP BY h.nomHopital
    end
CREATE SERVICE "triHopitaux" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call triParHopitaux();


	
	----------//tri selon les villes(fait par Davy Aymar Hakizimana)------------
	CREATE PROCEDURE "DBA"."triParVille"( in vil char(6) , in sympt char(3))
    result (Identite char(20) , sexe char(3))
        begin
        Call sa_set_http_header('Access-Control-Allow-Origin', '*');
        select nomPatient ||' '||prenomPatient , sexe
        from patient as p natural join ville as v 
        where p.villeId = vil and p.symptomes=sympt
    end
		
		CREATE SERVICE "triVille" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call triParVille(:vil, : sympt);
	
	
	
	------------//insertion patient(fait par Brice Ronald Kouetcheu Kakmeni)--------------
	create PROCEDURE "DBA"."insertion"(in ID char(100) , in name char(10), in lastname char(10), in sex char(1), in DateN DATE  , in dateA DATE , in num char(15) ,in symp char(3) , in  vil char(6),in hop char(6))
    result (IDpatient char(6) , Nom char(10) , Prenom char(10) , sexe char(1), dateN char(10) ,dateA char(10), numero char(15), symptome char(3) , ville char(6), hopital char(6))
 BEGIN 
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
   call sa_set_http_header( 'Content-Type', 'text/html' );

         IF (select  count(*)    
                  from Patient 
                 WHERE idPatient=ID)<1 
            THEN   insert into Patient values
            (ID,name,lastname,sex,DateN,DateA,num,symp,vil,hop);
                 ELSE 
                     call sa_set_http_header( 'Content-Type', 'text/html' );
                     SELECT '<p>'+'patient deja rentre'+'</p>'
            ENDIF 
 END
	
	
    
    
-------------	//ajout de nouveau hopitaux (fait par Aurelle Tilly Awountsa Donhoungo )---------------
    
	CREATE SERVICE "insertion" TYPE 'HTML' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AScall insertion(:ID,:name,:lastname,:sex,:DateN,:DateA,:num,:symp,:vil,:hop)
    
    
    ALTER PROCEDURE "DBA"."inscrire"(in ID char(6) , in name char(40), in password char(15), in ville char(6) )
    result ( idHopital char(6) , nomHopital char(40) , motPasse char(15) , ville char(6))
 BEGIN 
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
   call sa_set_http_header( 'Content-Type', 'text/html' );


         IF (select  count(*)    
                  from Hopital 
                 WHERE idHopital=ID)<1 
            THEN   insert into Hopital values
            (ID, name, password, ville);
                 ELSE 
                     call sa_set_http_header( 'Content-Type', 'text/html' );
                     SELECT '<p>'+'Cet hopital existe  deja dans la base de données'+'</p>'
            ENDIF 
 END
	
CREATE SERVICE "insererHop" TYPE 'HTML' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AScall insertion(:ID,:name,:password,:ville)
	
	