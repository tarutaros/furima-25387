function calc (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', function(){
    const itemPriceValue = itemPrice.value
    const Tax = 0.1;
    const tax_fee = itemPriceValue * Tax;
    const profit = itemPriceValue - tax_fee;
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = tax_fee;
    profitArea.innerHTML = profit;
  }) 
}

window.addEventListener('load', calc)