var Show = (function() { 
    var $btnNewTransaction;
    var $modalTransaction;
    var $btnSave;
    var inputAmount;

    var fetchElements = function() {
        $btnNewTransaction = $("#btn-new-transaction");
    };

    var initializeEvents = function() {
        $btnNewTransaction.on("click", function() {
            alert("hello world!");
        });
    };

    var init = function() {
        fetchElements();
        initializeEvents();
    }
    return {
        init: init
    };
})();