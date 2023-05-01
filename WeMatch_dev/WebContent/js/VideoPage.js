$(document).ready(() => {

    var itemPerPage = 5; // 一頁幾個商品
    var nowPage = 1;
    var totalPage = 0; // 全部頁數

    $.ajax({
        url: "RetrieveVideoServlet.do",
        data: {
            action: "RetrieveVideo"
        },
        type: "get",
        dataType: "json",
        success: function (data) {
            // 上傳檔案
            function uploadDataToTable(vCategory) {

                var txt = ' ';
                var dataLength = 0;
                for (let i = 0; i < data.length; i++) {
                    if (data[i].videoCategory == vCategory) {

                        txt += "<tr><td><span class=filmtopic>" + data[i].videoName + "</span></td></tr><br></br><tr><td>"
                            + '<iframe width="300" height="169" src="https://www.youtube.com/embed/' + data[i].videoLink.substr(32) + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; allow-same-origin; picture-in-picture" allowfullscreen></iframe></td><td style="vertical-align:text-top;">'
                            + data[i].videoDesc + "</td></tr><p></p>";
                        dataLength++;
                    }
                }
                // txt += ' ';
                $("#content" + vCategory).append(txt);

                // 計算總頁數
                totalPage = Math.ceil(dataLength / itemPerPage);

                // 建立頁面數字連結
                $("#page" + vCategory).append('<br/');
                $("#page" + vCategory).append('<h3 id="pre' + vCategory + '"> << </h3>');

                for (let i = 0; i < totalPage; i++) {
                    // 建立頁面數字
                    $("#page" + vCategory).append('<h3>' + (i + 1) + '</h3>');

                    $("#page" + vCategory + " h3").eq(i + 1).click(() => {
                        $("#content" + vCategory + " tr").hide();
                        for (let item = i * itemPerPage; item < (i + 1) * itemPerPage; item++) {
                            $("#content" + vCategory + " tr").eq(item).show();
                        }
                        nowPage = i + 1;
                        $("#nowPage").text(nowPage);
                    })
                }
                $("#page" + vCategory).append('<h3 id="next' + vCategory + '">>></h3>');

                // 上一頁
                $("#pre" + vCategory).click(() => {
                    if (nowPage > 1) {
                        nowPage = nowPage - 1;
                        $("#page" + vCategory + " h3").eq(nowPage).click();
                        $("#nowPage").text(nowPage);
                    }
                })
                // 下一頁
                $("#next" + vCategory).click(() => {
                    if (nowPage < totalPage) {
                        nowPage = nowPage + 1;
                        $("#page" + vCategory + " h3").eq(nowPage).click();
                        $("#nowPage").text(nowPage);
                    }
                })
                // 初次建立
                $("#page" + vCategory + " h3").eq(1).click();

            }

            uploadDataToTable("bodyback");
            uploadDataToTable("bodychest");
            uploadDataToTable("bodyleg");

            //console.log(data[0].videoName);
            //console.log(data[0].videoId);
            //console.log(data[0].videoCategory);
            //console.log(data[0].videoLink);
            //console.log(data[0].videoLink.substr(32));

        }
    })
})