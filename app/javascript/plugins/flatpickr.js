import flatpickr from "flatpickr"
import "flatpickr/dist/themes/light.css" // Note this is important!

flatpickr(".datepicker", {
  altInput: true,
})

flatpickr(".datepicker-time", {
  altInput: true,
  enableTime: true,
})
