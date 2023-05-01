function retrievePerchaseAmount() {
    var allQuantities = document.querySelectorAll(".quantity");

    for (let i = 0; i < allQuantities.length; i++) {
        $.ajax({
            url: "/WeMatch_dev/shoppingCart/updateStock",
            data: {
                productId: allQuantities[i].getAttribute("name"),
                stock: allQuantities[i].value,
            },
            type: "get",
            dataType: "json",

        })
    }
}

$(document).ready(() => {
    var allItemsInCart = document.querySelectorAll("h4");
    var allItemsInCartLength = allItemsInCart.length;

    for (let i = 0; i < allItemsInCartLength; i++) {

        $("#minus" + allItemsInCart[i].getAttribute("id")).click(() => {
            var quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            if (quantityVal <= 0) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val("0");
            } else {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val(quantityVal - 1);
            }

            quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            $("#itemTotal" + allItemsInCart[i].getAttribute("id")).html(parseInt($("#itemTotal" + allItemsInCart[i].getAttribute("id")).attr("name")) * quantityVal);

            toltalAmountMoney()

        });

        $("#add" + allItemsInCart[i].getAttribute("id")).click(() => {
            var quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            if (quantityVal >= parseInt($("#stock" + allItemsInCart[i].getAttribute("id")).html())) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val($("#stock" + allItemsInCart[i].getAttribute("id")).html());
            } else {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val(quantityVal + 1);
            }

            quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            $("#itemTotal" + allItemsInCart[i].getAttribute("id")).html(parseInt($("#itemTotal" + allItemsInCart[i].getAttribute("id")).attr("name")) * quantityVal);

            toltalAmountMoney()

        });

        $("#quantity" + allItemsInCart[i].getAttribute("id")).blur(() => {
            var quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            if (quantityVal >= parseInt($("#stock" + allItemsInCart[i].getAttribute("id")).html())) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val($("#stock" + allItemsInCart[i].getAttribute("id")).html());
            }
            if (quantityVal <= 0) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val("0");
            }
            quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            $("#itemTotal" + allItemsInCart[i].getAttribute("id")).html(parseInt($("#itemTotal" + allItemsInCart[i].getAttribute("id")).attr("name")) * quantityVal);
            toltalAmountMoney()
        });

    }

    function toltalAmountMoney() {
        var allItemsInCart1 = document.querySelectorAll("h4");
        var allItemsInCartLength1 = allItemsInCart1.length;
        var totalAmount = 0;
        var itemTotal = 0.0;
        for (let j = 0; j < allItemsInCartLength1; j++) {
            if ($("#itemTotal" + allItemsInCart1[j].getAttribute("id")).html() == "") {
                itemTotal = 0;
            } else {
                itemTotal = parseInt($("#itemTotal" + allItemsInCart1[j].getAttribute("id")).html());
            }
            totalAmount = totalAmount + itemTotal;
        }
        $("#totalAmount").val(totalAmount);
    }
    toltalAmountMoney()
})

function cartkey() {
		document.getElementById("rec_name").value = "小奕";
		document.getElementById("rec_phone").value = "0910156347";
		document.getElementById("rec_address").value = "106台北市大安區復興南路一段390號2樓";
		document.getElementById("rec_email").value = "yee2020@gmail.com";
		document.getElementById("rec_note").value = "需打統編:35701598";
		checkname();
		checkphone();
		checkaddress();
		checkemail();
	}

	function checkname() {
		let theNameObj = document.getElementById("rec_name");
		let theNameObjVal = theNameObj.value;
		let theNameObjValLen = theNameObjVal.length;
		let chinese = /^[\u4e00-\u9fa5]{2,}$/;
		var nameoutcome = document.getElementById("namecheck");
		if (theNameObjVal == "") {
			nameoutcome.innerHTML = "⛔不可空白";
			nameoutcome.style.color = "#A23400";
			return false;
		} else if (theNameObjValLen < 2) {
			nameoutcome.innerHTML = "⛔請填完整姓名";
			nameoutcome.style.color = "#A23400";
			return false;
		} else if (!chinese.test(theNameObjVal)) {
			nameoutcome.innerHTML = "⛔請輸入中文";
			nameoutcome.style.color = "#A23400";
			return false;
		} else if (chinese.test(theNameObjVal) && theNameObjValLen >= 2) {
			nameoutcome.innerHTML = "👌🏻格式正確";
			nameoutcome.style.color = "#408080";
			return true;
		} else {
			nameoutcome.innerHTML = "⛔格式有誤";
			nameoutcome.style.color = "#A23400";
			return false;
		}
	}

	function checkphone() {
		let thePhoneObj = document.getElementById("rec_phone");
		let thePhoneObjVal = thePhoneObj.value;
		let thePhoneObjValLen = thePhoneObjVal.length;
		let unmber = /09\d{8}/;
		var phoneoutcome = document.getElementById("phonecheck");
		if (thePhoneObjVal == "") {
			phoneoutcome.innerHTML = "⛔不可空白";
			phoneoutcome.style.color = "#A23400";
			return false;
		} else if (unmber.test(thePhoneObjVal)) {
			phoneoutcome.innerHTML = "👌🏻格式正確";
			phoneoutcome.style.color = "#408080";
			return true;
		} else {
			phoneoutcome.innerHTML = "⛔請填10個阿拉伯數字";
			phoneoutcome.style.color = "#A23400";
			return false;
		}
	}

	function checkaddress() {
		let theAddressObj = document.getElementById("rec_address");
		let theAddressObjVal = theAddressObj.value;
		let theAddressObjValLen = theAddressObjVal.length;
		var addressoutcome = document.getElementById("addresscheck");
		if (theAddressObjVal == "") {
			addressoutcome.innerHTML = "⛔不可空白";
			addressoutcome.style.color = "#A23400";
			return false;
		} else if (theAddressObjValLen < 5) {
			addressoutcome.innerHTML = "⛔請填完整地址";
			addressoutcome.style.color = "#A23400";
			return false;
		} else if (theAddressObjVal != "" && theAddressObjValLen >= 5) {
			addressoutcome.innerHTML = "👌🏻格式正確";
			addressoutcome.style.color = "#408080";
			return true;
		} else {
			addressoutcome.innerHTML = "⛔格式有誤";
			addressoutcome.style.color = "#A23400";
			return false;
		}
	}

	function checkemail() {
		let theEmailObj = document.getElementById("rec_email");
		let theEmailObjVal = theEmailObj.value;
		let theEmailObjValLen = theEmailObjVal.length;
		let emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		var emailoutcome = document.getElementById("emailcheck");
		if (theEmailObjVal == "") {
			emailoutcome.innerHTML = "⛔不可空白";
			emailoutcome.style.color = "#A23400";
			return false;
		} else if (emailRule.test(theEmailObjVal)) {
			emailoutcome.innerHTML = "👌🏻格式正確";
			emailoutcome.style.color = "#408080";
			return true;
		} else {
			emailoutcome.innerHTML = "⛔格式有誤";
			emailoutcome.style.color = "#A23400";
			return false;
		}
	}

	function cartsubmit() {
		if (checkname() && checkphone() && checkaddress() && checkemail()) {
			return true;
		} else {
			alert("⛔  欄位有誤 請重新確認再送出！");
			return false;
		}
	}
	
	
	function deleteitem(ProductId){
		location=`deleteCartItem/${ProductId}`;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	