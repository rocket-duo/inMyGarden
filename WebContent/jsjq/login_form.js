function chkVal(frm) {
	var uid = frm.uid.value;
	var pwd = frm.pwd.value;
	if (uid == "") {
		alert("아이디를 입력하세요.");
		frm.uid.focus();
		return false;
	} else if (uid.length < 4) {
		alert("아이디를 4글자 이상 입력하세요.");
		frm.uid.select();
		return false;
	}
	if (pwd == "") {
		alert("비밀번호를 입력하세요.");
		frm.pwd.focus();
		return false;
	} else if (pwd.length < 4) {
		alert("비밀번호를 4글자 이상 입력하세요.");
		frm.pwd.select();
		return false;
	}
	return true;
}