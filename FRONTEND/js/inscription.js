function  envoyerInformation(idHop, nomHop, password,villeHop)
{
    let xhr=new XMLHttpRequest();
    xhr.open('get',"http://localhost:200/insererHop?ID="+idHop+"&name="+nomHop+"&password="+password+"&ville="+villeHop,true);
    xhr.onload=function(){
        console.log(xhr.responseText);
         
    }
    xhr.send();
}



document.addEventListener('DOMContentLoaded',InitPage)

function InitPage(){
   document.getElementById('idFormulaire').addEventListener('submit',enregistreHopital); 
}



function enregistreHopital(e){
    e.preventDefault();
    let form = document.getElementById("idFormulaire");
 soumettre(form.idHopital.value);        

}


function soumettre(id)
{
    let xhr= new XMLHttpRequest();
    xhr.open('get',"http://localhost:200/testIdHop",true);
    xhr.onload= function traiter(){
        console.log(xhr.responseText);
        let reponse=JSON.parse(xhr.responseText);
        let form = document.getElementById("idFormulaire");
    
        
        tester(reponse);
        
        let password=document.getElementById("idFormulaire").pass.value;
        let confirm= document.getElementById("idFormulaire").Confirmpass.value;
        
        
        
        testermotdePasse(password, confirm);
        
 
        
            function tester(obj)
        {
            
             let form = document.getElementById("idFormulaire");
    
            for(let i in obj)
            {
                if(form.idHopital.value == obj[i].idHopital)
                {
                 ; alert('cet hopital exite deja');
                }
                    return
                }
               
            
           
          
        }
        
        function testermotdePasse(recupPassword,confirmation)
        {
            
            if(recupPassword==confirmation){
                envoyerInformation(form.idHopital.value, form.nomHopital.value, form.pass.value, form.ville.value); 
            }
             else {
               alert("le mot de passe ne correspond pas");      
            }
        }

   

    
    }
    
    xhr.send();
}
