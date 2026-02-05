    // ==========================
// TOAST NOTIFICATION (UI)
// ==========================
function showToast(message, type = 'success') {
    const toast = document.getElementById('toast');
    if (!toast) return;

    toast.textContent = message;
    toast.className = `toast show ${type}`;

    setTimeout(() => {
        toast.className = 'toast';
    }, 3000);
}

// ==========================
// BUTTON RIPPLE EFFECT
// ==========================
document.addEventListener('click', function (e) {
    const btn = e.target.closest('.btn');
    if (!btn) return;

    const ripple = document.createElement('span');
    ripple.className = 'ripple';

    const rect = btn.getBoundingClientRect();
    ripple.style.left = (e.clientX - rect.left) + 'px';
    ripple.style.top = (e.clientY - rect.top) + 'px';

    btn.appendChild(ripple);

    setTimeout(() => {
        ripple.remove();
    }, 600);
});

// ==========================
// NAVBAR SCROLL SHADOW
// ==========================
window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar');
    if (!navbar) return;

    if (window.scrollY > 10) {
        navbar.classList.add('navbar-scrolled');
    } else {
        navbar.classList.remove('navbar-scrolled');
    }
});

// ==========================
// FEATURE CARD HOVER ANIMATION
// ==========================
document.querySelectorAll('.feature-card').forEach(card => {
    card.addEventListener('mouseenter', () => {
        card.classList.add('hovered');
    });

    card.addEventListener('mouseleave', () => {
        card.classList.remove('hovered');
    });
});

// ==========================
// SIMPLE CLIENT-SIDE FORM VALIDATION (UI ONLY)
// ==========================
// Chỉ check rỗng / format — KHÔNG login
document.querySelectorAll('form').forEach(form => {
    form.addEventListener('submit', function (e) {
        const inputs = form.querySelectorAll('input[required]');
        let valid = true;

        inputs.forEach(input => {
            if (!input.value.trim()) {
                input.classList.add('input-error');
                valid = false;
            } else {
                input.classList.remove('input-error');
            }
        });

        if (!valid) {
            e.preventDefault();
            showToast('Vui lòng nhập đầy đủ thông tin!', 'error');
        }
    });
});

// ==========================
// PAGE LOAD ANIMATION
// ==========================
document.addEventListener('DOMContentLoaded', () => {
    document.body.classList.add('page-loaded');

    // Demo welcome toast (có thể xóa nếu không thích)
    // showToast('Chào mừng bạn đến với hệ thống!');
});