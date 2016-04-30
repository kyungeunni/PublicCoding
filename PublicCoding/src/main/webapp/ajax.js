var httpRequest=null;
// $.ajax({method:post,content:find.jsp;function(){처리}})
function createHttpRequest()
{
	if(window.ActiveXObject)//IE
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
	}
	else if(window.XMLHttpRequest) // 크롬,FF
	{
		return new XMLHttpRequest();
	}
	else
	{
		alert("지원하지 않는 브라우저입니다");
		return null;
	}
}
// ?name=aaa
function sendMessage(method,url,param,callback)
{
	httpRequest=createHttpRequest();
	var httpMethod=method;
	var httpUrl=url;
	var httpParam=param;
	if(method=="GET" || method==null)
	{
	    httpUrl=httpUrl+"?"+httpParam;	
	}
	
	httpRequest.open(method,httpUrl,true);
	httpRequest.onreadystatechange=callback;
	httpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	httpRequest.send(method=="GET"||method==null?null:param);
}



