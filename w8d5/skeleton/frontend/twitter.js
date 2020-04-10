const FollowToggle = require("./follow_toggle.js");


    $(document).ready(function () {
        // your code here
        $(".follow-toggle").each(function (index, button){
            new FollowToggle(button);
        } )
    });




