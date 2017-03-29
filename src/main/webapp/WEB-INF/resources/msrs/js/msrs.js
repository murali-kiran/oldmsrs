/**
 * 
 */

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
	acc[i].onclick = function() {
		/*
		 * Toggle between adding and removing the "active" class, to highlight
		 * the button that controls the panel
		 */
		this.classList.toggle("active");

		/* Toggle between hiding and showing the active panel */
		var panel = this.nextElementSibling;
		if (panel.style.display === "block") {
			panel.style.display = "none";
		} else {
			panel.style.display = "block";
		}
	}
}

function startTime() {
	var today = new Date();
	var h = today.getHours();
	var m = today.getMinutes();
	var s = today.getSeconds();
	m = checkTime(m);
	s = checkTime(s);
	document.getElementById('txt').innerHTML = h + ":" + m + ":" + s;
	var t = setTimeout(startTime, 500);
}
function checkTime(i) {
	if (i < 10) {
		i = "0" + i
	}
	; // add zero in front of numbers < 10
	return i;
}
function callAjaxPost(data, url) {
	alert("in ajax123");
	var jsondata = "";
	$.ajax({
		type : "POST",
		url : url,
		data : JSON.stringify(data),
		contentType : 'application/json',
		success : function(data) {
			jsondata = data;
			//return json_x;
			alert("Data Saved!");
		},
		error : function(error) {
			alert("Data Not Saved Due To:"+error);
		}
	});
	return jsondata;
}

function callAjaxGet(data, url) {
	$.ajax({
		type : "GET",
		url : url,
		data : data,
		// contentType : 'application/json',
		success : function(data) {
			if (data.status == '1')
				$('#status').html('Form data sent !');
			else
				$('#status').html('Error in sending data !');
		},
		error : function(error) {
			alert(error);
		}
	});
}
function showCreateClaim() {
	$('#incidentdiv').show();
}
function showCreateDependent() {
	$('#dependentdiv').show();
}
$(function() {
	$( ".date-picker" ).datepicker({ dateFormat: 'yy-mm-dd' });
});