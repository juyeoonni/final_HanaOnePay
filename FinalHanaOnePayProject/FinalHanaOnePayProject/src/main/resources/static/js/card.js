
function loadCardData() {
    const query = new URLSearchParams({
        banks: selectedCards.join(',')

    }).toString();
    fetch('/api/')
}