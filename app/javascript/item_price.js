if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {      
function item() {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue / 10 );
  
  
  const Profit = document.getElementById("profit");
  Profit.innerHTML = inputValue - addTaxDom.innerHTML
 
})

}
window.addEventListener('load', item);
}