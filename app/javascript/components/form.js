class formWizard {
  constructor() {
    this.activeStep = 1;
    this.attachListeners();
    this.showPrevNextSubmit();
  }

  getServiceTitles() {
    const servicesTitles = document.querySelectorAll(".serviceTitle");
    return servicesTitles;
  }

  getServicesLength() {
    const servicesDiv = document.getElementById("servicesDiv");
    console.log("eee");
    console.log(servicesDiv);
    const serviceLength = servicesDiv.dataset.servicelength;
    console.log("the one");
    console.log(serviceLength);
    return serviceLength;
  }

  attachListeners() {
    const btn = document.getElementById("next")
    if (btn) {
      document.getElementById("next").addEventListener("click", this.nextTab.bind(this));
      document.getElementById("previous").addEventListener("click", this.previousTab.bind(this));
    }
  }

  inactivateAllTiles() {
    document.querySelectorAll('.serviceTitle').forEach(tile => {
      tile.classList.remove('active')
    })
  }

  hideAllSteps() {
    var steps = document.querySelectorAll("div.form-step");
    steps.forEach((step) => {
      step.hidden = true;
    });
    this.inactivateAllTiles()
  }

  nextTab() {
    this.activeStep += 1;
    this.hideAllSteps();
    document.getElementById(`step-${this.activeStep}`).hidden = false;
    document.getElementById(`tile-${this.activeStep}`).classList.add('active')
    this.showPrevNextSubmit();

  }

  previousTab() {
    this.activeStep -= 1;
    this.hideAllSteps();
    document.getElementById(`step-${this.activeStep}`).hidden = false;
    document.getElementById(`tile-${this.activeStep}`).classList.add('active')
    this.showPrevNextSubmit()
  }

  get totalLength() {
    return this.getServiceTitles().length;
  }

  showPrevNextSubmit() {
    // BEGINNING STATE
    if (this.activeStep <= 1) {
      document.querySelector("#previous").style.display = 'none';
    } else {
      document.querySelector("#previous").style.display = 'inline';
    }

    if (this.activeStep >= this.totalLength) {
      document.querySelector("#next").style.display = 'none';
    } else {
      document.querySelector("#next").style.display = 'inline';
    }
    if (this.activeStep >= this.totalLength) {
      document.querySelector("#submit").style.display = 'inline';
    } else {
      document.querySelector("#submit").style.display = 'none';
    }
  }
}

const editOrder = document.querySelector(".edit_order");

if (editOrder) {
  new formWizard();
}





