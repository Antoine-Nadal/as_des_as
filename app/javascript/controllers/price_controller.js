import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ['unitPrice', 'price', 'startDate', 'endDate']

  connect () {

  }

  displayPrice () {
    let end = this.endDateTarget.value
    let start = this.startDateTarget.value

    let splittedEnd = end.split("-")
    let splittedStart = start.split("-")

    let endDay = splittedEnd[2]
    let endMonth = splittedEnd[1]
    let endYear = splittedEnd[0]

    let startDay = splittedStart[2]
    let startMonth = splittedStart[1]
    let startYear = splittedStart[0]


    let endDate = new Date(endYear, endMonth, endDay)
    let startDate = new Date(startYear, startMonth, startDay)

    let totalDaysInMilliseconds = endDate - startDate
    let totalDays = (totalDaysInMilliseconds / 86400000) + 1
    if (isNaN(totalDays) === false) {
      this.priceTarget.innerHTML = totalDays * this.unitPriceTarget.innerHTML
    }
  }
}
