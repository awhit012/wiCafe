$(document).ready(function() {
  filepicker.setKey("ATjIYQEFTgi03Sq7zNllVz");
  filepicker.pickAndStore({mimetype:"image/*"},{},
    function(InkBlobs){
      console.log(JSON.stringify(InkBlobs));
});

