//div动态显示
function showDiv(pid, id) {
	var alertDiv = document.getElementById(id);
	alertDiv.setAttribute("style", "display");

	var groupDiv = document.getElementById(pid);
	groupDiv.setAttribute("class", "form-group has-error");
}

// div动态隐藏
function hideDiv(pid, id) {
	var alertDiv = document.getElementById(id);
	alertDiv.setAttribute("style", "display:none");

	var groupDiv = document.getElementById(pid);
	groupDiv.setAttribute("class", "form-group has-success");
}

// 校验用户名
function validateUsername(id, divId, infoId) {
	var username = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,14}$/;
	if (!reg.test(username)) {
		// 输出提示信息
		showDiv(divId, infoId);
		return false;
	} else {
		// 去掉提示信息
		hideDiv(divId, infoId);

		// 校验用户名唯一性
		validateUserUniqueness();

		return true;
	}
}

// 定义XMLHttpRequest对象
var xmlhttp;

// 用户名唯一性校验
function validateUserUniqueness() {
	var username = document.getElementById("inputUsername").value.trim();

	// 创建XMLHttpRequest对象
	if (window.XMLHttpRequest) {
		// 针对FireFox,Mozillar,Opera,Safari,IE7,IE8
		xmlhttp = new XMLHttpRequest();
		// 对某些特定版本的mozillar浏览器的bug进行修正
		if (xmlhttp.overrideMineType) {
			xmlhttp.overrideMineType("text/xml");
		}
	} else if (window.ActiveXObject) {
		// 针对IE5，IE5.5，IE6
		// 两个可以用于创建XMLHTTPRequest对象的控件名称。保存在一个JS数组中。
		var activexName = [ "MSXML2.XMLHTTP", "Microsoft.XMLHTTP" ];
		for (var i = 0; i < activeName.length; i++) {
			// 取出一个控件名进行创建，如果成功就终止循环
			try {
				xmlhttp = new ActiveXObject(activexName[i]);
				break;
			} catch (e) {
				alert("An exception occured in the script.Error name: "
						+ e.name + ".Error message: " + e.message);
			}
		}

	}

	// 注册回调函数,只写函数名，不能写括号，写括号表示调用函数。
	xmlhttp.onreadystatechange = userUniqueCallback;
	// 设置连接信息(请求方式，请求的url,true表示异步方式交互)
	xmlhttp.open("GET", "ValidateUserServlet?username=" + username, true);
	// 发送数据，开始和服务器进行交互。
	xmlhttp.send(null);

	// 使用POST方式请求，需要手动设置http的请求头
	// xmlhttp.setRequestHeader("Content-Type","aplication/x-www-form-urlencoded");
	// xmlhttp.send("name=" + username);
}

// 用户名唯一性校验回调函数
function userUniqueCallback() {
	// 判断对象的状态是否交互完成
	if (xmlhttp.readyState == 4) {
		// 判断http的交互是否成功
		if (xmlhttp.status == 200) {
			// 获取服务器端返回的数据（文本）
			var responseText = xmlhttp.responseText;

			// 用户名不唯一
			if (responseText == "0") {
				// 输出提示信息
				showDiv("usernameGroup", "userUniqueDiv");
				return false;
			} else if (responseText == "1") {
				// 去掉提示信息
				hideDiv("usernameGroup", "userUniqueDiv");
				return true;
			} else {
				alert("哎呀，出错啦～");
			}
		}
	}
}

// 校验密码
function validatePassword(id, divId, infoId) {
	var password = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,19}$/;
	if (!reg.test(password)) {
		showDiv(divId, infoId);
		return false;
	} else {
		// 去掉提示信息
		hideDiv(divId, infoId)
		return true;
	}
}

// 校验密码一致性
function validateConfirmPass(pid, cpid, divId, infoId) {
	var password = document.getElementById(pid).value.trim();
	var confirmPassword = document.getElementById(cpid).value.trim();
	if ((password == "") | (confirmPassword == "") 
			|(password != confirmPassword)) {
		showDiv(divId, infoId);
		return false;
	} else {
		// 去掉提示信息
		hideDiv(divId, infoId)
		return true;
	}
}

// 校验邮箱格式
function validateEmail(id, divId, infoId) {
	var email = document.getElementById(id).value.trim();
	var reg = /^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
	if (!reg.test(email)) {
		showDiv(divId, infoId);
		return false;
	} else {
		hideDiv(divId, infoId);
		return true;
	}
}

// 提交检验
function validateSubmit() {
	var isUserChecked = validateUsername('inputUsername', 'usernameGroup',
			'usernameDiv');
	var isPassChecked = validatePassword('inputPassword', 'passGroup',
			'passwordDiv');
	var isConfirmPswChecked = validateConfirmPass('inputPassword',
			'inputConfirmPass', 'confirmPassGroup', 'confirmPassDiv');
	var isEmailChecked = validateEmail('inputEmail', 'emailGroup', 'emailDiv');
	if (isUserChecked && isPassChecked && isConfirmPswChecked && isEmailChecked) {
		return true;
	} else {
		return false;
	}
}







