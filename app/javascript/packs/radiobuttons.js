
  x = "";

(function (){
    var radios = document.getElementsByName('exp');
   
          
    
    for(var i = 0; i < radios.length; i++){
        radios[i].onclick = function(){
            document.getElementById('choiceLabel').innerText = this.value;
            x = this.value;
            
            if (x === "cpf") {
                document.getElementById('choiceLabel').innerText = "valw cpf";
                document.querySelector("input[name='client[cpf_cnpj]']").value  = "";
                document.querySelector("input[name='client[cpf_cnpj]']").placeholder = "CPF";
                mascaracpf();   
                 }
               
            else  if (x === "cnpj") {
                    document.getElementById('choiceLabel').innerText = "vale cnpj";
                    document.querySelector("input[name='client[cpf_cnpj]']").value  = "";
                    document.querySelector("input[name='client[cpf_cnpj]']").placeholder = "CNPJ";
                    mascaracnpj();
                     }
                  else
                    document.getElementById('choic {eLabel').innerText = "sem escolha";
                
        };
    };
})();

function mascaracpf( ){

    document.getElementById('test').addEventListener('input', function(e) {
        var c = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
        e.target.value = !c[2] ? c[1] : c[1] + '.' + c[2] + '.' + c[3] + (c[4] ? '-' + c[4] : '');
    });
   
}

function mascaracnpj( ){

    document.getElementById('test').addEventListener('input', function(e) {
        var x = e.target.value.replace(/\D/g, '').match(/(\d{0,2})(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,2})/);
        e.target.value = !x[2] ? x[1] : x[1] + '.' + x[2] + '.' + x[3] + '/' + x[4] + (x[5] ? '-' + x[5] : '');
    });
   
}

function validaCpfCnpj() {
    var cpfcnpj = document.getElementById("test").value;
    alert(cpfcnpj.length)
    var y = CpfCnpjValida(cpfcnpj);
    x = "cpf";
    alert(cpfcnpj + " " + x);
    if (x == "cpf" && y == false) {
        alert(" CPF  Invalido !!!" + cpfcnpj);
    } else
        if(x == "cnpj"  && y == false)  {
            alert("CNPJ Invalido !!!" + cpfcnpj);
        }  else
                alert("depois da validação");


}

function CpfCnpjValida(val) {
    if (val.length == 14) {
        var cpf = val.trim();
     
        cpf = cpf.replace(/\./g, '');
        cpf = cpf.replace('-', '');
        cpf = cpf.split('');
        
        var v1 = 0;
        var v2 = 0;
        var aux = false;
        
        for (var i = 1; cpf.length > i; i++) {
            if (cpf[i - 1] != cpf[i]) {
                aux = true;   
            }
        } 
        
        if (aux == false) {
            return false; 
        } 
        
        for (var i = 0, p = 10; (cpf.length - 2) > i; i++, p--) {
            v1 += cpf[i] * p; 
        } 
        
        v1 = ((v1 * 10) % 11);
        
        if (v1 == 10) {
            v1 = 0; 
        }
        
        if (v1 != cpf[9]) {
            return false; 
        } 
        
        for (var i = 0, p = 11; (cpf.length - 1) > i; i++, p--) {
            v2 += cpf[i] * p; 
        } 
        
        v2 = ((v2 * 10) % 11);
        
        if (v2 == 10) {
            v2 = 0; 
        }
        
        if (v2 != cpf[10]) {
            return false; 
        } else {   
            return true; 
        }
    } else if (val.length == 18) {
        var cnpj = val.trim();
        
        cnpj = cnpj.replace(/\./g, '');
        cnpj = cnpj.replace('-', '');
        cnpj = cnpj.replace('/', ''); 
        cnpj = cnpj.split(''); 
        
        var v1 = 0;
        var v2 = 0;
        var aux = false;
        
        for (var i = 1; cnpj.length > i; i++) { 
            if (cnpj[i - 1] != cnpj[i]) {  
                aux = true;   
            } 
        } 
        
        if (aux == false) {  
            return false; 
        }
        
        for (var i = 0, p1 = 5, p2 = 13; (cnpj.length - 2) > i; i++, p1--, p2--) {
            if (p1 >= 2) {  
                v1 += cnpj[i] * p1;  
            } else {  
                v1 += cnpj[i] * p2;  
            } 
        } 
        
        v1 = (v1 % 11);
        
        if (v1 < 2) { 
            v1 = 0; 
        } else { 
            v1 = (11 - v1); 
        } 
        
        if (v1 != cnpj[12]) {  
            return false; 
        } 
        
        for (var i = 0, p1 = 6, p2 = 14; (cnpj.length - 1) > i; i++, p1--, p2--) { 
            if (p1 >= 2) {  
                v2 += cnpj[i] * p1;  
            } else {   
                v2 += cnpj[i] * p2; 
            } 
        }
        
        v2 = (v2 % 11); 
        
        if (v2 < 2) {  
            v2 = 0;
        } else { 
            v2 = (11 - v2); 
        } 
        
        if (v2 != cnpj[13]) {   
            return false; 
        } else {  
            return true; 
        }
    } else {
        return false;
    }
 }
