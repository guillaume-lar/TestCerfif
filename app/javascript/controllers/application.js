import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


document.addEventListener('turbo:load', function () {
    $('[data-behavior="datepicker"]').datepicker({
        format: 'yyyy-mm-dd',
        todayHighlight: true,
        autoclose: true,
    });
});
