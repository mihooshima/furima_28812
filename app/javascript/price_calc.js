window.addEventListener("load", calc);

function calc(){
  // 必要な要素を取得
  const price = document.getElementById('item-price');
  const gettax = document.getElementById("add-tax-price");
  const getprofit = document.getElementById("profit");

  // 価格が入力されたイベントで処理を発火する
  price.addEventListener('input', ()=>{
    const getvalue = document.getElementById("item-price").value;
    const tax = getvalue * 0.1;
    const profit = getvalue - tax;
    gettax.textContent = tax
    getprofit.textContent = profit
  });
}