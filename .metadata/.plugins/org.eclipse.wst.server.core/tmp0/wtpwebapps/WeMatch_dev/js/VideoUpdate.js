$(document).ready(() => {

    $.ajax({
        url: "RetrieveVideoServlet.do",
        data: {
            action: "RetrieveVideo"
        },
        type: "get",
        dataType: "json",
        success: function (data) {

		console.log(data);
		var newData = data.sort((a,b)=>b.videoId - a.videoId);
		console.log(newData);

            function updateToTable(vUpadte) {

                txt = "<tr><td><span class=uptopic>Last Update</span></td></tr><br>"
					  + '<td><iframe width="300" height="169" src="https://www.youtube.com/embed/' + newData[0].videoLink.substr(32) + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; allow-same-origin; picture-in-picture" allowfullscreen></iframe></td><td>&nbsp&nbsp&nbsp&nbsp</td>'
                      + '<td><iframe width="300" height="169" src="https://www.youtube.com/embed/' + newData[1].videoLink.substr(32) + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; allow-same-origin; picture-in-picture" allowfullscreen></iframe></td><td>&nbsp&nbsp&nbsp&nbsp</td>'
                      + '<td><iframe width="300" height="169" src="https://www.youtube.com/embed/' + newData[2].videoLink.substr(32) + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; allow-same-origin; picture-in-picture" allowfullscreen></iframe></td></tr>'
					  + "<tr><td><span class=filmtopic>" + newData[0].videoName + "</span></td> + <td>&nbsp&nbsp&nbsp&nbsp</td><td><span class=filmtopic>" 
					  + newData[1].videoName + "</span></td> + <td>&nbsp&nbsp&nbsp&nbsp</td><td><span class=filmtopic>"
					  + newData[2].videoName + "</span></td></tr>";

                $("#content" + vUpadte).append(txt);             

            }

            updateToTable("update");

			//console.log(newData);
			//console.log('data',data);
			
            //console.log(data[2].videoName);
            //console.log(data[2].videoId);
            //console.log(data[2].videoCategory);
            //console.log(data[2].videoLink);
            //console.log(data[2].videoLink.substr(32));

        }
    })
})