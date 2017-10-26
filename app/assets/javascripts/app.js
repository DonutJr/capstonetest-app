/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var vm = new Vue({
    el: '#app',
    data: {
      message: "hey Vue"
    },

    mounted: function() {

    },

    created: function() {
      console.log('a is: ' + this.reviews)
    },

    methods: {
      changeTitle: function() {
        this.message = data;
      },
      addReview: function() {
        var newReview = {
                          text: this.newReviewText,
                          name: this.newReviewName,
                          rating: this.newReviewRating
                        };
        this.reviews.push(newReview);
        this.newReviewText = "";
        this.newReviewName = "";
        this.newReviewRating = "";
      }

    },
    
    computed: {

    }
  });

});