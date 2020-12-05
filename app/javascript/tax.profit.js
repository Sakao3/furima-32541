function taxProfit () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup",function(){

    const itemPriceCount = itemPrice.value;

    const tax = itemPriceCount / 10;
    const myProfit = itemPriceCount - tax;

    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    addTaxPrice.innerHTML = tax;
    profit.innerHTML = myProfit;
  });
}

window.addEventListener("load", taxProfit);

