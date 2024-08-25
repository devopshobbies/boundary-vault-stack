document.addEventListener('scroll', function () {
    const headers = document.querySelectorAll('.section-header');
    const pageOffset = window.scrollY;

    headers.forEach(header => {
        const headerOffset = header.offsetTop;
        const headerHeight = header.offsetHeight;

        if (pageOffset >= headerOffset - headerHeight && pageOffset < headerOffset + headerHeight) {
            header.classList.add('active');
        } else {
            header.classList.remove('active');
        }
    });
});

function copyToClipboard() {
    const codeElement = document.querySelector('.code');
    const range = document.createRange();
    range.selectNode(codeElement);
    window.getSelection().removeAllRanges();
    window.getSelection().addRange(range);
    document.execCommand('copy');
    window.getSelection().removeAllRanges();


    const notification = document.getElementById('copy-notification');
    notification.classList.add('show');

    setTimeout(() => {
        notification.classList.remove('show');
    }, 3000);
}