let httpRequest = null
function getXMLRequest() {
	if(window.XMLHttpRequest){
		return new XMLHttpRequest()
	}
	else{
		return null
	}
}

function sendRequest(url, params, callback, method) {
	httpRequest=getXMLRequest()
	let httpMethod=method?method:'GET'
	if(httpMethod!='GET'&&httpMethod!='POST'){
		httpMethod='GET'
	}
	let httpParams=(params==null||params=='')?null:params
	let httpUrl=url
	if(httpMethod=='GET'&&httpParams!=null){
		httpUrl=httpUrl+'?'+httpParams
	}
	httpRequest.open(httpMethod, httpUrl, true)
	httpRequest.setRequestHeader('conten-Type', 'applicaion/x-www-form-urlencoded')
	httpRequest.onreadystatechange=callback
	httpRequest.send(httpMethod=='POST'?httpParams:null)
	/*
	$.ajax({
		type:GET,
		url:
		data:
		success:function(){
			
		}
	})
	axuis.get('', {
		
	}).then(function(){
		
	})
	*/
}