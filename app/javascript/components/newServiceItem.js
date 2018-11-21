const doSomething = (e) => {
  console.log("clickinggggg");
  const el = e.currentTarget;
  // el.classList.add("hidden");
  console.log(el);
  const newServiceItemForm = document.getElementById("new-service-item-form");
  newServiceItemForm.classList.remove("hidden");

}

const newServiceItem = () => {
  console.log("hola aaaa");
  const newServiceItemFormBtn = document.getElementById("new-service-item-form-btn");
  if (newServiceItemFormBtn) {
    newServiceItemFormBtn.addEventListener("click", doSomething);
  }
}

newServiceItem();

export { newServiceItem }
