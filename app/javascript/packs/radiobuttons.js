
  x = "";

(function (){
    var radios = document.getElementsByName('exp');
 
    document.querySelector("input[name='client[cpf_cnpj]']").placeholder = "Escolha CPF ou CNPJ";
    
    for(var i = 0; i < radios.length; i++){
        radios[i].onclick = function(){
           
            x = this.value;
            
            if (x === "cpf") {
               
                document.querySelector("input[name='client[cpf_cnpj]']").value  = "";
                document.querySelector("input[name='client[cpf_cnpj]']").placeholder = "CPF";
                mascaracpf();   
                 }
               
            else  if (x === "cnpj") {
                    
                    document.querySelector("input[name='client[cpf_cnpj]']").value  = "";
                    document.querySelector("input[name='client[cpf_cnpj]']").placeholder = "CNPJ";
                    mascaracnpj();
                     }
                  else
                    document.getElementById('choiceLabel').innerText = "sem escolha";
                
        };
    };
})();

function mascaracpf( ){

    document.getElementById('test').addEventListener('input', function(e) {
        var c = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
        e.target.value = !c[2] ? c[1] : c[1] + '.' + c[2] + '.' + c[3] + (c[4] ? '-' + c[4] : '');
    });
   
};

function mascaracnpj( ){

    document.getElementById('test').addEventListener('input', function(e) {
        var x = e.target.value.replace(/\D/g, '').match(/(\d{0,2})(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,2})/);
        e.target.value = !x[2] ? x[1] : x[1] + '.' + x[2] + '.' + x[3] + '/' + x[4] + (x[5] ? '-' + x[5] : '');
    });
   
};


