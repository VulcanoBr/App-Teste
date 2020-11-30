//document.addEventListener('DOMContentLoaded', () => {
(function convert() {
    document.getElementById('btn').addEventListener('input', function(e) {
        v = e.target.value.replace(/\D/g,'');
        alert("entrei");
   // var b = document.getElementsById("btn");
    //document.getElementById('test').addEventListener('click', function(e) {
  //      var m = e.target.value
 //   b.addEventListener("click", function() {
        alert("na função");
        var m = document.getElementsById("valor").value;
        alert("valor " + m);
        var numUSD = new Intl.NumberFormat("en-US", {
            style:"currency", currency: "USD"

        });
    
     //   alert(numUSD.format(m));
        alert("valor " + m);
    });

})();