// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"
import "jquery"

$(document).ready(function () {
  $('form').on('submit', function (e) {
    const competitorsValue = $('#competitors').val();
    const competitorsArray = competitorsValue.split(';').map(s => s.trim()); // Split and trim whitespace
    const competitorsCount = competitorsArray.filter(Boolean).length;
    
    console.log(competitorsCount)
    if (($('#competitionName').val().trim() === '') || ($('#competitionWin').val().trim() === '') ||
            ($('#competitionDraw').val().trim() === '') || ($('#competitionLoss').val().trim() === '')) {
      e.preventDefault();
      alert('Competition name and type of scoring cannot be empty!')
    } else if (competitorsCount < 4 || competitorsCount > 8) {
      e.preventDefault();
      alert('Number of competitors must be between 4 and 8.');
    }
  });
});
