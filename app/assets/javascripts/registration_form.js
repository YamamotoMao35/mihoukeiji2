$(function(){
  $("#submit-form").click(function(){
    if( validatrix( $("#contact-form") ) ){ //Send the object to the function for validate individually
      openListPage();
      }else{
      console.log("Some fields are required");
    }
  return false; //Prevent form submition
  });
});