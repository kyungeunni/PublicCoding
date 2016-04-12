//회원가입
function popup_signup()
{
	var url ="signup.jsp"
	var name="popup";
	window.open("member/signup.jsp","popup",
	"width=450,height=450,menubar=no,toolbar=no,scrollbars=no,location=no,resizable=yes,left=400,top=90");
}

//로그인
function popup_signin()
{
	var url ="signin.jsp"
	var name="popup3";
	window.open("member/signin.jsp","popup3",
	"width=450,height=450,menubar=no,toolbar=no,scrollbars=no,location=no,resizable=yes,left=400,top=90");
}