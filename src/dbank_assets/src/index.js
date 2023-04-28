import { dbank } from "../../declarations/dbank";



window.addEventListener("load", async function(){
  // console.log("Page loaded");
 update();
});

document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");
  const inputs = document.querySelectorAll("#input-amount, #withdrawal-amount");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);
  button.setAttribute("disabled", true);

if(inputAmount > 0){
  await dbank.topUp(inputAmount);
}

if(outputAmount > 0){
  await dbank.withDraw(outputAmount);
}


 
inputs.forEach(input =>{
  input.value = '';
})
update();
button.removeAttribute("disabled");

await dbank.compound();


  
 

});

async function update(){
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}