import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide" ]

  initialize() {
    this.displayChange(0)
  }

  schedule() {
    this.displayChange(0)
  }

  memo() {
    this.displayChange(1)
  }  

  displayChange(index) {
    this.index = index
    if (this.index == 0) {
      this.slideTarget.classList.toggle("scheduled_timeBox")
    } else {
      this.slideTarget.classList.toggle("scheduled_timeBox")
    }
  }
}