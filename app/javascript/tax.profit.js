function taxProfit () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup",function(){

    const itemPriceCount = itemPrice.value;

    const tax = itemPriceCount / 10;
    const taxFloor = Math.floor(tax);
    const myProfit = itemPriceCount - taxFloor;

    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    addTaxPrice.innerHTML = taxFloor;
    profit.innerHTML = myProfit;
  });
}

window.addEventListener("load", taxProfit);