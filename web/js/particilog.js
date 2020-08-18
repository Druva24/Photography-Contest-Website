/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var $password = $("#passwordid");
//var $confirmPassword = $("#confirm_password");
//var $email = $("#Email");
var $username = $("#userid");

$("form span").hide();

function notEmpty()
{
    return $username.val().length>0;
}
function isPasswordValid() {
  return $password.val().length > 8;
}



function canSubmit() {
  return isPasswordValid() && notEmpty();
}

function passwordEvent(){
    //Find out if password is valid  
    if(isPasswordValid()) {
      //Hide hint if valid
      $password.next().hide();
    } else {
      //else show hint
      $password.next().show();
    }
}



function enableSubmitEvent() {
  $("#submit").prop("disabled", !canSubmit());
}

//When event happens on password input
$password.focus(passwordEvent).keyup(passwordEvent).keyup(enableSubmitEvent);

//When event happens on confirmation input
//$confirmPassword.focus(confirmPasswordEvent).keyup(confirmPasswordEvent).keyup(enableSubmitEvent);

enableSubmitEvent();