// document.addEventListener('DOMContentLoaded', () => {
function convert() {
    alert("entrei");
    var b = document.getElementsById("btn");
    
 //   b.addEventListener("click", function() {
        alert("na função");
        var m = document.getElementsById("valor").value;
        var numUSD = new Intl.NumberFormat("en-US", {
            style:"currency", currency: "USD"

        });
    
        alert(numUSD.format(m));
    
  //  });

};