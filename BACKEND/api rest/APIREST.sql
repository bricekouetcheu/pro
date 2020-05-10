CREATE PROCEDURE "DBA"."recupID"()
RESULT (NumeroNational char(20) , NomPatient char(20))
  BEGIN
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    //call sa_set_http_header('content-type','text/html');
    SELECT IdPatient , nomPatient
    FROM Patient
end

CREATE PROCEDURE "DBA"."recupLogin"()

RESULT(nomUtilisateur char(20) , motdepasse char(20))
  BEGIN
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    //call sa_set_http_header('content-type','text/html');
    SELECT DBA.Hopital.idHopital , DBA.Hopital.motDePasse
    FROM Hopital
end


CREATE PROCEDURE "DBA"."recupNombrestotal"()
    result (nombresTotal int)
    begin
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    select count(idPatient) from Patient
	
end

//tri selon les hopitaux

CREATE PROCEDURE "DBA"."triParHopitaux"()
       result (nomHopital char(20) , nombresInfecte char(3))
    BEGIN 
         Call sa_set_http_header('Access-Control-Allow-Origin', '*'); 
           select h.nomHopital, count(p.idPatient) as nombresInfectés
           FROM patient as p natural join Hopital as h 
            GROUP BY h.nomHopital
    end
CREATE SERVICE "triHopitaux" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call triParHopitaux();
	
	//tri selon les villes
	CREATE PROCEDURE "DBA"."triParVille"( in vil char(6) , in sympt char(3))
    result (Identite char(20) , sexe char(3))
        begin
        Call sa_set_http_header('Access-Control-Allow-Origin', '*');
        select nomPatient ||' '||prenomPatient , sexe
        from patient as p natural join ville as v 
        where p.villeId = vil and p.symptomes=sympt
    end
		
		CREATE SERVICE "triVille" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call triParVille(:vil, : sympt);
	
	
	
	//insertion patient
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
	
	
	
	CREATE SERVICE "insertion" TYPE 'HTML' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AScall insertion(:ID,:name,:lastname,:sex,:DateN,:DateA,:num,:symp,:vil,:hop)
	
	
	