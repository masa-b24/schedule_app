import { Controller } from "stimulus"
export default class extends Controller {
  static targets = [ "slide", "memo" ]

  connect() {
    if (this.memoTarget.checked) {
      this.slideTarget.setAttribute('style', 'display:none')
    }
  }

  toggleTimebox(event) {
    if (event.target.value == 'schedule') {
      this.slideTarget.setAttribute('style', 'display:block')
    } else {
      this.slideTarget.setAttribute('style', 'display:none')
    }
  }
}
