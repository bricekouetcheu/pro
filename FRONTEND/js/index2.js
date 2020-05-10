function getId(id){
    document.getElementById(id);
}


function  envoyerInformation(identite,nom,prenom,sexe,dateNaissance,dateAdmission,numero,symptomes,ville,hopital)
{
    let xhr=new XMLHttpRequest();
    xhr.open('get',"http://localhost:200/insertion?ID="+identite+"&name="+nom+"&lastname="+prenom+"&sex="+sexe+"&dateN="+dateNaissance+"&dateA="+dateAdmission+"&num="+numero+"&symp="+symptomes+"&vil="+ville+"&hop="+hopital,true);
    xhr.onload=function(){
        
        alert("le patient a ete ajoute");
        console.log(xhr.responseText);
    }
    xhr.send();
}



document.addEventListener('DOMContentLoaded',InitPage)

function InitPage(){
   document.getElementById('formulairePatient').addEventListener('submit',enregistrerPatient); 
}



function enregistrerPatient(e){
    e.preventDefault();
    
        let hosto = document.getElementById("hop");
        let vil= document.getElementById("idville");
   
        
        let form = document.getElementById("formulairePatient");
    
    let forma = this;
       
 soumettre(form.numeroNational.value);        

}


function soumettre(idpatient)
{
    let xhr= new XMLHttpRequest();
    xhr.open('get',"http://localhost:200/testID",true);
    xhr.onload= function traiter(){
        console.log(xhr.responseText);
        let reponse = JSON.parse(xhr.responseText);
        
        
        let hosto = document.getElementById("hop");
        let vil= document.getElementById("idville");
   
        
        let form = document.getElementById("formulairePatient");
    
        
        tester(reponse);
        
 envoyerInformation(form.numeroNational.value, form.nomPatient.value,form.prenomPatient.value, form.genre.value, form.dateNaissance.value, form.dateAdmission.value, form.numeroGsm.value, form.symptome.value, vil.value , hosto.value);
        
            function tester(obj)
        {
            
             let form = document.getElementById("formulairePatient");
    
            for(let i in obj)
            {
                if(form.numeroNational.value == obj[i].NumeroNational)
                {
                    alert('ce patient exite deja');
                    return
                }
            }
            
           
          
        }

   

    
    }
    
    xhr.send();
}

document.getElementById("idboutonTotal").addEventListener('click',afficherNombreTotal);

function afficherNombreTotal(){
    let xhr = new XMLHttpRequest();
    xhr.open('get','http://localhost:200/nombreTotal',true);
    xhr.onload = function(){
        let rep = JSON.parse(xhr.responseText);
        afficherResultat(rep,"messageTotal");
        
        function afficherResultat(obj , id){
            let valeur ="<p> le nombre total d'infecte s'eleve a "+obj[0].nombresTotal+"</p>"
            document.getElementById(id).innerHTML=valeur;
            
           
        }
        
    }
    
    xhr.send();
}

document.getElementById("idboutonParHopitaux").addEventListener('click', afficherTotalParVille)

function afficherTotalParVille(){
    let xhr = new XMLHttpRequest();
    xhr.open ("get" , 'http://localhost:200/triHopitaux' , true);
    xhr.onload = function(){
        let rep = JSON.parse(xhr.responseText);
        trierParHopitaux(rep);
        
        function trierParHopitaux(obj){
            
            let tableau = "<table><thead><tr>";
            let attributs = Object.keys(obj[0]);
            for(let i in attributs){
                tableau+="<th>"+attributs[i]+"</th>";
                
                }
                tableau+='</tr></thead><tbody>';
            for(let i in obj){
                tableau+="<tr>";
                for(let j in obj[i]){
                    tableau+="<td>"+obj[i][j]+"</td>";
                }
                tableau+="</tr>";
            }
            tableau+="</tbody></table>";
            document.getElementById("messageHopitaux").innerHTML=tableau;

            
            
            
        }
        
    }
    
    xhr.send();
}



