var cleanValidator = {
	init: function (settings) {
		this.settings = settings;
		this.form = document.getElementById(this.settings["formId"]);
		formInputs = this.form.getElementsByTagName("input");
		
		// change color of inputs on focus
		for(i=0;i<formInputs.length;i++)
		{
			if(formInputs[i].getAttribute("type") != "submit") {
				input = formInputs[i];
				input.style.background = settings["inputColors"][0];
				input.onblur = function () {
					this.style.background = settings["inputColors"][0];
				}
				input.onfocus = function () {
					this.style.background = settings["inputColors"][1];
				}
			}
		};
		this.form.onsubmit = function () {
			error = cleanValidator.validate();
			if(error.length < 1) {
				return true;
			} else {
				cleanValidator.printError(error);
				return false;
			}
		};
	},
	validate: function () {
		error = '';
		validationTypes = new Array("isRequired", "isEmail", "isNumeric");
		for(n=0; n<validationTypes.length; n++) {
			var x = this.settings[validationTypes[n]];
			if(x != null) {
				for(i=0; i<x.length; i++) 
				{
					inputField = document.getElementById(x[i]);
					switch (validationTypes[n]) {
						case "isRequired" :
						valid = !isRequired(inputField.value);
						errorMsg = "is a required field.";
						break;
						case "isEmail" :
						valid = isEmail(inputField.value);
						errorMsg = "is an invalid email address.";
						break;
						case "isNumeric" :
						valid = isNumeric(inputField.value);
						errorMsg = "can only be a number.";
						break;
					}
					if(!valid) {
						error += x[i]+" "+errorMsg+"\n";
						inputField.style.background = this.settings["errorColors"][0];
						inputField.style.border = "1px solid "+this.settings["errorColors"][1];
					} else {
						inputField.style.background = this.settings["inputColors"][0];
						inputField.style.border = '1px solid';
					}
				}
			}
		}
		return error;
	},
	printError: function (error) {
		alert(error);
	}
};

// returns true if the string is not empty
function isRequired(str){
	return (str == null) || (str.length == 0);
}
// returns true if the string is a valid email
function isEmail(str){
	if(isRequired(str)) return false;
	var re = /^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i
	return re.test(str);
}
// returns true if the string only contains characters 0-9 and is not null
function isNumeric(str){
	if(isRequired(str)) return false;
	var re = /[\D]/g
	if (re.test(str)) return false;
	return true;
}