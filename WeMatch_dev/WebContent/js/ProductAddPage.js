$(() => {
    $("#productNameId").blur(() => {
        let userInput = $("#productNameId").val();
        let reg = /.{1,20}/;
        if (reg.test(userInput)) {
            $("#productSp").html("checked!");
        } else {
            $("#productSp").html("invalid!");
        }
    })

    $("#productPriceId").blur(() => {
        let userInput = $("#productPriceId").val();
        let reg = /[0-9]{1,6}/;
        if (reg.test(userInput)) {
            $("#priceSp").html("checked!");
        } else {
            $("#priceSp").html("invalid!");
        }
    })

    $("#productStockId").blur(() => {
        let userInput = $("#productStockId").val();
        let reg = /[0-9]{1,2}/;
        if (reg.test(userInput)) {
            $("#stockSp").html("checked!");
        } else {
            $("#stockSp").html("invalid!");
        }
    })

    $("#productDescriptionId").blur(() => {
        let userInput = $("#productDescriptionId").val();
        let reg = /.{0,200}/;
        if (reg.test(userInput)) {
            $("#descriptionSp").html("checked!");
        } else {
            $("#descriptionSp").html("invalid!");
        }
    })

    $("#productAddBtn").click(() => {
        if ($("#productSp").html() == "checked!" && $("#priceSp").html() == "checked!" && $("#stockSp").html() == "checked!" && $("#descriptionSp").html() == "checked!") {
            $("#productAddForm").submit();
        } else {
            alert("新增產品資訊有誤！");
        }
    })

    const fileInput1 = document.querySelector('#thumbnailId');
    const fileInput2 = document.querySelector('#detailImgId');
    const preview1 = document.querySelector('#thumbnailPreview');
    const preview2 = document.querySelector('#detailImgPreview');
    const reader1 = new FileReader();
    const reader2 = new FileReader();

    function handleEvent(event) {
        if (event.type === "load") {
            preview1.src = reader1.result;
            preview2.src = reader2.result;
        }
    }

    function addListeners(reader) {
        reader1.addEventListener('loadstart', handleEvent);
        reader1.addEventListener('load', handleEvent);
        reader1.addEventListener('loadend', handleEvent);
        reader1.addEventListener('progress', handleEvent);
        reader1.addEventListener('error', handleEvent);
        reader1.addEventListener('abort', handleEvent);
        reader2.addEventListener('loadstart', handleEvent);
        reader2.addEventListener('load', handleEvent);
        reader2.addEventListener('loadend', handleEvent);
        reader2.addEventListener('progress', handleEvent);
        reader2.addEventListener('error', handleEvent);
        reader2.addEventListener('abort', handleEvent);
    }

    function handleSelected(e) {
        const selectedFile1 = fileInput1.files[0];
        const selectedFile2 = fileInput2.files[0];
        if (selectedFile1) {
            addListeners(reader1);
            reader1.readAsDataURL(selectedFile1);

        }
        if (selectedFile2) {
            addListeners(reader2);
            reader2.readAsDataURL(selectedFile2);
        }
    }
    fileInput1.addEventListener('change', handleSelected);
    fileInput2.addEventListener('change', handleSelected);

})