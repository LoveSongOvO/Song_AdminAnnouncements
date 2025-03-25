window.addEventListener('message', function(event) {
    if (event.data.type === 'showAnnouncement') {
        const announcement = document.getElementById('announcement');
        const message = document.getElementById('message');
        const notificationSound = document.getElementById('notification-sound');

        message.innerText = event.data.message;

        announcement.style.display = 'flex';
        announcement.style.animation = 'none';
        void announcement.offsetWidth;
        announcement.style.animation = `slideIn 0.5s forwards, slideOut 0.5s forwards ${event.data.duration / 1000 - 0.5}s`;

        notificationSound.play();

        setTimeout(() => {
            announcement.style.display = 'none';
        }, event.data.duration);
    }
});