function addCart(productId, productName) {
    if (confirm(`Add ${productName} to your shopping cart?`)) {
        location = `shoppingCart/${productId}`;
    }
}