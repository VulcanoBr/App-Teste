//document.querySelectorAll(".btn").addEventListener("click", (event) => {
 // alert("entrei");
 // const val = event.document.querySelector("input[name='client[price]']").value
 //     .replace(/[.]/g, "");
 //     x = val.replace(/[,]/g, ".");
 //     document.querySelector("input[name='client[price]']").value = x;
//});

document.addEventListener('DOMContentLoaded', () => {
  //  (function () {
 //       console.log("entrei");
       convert();
    
});
      
function convert() {
  document.querySelectorAll(".btn").forEach((submit) => {
    submit.addEventListener("click", ({ target }) => {
          alert("convert");
  //     const val = document.querySelector("input[name='client[price]']");
         const val = document.querySelector("input[name='client[price]']").value
         .replace(/[.]/g, "");
         x = val.replace(/[,]/g, ".");
      
         alert("valor2 " + x);
        document.querySelector("input[name='client[price]']").value = x;

        const val1 = document.querySelector("input[name='client[unit_price]']").value
          .replace(/[.]/g, "");
        z = val1.replace(/[,]/g, ".");
     
          alert("valor2 " + z);
       document.querySelector("input[name='client[unit_price]']").value = z;
    });
  });
        
};

  //  (function iniciar()  {
        
      //  convert();

      //   var x = "";
      
       //   x =  document.querySelector("input[name='client[price]']").value
            //    .replace(/[^\d.]/g, '');
       //     .replace(/[,.]/g, ".");
           
         //   alert("valor " + x );
      //    x = parseFloat(valor).toFixed(2);
      //    alert("valor2" + x);
     // document.querySelector("input[name='client[price]']").value = x;
           
         //   console.log("valor " + valor);
       //  return price;
  //  })();

