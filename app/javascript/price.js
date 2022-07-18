window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxValue = document.getElementById("add-tax-price");
    const tax = Math.round(inputValue * 0.1)
    taxValue.innerHTML = tax;
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.round(inputValue - tax);
   })
});
