document.addEventListener('DOMContentLoaded', () => {
  
  convertprice();
    
});
      
function convertprice() {
      document.querySelectorAll(".price-with-mask").forEach((input) => {
            const val = document.querySelector("input[name='client[price]']").value
           
            if (val.length > 0) {
                alert("to aqui");
                x = val.replace(/[.]/g, ",");
                document.querySelector("input[name='client[price]']").value = x;
            };

      });
        
};
