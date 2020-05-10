//fonctions utilitaires






function getId(id){
    document.getElementById(id);
}

document.addEventListener('DOMContentLoaded',InitPage)

function InitPage(){
   document.getElementById('idlogin').addEventListener('submit',SoumettreFormulaire); 
}


function SoumettreFormulaire(e){
   e.preventDefault();
       
    let form1 =document.getElementById("iduserName");
       let form2 =document.getElementById("idpassword");
   
    recupererHopitaux( form1.value, form2.value);
//document.getElementById('idlogin').addEventListener("submit" , soumettre);
}



function recupererHopitaux(username,password){
	let xhr=new XMLHttpRequest();
    
	xhr.open('get', 'http://localhost:200/inserer' , true);
    
	xhr.onload=function traiter()
    {
        
		console.log(xhr.responseText);
        console.log("bonjour");
        
     let reponse = JSON.parse(xhr.responseText);
        
        soumettre(reponse);
    
        
          function soumettre(obj)
        {
           
            for(let i in obj)
                {
                    if(username==obj[i].nomUtilisateur && password == obj[i].motdepasse)
                        {
                            getFormulaire();
                            
                            function getFormulaire()
                            {
                            let xhr = new XMLHttpRequest();
                                xhr.open('get','http://localhost:200/page?url=index2',true);
                                console.log('bonjour');
                                console.log('vous avez reussi');
                                xhr.onload=function(){
                                    console.log(xhr.responseText);
                                }
                                
                                xhr.send();
                                
                            }
                            
                           return
                            
                        }
                            
        
                }
           alert("mot de passe ou username incorrect");
           
                            
    
        }
  
   
}
      xhr.send(); 
}
        
