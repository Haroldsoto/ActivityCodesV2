$(function () {
    $(".transactionsDDL").hide();
    $("#msgSuccess").hide();
    $("#btnSubmit").hide();
    $("#btnFinish").hide();
    $("#Code").change(function () {
        if ($("#Code").val() == "-") {
            $("#btnSubmit").hide("fast");
            return;
        } else {
            $("#btnSubmit").show("fast");
            $("#btnFinish").show("fast");
        }

    });
    $("#productsDDL").change(function () {
        var options = $("#Code");
        var products = $(this).val();
        if (products == "") {
            $(".transactionsDDL").hide("fast");
            $("#btnSubmit").hide("fast");
            $("#btnFinish").hide("fast");
            options.html("");
            return;
        }
        $(".transactionsDDL").show("fast");
        $.ajax("/ActivityCodesV2/Main/GetTransactions", {
            data: { "products": products },
            type: "get",
            contentType: "application/json",
            success: function (result) {
                options.html("");
                options.append($("<option />").val("-").text("-Seleccione una Transacción-"));
                $.each(result, function () {
                    options.append($("<option />").val(this.Value).text(this.Text));
                });
                $("#transactionsDDL").change();
            }
        });
    });

    $('#btnSubmit').click(function() {
        $('.transactionsDDL').hide("medium");
        $(this).hide("medium");
        $('#productosDDL option:selected').attr('selected', null);
    });

    $('#btnFinish').click(function () {
        var transaction = $('#Code :selected').val();
        var product = $('#productsDDL :selected').val();
        var activityCode = product + transaction;
        var transactionText = $('#Code :selected').text();
        var productText = $('#productsDDL :selected').text();
        var activityCodeText = "[" + productText + '] -> [' + transactionText + "]";

        $.ajax("/ActivityCodesV2/Main/RegisterCall", {
            data: JSON.stringify({
                "activityCode": activityCode,
                "activityCodeText": activityCodeText
            }),
            type: "POST",
            contentType: "application/json",
            success: function (result) {
                if (result.result === true) {
                    $("#msgSuccess").show("fast");
                    setTimeout(function () {
                        window.location = self.location;
                    }, 2500);
                    return;
                }
                alert('Error!');
            }
        });

    });

});