function deleteConfirm(productId, productName) {
    if (confirm(`Are you going to delet ${productName} ?`)) {
        location = `deleteProduct?productId=${productId}`;
    }
}

function modifyConfirm(productId) {
    location = `updateProduct/${productId}`;
}

$(document).ready(() => {
    var productCategories = ["Massager", "Yoga", "Supplement"];

    function searchProduct(keywordStr, sorttingStr) {
        var itemPerPage = 3; // 一頁幾個商品
        var nowPage = 1; // 起始頁面
        var totalPage = 0; // 全部頁數
        $.ajax({
            url: "/WeMatch_dev/product/search",
            data: {
                keyword: keywordStr,
                sortting: sorttingStr,
            },
            type: "get",
            dataType: "json",
            success: function(data) {
                $("#searchNum").empty();
                $("#searchNum").html("Currently we have " + data.length + " search results: ");
                // 上傳檔案
                function uploadDataToTable(productCategory) {
                    $("#content" + productCategory).empty();
                    $("#page" + productCategory).empty();
                    var txt = "";
                    var dataLength = 0;
                    for (let i = 0; i < data.length; i++) {
                        if (data[i].category == productCategory) {
                            var base64String = btoa(String.fromCharCode.apply(null, new Uint8Array(data[i].thumbnail)));
                            txt += "<tr><td>" +
                                "<a href='examProduct/" + data[i].productId + "'><img alt='No image' src='data:image/jpg;base64," + base64String + "'hight='250px' width='250px'></a>" +
                                '</td><td class="' + productCategory + '" id="' + data[i].productId + '" style="width:200px;">' + data[i].updateDate + "<br/>" + data[i].productName +
                                '</td><td style="width:100px;"><h6 style="color:black;">$ ' + data[i].price + '</h6></td><td>' +
                                `<p style='text-align: center;'><input type='button' onclick='modifyConfirm("${data[i].productId}")' class='btn btn-primary px-5 py-3 mt-3' value=' Edit '></p>` +
                                `<p style='text-align: center;'><input type='button' onclick='deleteConfirm("${data[i].productId}", "${data[i].productName}")' class='btn btn-primary px-5 py-3 mt-3' value='Delete'></p>` +
                                '</td></tr>';
                            dataLength++;
                        }
                    }
                    $("#content" + productCategory).append(txt);
                    $("#searchNum").append($("td." + productCategory).length + " " + productCategory + " ");
                    // 計算總頁數
                    totalPage = Math.ceil(dataLength / itemPerPage);
                    // 建立頁面數字連結
                    $("#page" + productCategory).append('<br/');
                    $("#page" + productCategory).append('<h3 id="pre' + productCategory + '"> << </h3>');

                    for (let i = 0; i < totalPage; i++) {
                        // 建立頁面數字
                        $("#page" + productCategory).append('<h3>' + (i + 1) + '</h3>');

                        $("#page" + productCategory + " h3").eq(i + 1).click(() => {
                            $("#content" + productCategory + " tr").hide();
                            for (let item = i * itemPerPage; item < (i + 1) * itemPerPage; item++) {
                                $("#content" + productCategory + " tr").eq(item).show();
                            }
                            nowPage = i + 1;
                            $("#nowPage").text(nowPage);
                        })
                    }
                    $("#page" + productCategory).append('<h3 id="next' + productCategory + '">>></h3>');
                    // 上一頁
                    $("#pre" + productCategory).click(() => {
                            if (nowPage > 1) {
                                nowPage = nowPage - 1;
                                $("#page" + productCategory + " h3").eq(nowPage).click();
                                $("#nowPage").text(nowPage);
                            }
                        })
                        // 下一頁
                    $("#next" + productCategory).click(() => {
                            if (nowPage < totalPage) {
                                nowPage = nowPage + 1;
                                $("#page" + productCategory + " h3").eq(nowPage).click();
                                $("#nowPage").text(nowPage);
                            }
                        })
                        // 初次建立
                    $("#page" + productCategory + " h3").eq(1).click();
                }
                for (cat of productCategories) {
                    uploadDataToTable(cat);
                }

                // 優先顯示有搜尋結果的類別
                showCategoryWithItem();
            }
        })
    }

    // 以下程式修改自：https://www.w3schools.com/howto/howto_js_autocomplete.asp
    function autocomplete(inp, arr) {
        /*the autocomplete function takes two arguments,
        the text field element and an array of possible autocompleted values:*/
        var currentFocus;
        /*execute a function when someone writes in the text field:*/
        inp.addEventListener("input", function(e) {
            var a, b, i, val = this.value;
            /*close any already open lists of autocompleted values*/
            closeAllLists();
            if (!val) { return false; }
            currentFocus = -1;
            /*create a DIV element that will contain the items (values):*/
            a = document.createElement("DIV");
            a.setAttribute("id", this.id + "autocomplete-list");
            a.setAttribute("class", "autocomplete-items");
            /*append the DIV element as a child of the autocomplete container:*/
            this.parentNode.appendChild(a);
            /*for each item in the array...*/
            for (i = 0; i < arr.length; i++) {
                /*check if the item starts with the same letters as the text field value:*/
                if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                    /*create a DIV element for each matching element:*/
                    b = document.createElement("DIV");
                    /*make the matching letters bold:*/
                    b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                    b.innerHTML += arr[i].substr(val.length);
                    /*insert a input field that will hold the current array item's value:*/
                    b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                    /*execute a function when someone clicks on the item value (DIV element):*/
                    b.addEventListener("click", function(e) {
                        /*insert the value for the autocomplete text field:*/
                        inp.value = this.getElementsByTagName("input")[0].value;
                        /*close the list of autocompleted values,
                        (or any other open lists of autocompleted values:*/
                        closeAllLists();
                        $("#searchInput").val(inp.value);
                        searchProduct($("#searchInput").val(), "");
                        $("#sorttingSelect").val("")
                    });
                    a.appendChild(b);
                }
            }
        });
        /*execute a function presses a key on the keyboard:*/
        inp.addEventListener("keydown", function(e) {
            var x = document.getElementById(this.id + "autocomplete-list");
            if (x) x = x.getElementsByTagName("div");
            if (e.keyCode == 40) {
                /*If the arrow DOWN key is pressed,
                increase the currentFocus variable:*/
                currentFocus++;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 38) { //up
                /*If the arrow UP key is pressed,
                decrease the currentFocus variable:*/
                currentFocus--;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 13) {
                /*If the ENTER key is pressed, prevent the form from being submitted,*/
                e.preventDefault();
                if (currentFocus > -1) {
                    /*and simulate a click on the "active" item:*/
                    if (x) x[currentFocus].click();
                }
            }
        });

        function addActive(x) {
            /*a function to classify an item as "active":*/
            if (!x) return false;
            /*start by removing the "active" class on all items:*/
            removeActive(x);
            if (currentFocus >= x.length) currentFocus = 0;
            if (currentFocus < 0) currentFocus = (x.length - 1);
            /*add class "autocomplete-active":*/
            x[currentFocus].classList.add("autocomplete-active");
        }

        function removeActive(x) {
            /*a function to remove the "active" class from all autocomplete items:*/
            for (var i = 0; i < x.length; i++) {
                x[i].classList.remove("autocomplete-active");
            }
        }

        function closeAllLists(elmnt) {
            /*close all autocomplete lists in the document,
            except the one passed as an argument:*/
            var x = document.getElementsByClassName("autocomplete-items");
            for (var i = 0; i < x.length; i++) {
                if (elmnt != x[i] && elmnt != inp) {
                    x[i].parentNode.removeChild(x[i]);
                }
            }
        }
        /*execute a function when someone clicks in the document:*/
        document.addEventListener("click", function(e) {
            closeAllLists(e.target);
        });
    }
    // 以上程式修改自：https://www.w3schools.com/howto/howto_js_autocomplete.asp

    function retrieveAll() {
        var allProducts = []; // 收集全部的商品物件給其他方法使用，收集前先清空。
        var itemPerPage = 3; // 一頁幾個商品
        var nowPage = 1; // 起始頁面
        var totalPage = 0; // 全部頁數
        $.ajax({
            url: "/WeMatch_dev/product/retrieve",
            type: "get",
            dataType: "json",
            success: function(data) {
                Array.prototype.push.apply(allProducts, data); // 收集全部的商品物件給其他方法使用，data直接塞。
                $("#searchNum").empty();
                $("#searchNum").html("Currently we have " + data.length + " products: ");
                // 上傳檔案
                function uploadDataToTable(productCategory) {
                    $("#content" + productCategory).empty();
                    $("#page" + productCategory).empty();
                    var txt = "";
                    var dataLength = 0;
                    for (let i = 0; i < data.length; i++) {
                        if (data[i].category == productCategory) {
                            var base64String = btoa(String.fromCharCode.apply(null, new Uint8Array(data[i].thumbnail)));
                            txt += "<tr><td>" +
                                "<a href='examProduct/" + data[i].productId + "'><img alt='No image' src='data:image/jpg;base64," + base64String + "'hight='250px' width='250px'></a>" +
                                '</td><td class="' + productCategory + '" id="' + data[i].productId + '" style="width:200px;">' + data[i].updateDate + "<br/>" + data[i].productName +
                                '</td><td style="width:100px;"><h6 style="color:black;">$ ' + data[i].price + '</h6></td><td>' +
                                `<p style='text-align: center;'><input type='button' onclick='modifyConfirm("${data[i].productId}")' class='btn btn-primary px-5 py-3 mt-3' value=' Edit '></p>` +
                                `<p style='text-align: center;'><input type='button' onclick='deleteConfirm("${data[i].productId}", "${data[i].productName}")' class='btn btn-primary px-5 py-3 mt-3' value='Delete'></p>` +
                                '</td></tr>';
                            dataLength++;
                        }
                    }
                    $("#content" + productCategory).append(txt);
                    $("#searchNum").append($("td." + productCategory).length + " " + productCategory + " ");
                    // 計算總頁數
                    totalPage = Math.ceil(dataLength / itemPerPage);
                    // 建立頁面數字連結
                    $("#page" + productCategory).append('<br/');
                    $("#page" + productCategory).append('<h3 id="pre' + productCategory + '"> << </h3>');

                    for (let i = 0; i < totalPage; i++) {
                        // 建立頁面數字
                        $("#page" + productCategory).append('<h3>' + (i + 1) + '</h3>');

                        $("#page" + productCategory + " h3").eq(i + 1).click(() => {
                            $("#content" + productCategory + " tr").hide();
                            for (let item = i * itemPerPage; item < (i + 1) * itemPerPage; item++) {
                                $("#content" + productCategory + " tr").eq(item).show();
                            }
                            nowPage = i + 1;
                            $("#nowPage").text(nowPage);
                        })
                    }
                    $("#page" + productCategory).append('<h3 id="next' + productCategory + '">>></h3>');
                    // 上一頁
                    $("#pre" + productCategory).click(() => {
                            if (nowPage > 1) {
                                nowPage = nowPage - 1;
                                $("#page" + productCategory + " h3").eq(nowPage).click();
                                $("#nowPage").text(nowPage);
                            }
                        })
                        // 下一頁
                    $("#next" + productCategory).click(() => {
                            if (nowPage < totalPage) {
                                nowPage = nowPage + 1;
                                $("#page" + productCategory + " h3").eq(nowPage).click();
                                $("#nowPage").text(nowPage);
                            }
                        })
                        // 初次建立
                    $("#page" + productCategory + " h3").eq(1).click();

                }
                for (cat of productCategories) {
                    uploadDataToTable(cat);
                }

                // 網頁載入完把全部的產品撈出來。
                var productNames = [];
                allProducts.forEach(obj => productNames.push(obj.productName));
                autocomplete(document.getElementById("searchInput"), productNames);
            }
        })
    }
    retrieveAll();

    function showCategoryWithItem() {
        // 優先顯示有搜尋結果的類別
        for (cat of productCategories) {
            if ($("td." + cat).length > 0) {
                $("#tab" + cat)[0].click();
                break;
            }
        }
    }

    // 搜尋列輸入完畢時把關鍵字帶到控制器中把相關產品撈出來。
    $("#searchInput").bind("focus keyup", function(event) {
        if (event.keyCode === 13) {
            searchProduct($("#searchInput").val(), "");
            $("#sorttingSelect").val("")
        }
    })

    // 排序有值變化就跑搜尋，空白搜尋就是抓全部商品。
    $("#sorttingSelect").change(() => {
        searchProduct($("#searchInput").val(), $("#sorttingSelect").val());
    })

})