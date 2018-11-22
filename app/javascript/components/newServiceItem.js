const doSomething = (e) => {
  console.log("clickinggggg");
  const el = e.currentTarget;
  // el.classList.add("hidden");
  console.log(el);
  let form = el.nextElementSibling;
  console.log(form);
  form.classList.remove("hidden");

}

const newServiceItem = () => {
  // const newServiceItemFormBtn = document.getElementById("new-service-item-form-btn");
  const jsNewServiceItemFormBtns = document.querySelectorAll(".js-new-service-item-form-btn");

  jsNewServiceItemFormBtns.forEach((serviceBtn) => {
    serviceBtn.addEventListener("click", doSomething);
  });



}

newServiceItem();

export { newServiceItem }
