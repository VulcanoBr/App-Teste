


/* Máscaras Telephone */
function mascara(o,f){
    v_obj=o;
    v_fun=f;
    execmascara();
};
function execmascara(){
    v_obj.value=v_fun(v_obj.value);
};
function mtel(v){
    v=v.replace(/\D/g,""); //Remove tudo o que não é dígito
    v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v=v.replace(/(\d)(\d{4})$/,"$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
     return v;
};
function id( el ){
    return document.getElementById( el );
};

// window.onload = function(){
//console.log("antes de tudo");
(function () {

//console.log("antes de input");
	id('phone').onkeyup = function(){
        mascara( this, mtel );

    //console.log("depois da mascara");
	}
})();
//.log("antes de tudo 1");
//document.addEventListener("DOMContentLoaded", () => {
//    console.log("antes do input 1");
//    document.getElementById('phone').addEventListener("input", () => {
///        console.log("antes da mascara 1");
//       mascara(this, mtel);
//        console.log("depos da mascara 1");
 //   });
//});
// console.log("depos de tudo 1");