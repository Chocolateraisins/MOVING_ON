
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


