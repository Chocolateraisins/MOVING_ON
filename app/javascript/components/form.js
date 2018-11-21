<<<<<<< HEAD

// class formWizard {
//   constructor() {
//     this.activeStep = 1;
//     this.attachListeners();
//     this.showPrevNextSubmit();
//   }

//   attachListeners() {
//     const btn = document.getElementById("next")
//     if (btn) {
//       document.getElementById("next").addEventListener("click", this.nextTab.bind(this));
//       document.getElementById("previous").addEventListener("click", this.previousTab.bind(this));
//     }
//   }

//   hideAllSteps() {
//     var steps = document.querySelectorAll("div.form-step");
//     steps.forEach((step) => {
//       step.hidden = true;
//     });
//   }

//   nextTab() {
//     this.activeStep += 1;
//     this.hideAllSteps();
//     document.getElementById(`step-${this.activeStep}`).hidden = false;
//     this.showPrevNextSubmit()
//     // increment the active tab with 1
//     // hide all the other form steps hideAllSteps()
//     // show the active one
//   }

//     previousTab() {
//     this.activeStep -= 1;
//     this.hideAllSteps();
//     document.getElementById(`step-${this.activeStep}`).hidden = false;
//     this.showPrevNextSubmit()
//   }

//   showPrevNextSubmit() {
//     console.log("helllllo")
//     if (this.activeStep <= 1) {
//       document.querySelector("#previous").style.display = "none";
//     } else {
//       document.querySelector("#previous").style.display = "inline"
//     }
//     if (this.activeStep >= 3) {
//       document.querySelector("#next").style.display = "none";
//     } else {
//       document.querySelector("#next").style.display = "inline"
//     }
//     if (this.activeStep < 3) {
//       document.querySelector("#submit").style.display = "none";
//     } else {
//       document.querySelector("#submit").style.display = "inline"
//     }
//   }
// }

// new formWizard()
=======
class formWizard {
  constructor() {
    this.activeStep = 2;
    this.attachListeners();
    this.showPrevNextSubmit();
    this.totalLength = this.getServiceTitles().length + 1;
    // this.getServiceTitles();
  }

  getServiceTitles() {
    const servicesTitles = document.querySelectorAll(".serviceTitle");
    return servicesTitles;
  }

  getServicesLength() {
    const servicesDiv = document.getElementById("servicesDiv");
    const serviceLength = servicesDiv.dataset.servicelength;
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
    // document.getElementById(`tile-${this.activeStep}`).classList.remove('active')



    // const serviceTitles = this.getServiceTitles();

    // console.log(serviceTitles[this.activeStep]);
    // serviceTitles[this.activeStep -1].classList.remove("inactive");
    // serviceTitles[this.activeStep -1].classList.add("active");
    this.showPrevNextSubmit();
    // console.log("this.activeStep");
    // console.log(this.activeStep);
    // console.log("serviceTitles");
    // console.log(serviceTitles[0]);
  }

    previousTab() {
    this.activeStep -= 1;
    this.hideAllSteps();
    document.getElementById(`step-${this.activeStep}`).hidden = false;
    document.getElementById(`tile-${this.activeStep}`).classList.add('active')
    // document.getElementById(`step-${this.activeStep}`).hidden = false;
    // console.log(serviceTitles[this.activeStep]);
    // serviceTitles[this.activeStep -1].classList.add("active");
    // serviceTitles[this.activeStep -1].classList.remove("inactive");
    this.showPrevNextSubmit()
  }

  showPrevNextSubmit() {
    // BEGINNING STATE
    if (this.activeStep <= 2) {
      document.querySelector("#previous").style.display = 'none';
    } else {
      document.querySelector("#previous").style.display = 'inline';
    }
    // console.log("this.serviceLength");
    // console.log(this.serviceLength);

      console.log(this.totalLength)
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

new formWizard()
>>>>>>> e3836c719c9bab5577577e0a421c8e20f17a4e4b


