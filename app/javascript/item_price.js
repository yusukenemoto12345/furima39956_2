document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
  if (priceInput) {
    const addTaxPriceOutput = document.getElementById('add-tax-price');
    const profitOutput = document.getElementById('profit');

    priceInput.addEventListener('input', function() {
      const price = parseInt(priceInput.value, 10);
      const commission = Math.floor(price * 0.1); // 10%の販売手数料を計算
      const profit = price - commission; // 販売利益を計算

      addTaxPriceOutput.textContent = commission; // 販売手数料を表示
      profitOutput.textContent = profit; // 販売利益を表示
    });
  }
});
