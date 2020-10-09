import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide", "memo" ]

  //initialize() {
  //  this.displayChange(0)
  //}

  //schedule() {
  //  this.displayChange(0)
  //}

  //memo() {
  //  this.displayChange(1)
  //}  

  //displayChange(index) {
  //  this.index = index
  //  if (this.index == 0) {
  //    this.slideTarget.classList.toggle("scheduled_timeBox")
  //  } else {
  //    this.slideTarget.classList.toggle("scheduled_timeBox")
  //  }
  //}
  connect() {
    if (this.memoTarget.checked) {
      this.slideTarget.setAttribute('style', 'display:none')
    }
  }

  toggleTimebox(event) {
    console.log(event.target)
    if (event.target.value == 'schedule') {
      this.slideTarget.setAttribute('style', 'display:block')
    } else {
      this.slideTarget.setAttribute('style', 'display:none')
    }
  }
}
