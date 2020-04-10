class FollowToggle {
    // var userId = $el.attr("data-user-id");

    constructor(el){
        this.$el = $(el);
        this.userId = this.$el.attr("data-user-id");
        this.followState = this.$el.attr("data-initial-follow-state");
        this.render();
        this.handleClick();
    }
    

    render() {
        if(this.followState === "unfollowed"){
            this.$el.text("Follow!");
        } else {
            this.$el.text("Unfollow!");
        }
    }

    handleClick() {
        
        this.$el.click( function (event) {
            event.preventDefault();
            // debugger
            if(this.followState === "unfollowed"){
                $.ajax({
                    url: `/users/${this.userId}/follow`,
                    type: 'POST',
                    dataType: "JSON",
                    success: () => {
                        this.followState = "followed";
                        this.render();
                    }
                })
            } else {
                $.ajax({
                    url: `/users/${this.userId}/follow`,
                    type: 'DELETE',
                    dataType: "JSON",
                    success: () => {
                        this.followState = "unfollowed";
                        this.render();
                    }
                })
            }
        }.bind(this) );
       
        
        /*
        1. check if we are NOT following the user
        2. if its true, then we create an AJAX request with DELETE
        3. else, if we ARE following the user
        4. we create an AJAX request with POST

        */
        

    }
    

}

module.exports = FollowToggle;


