function email_change(){
	if(document.fndId.email.options[document.fndId.email.selectedIndex].value == ''){
		 document.fndId.e2.disabled = true;
		 document.fndId.e2.value = "";
		}
		if(document.fndId.email.options[document.fndId.email.selectedIndex].value == 'direct'){
		 document.fndId.e2.disabled = false;
		 document.fndId.e2.value = "";
		 document.fndId.e2.focus();
		} else{
		 document.fndId.e2.disabled = true;
		 document.fndId.e2.value = document.fndId.email.options[document.fndId.email.selectedIndex].value;
		}
}
function findId(fnd_id){
	var name = fndId.name.value;
	var e1 = fndId.e1.value;
	var e2 = fndId.e2.value;
	var fnd1 = document.getElementById("fnd_id1");
	var fnd2 = document.getElementById("fnd_id2");
	var fnd3 = document.getElementById("fnd_id3");
	if (name == "") {alert("이름을 입력 해주세요."); fndId.name.focus(); return false; }
	else if (e1 == "") {alert("이메일 아이디를 입력 해주세요."); fndId.e1.focus(); return false; }
	else if (e2 == "") {alert("도메인을 입력 해주세요."); fndId.e2.focus(); return false; }
}