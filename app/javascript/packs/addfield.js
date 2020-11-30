
function iniciar() {
    
    document.getElementById("btnAdd").addEventListener("click", function (e) {
        e.preventDefault();     //prevenir novos clicks
       
        var inp = document.getElementById("camp");
        var i = document.createElement("input");
        inp.appendChild(i);

    });
};

// window.addEventListener("load", iniciar);
(function() {
    iniciar();
})();