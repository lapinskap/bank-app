var Show = (function() { 
    var $btnNewTransaction;
    var $modalTransaction;
    var $btnSave;
    var inputAmount;
    var selectTransactionType;

    var fetchElements = function() {
        $btnNewTransaction = $("#btn-new-transaction");
        $modalTransaction = $("#modal-transaction");
        $btnSave = $("#btn-save");
        $inputAmount = $("#input-amount");
        $selectTransactionType = $("#select-transaction-type");
    };

    var initializeEvents = function() {
        $btnNewTransaction.on("click", function() {
            $modalTransaction.modal("show");
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