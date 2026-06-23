// State Management
    const state = {
    lang: 'ar',
    avatar: '../imges/user.jpg',
    userName: 'Hany Amir',
    userEmail: 'hany@gmail.com',
    currentView: 'settings-account'
    };
// Translations
const translations = {
    ar: {
        common: {
            edit: 'تعديل',
            save: 'حفظ التغيرات',
            cancel: 'إلغاء',
            login: 'تسجيل دخول',
            logout: 'تسجيل خروج',
            back: 'رجوع'
        },
        nav: {
            home: 'الصفحة الرئيسية',
            search: 'العثور عن مستشفى',
            medicine: 'خدمات الدواء',
            firstAid: 'الإسعافات الأولية',
            profile: 'الملف الشخصي',
            myRequests: 'طلباتي',
            myDonations: 'تبرعاتي',
            notifications: 'الإشعارات',
            settings: 'الإعدادات'
        },
        settings: {
            account: 'الحساب',
            general: 'عام',
            changePhoto: 'تغيير الصورة',
            name: 'الأسم:',
            password: 'كلمة المرور:',
            email: 'البريد الإلكتروني:',
            resetPassword: 'إعادة تعيين كلمة المرور',
            darkMode: 'الوضع الليلي متاح قريباً',
            mode: 'الوضع:',
            language: 'اللغة:',
            editData: 'تعديل البيانات',
            role: 'مستخدم مسجل'
        },
        notifications: {
            title: 'الإشعارات',
            heartMeds: 'أدوية القلب والضغط',
            heartMedsDesc: 'تم استلام التبرع الخاص بك لأدوية القلب والضغط بنجاح من مستشفى الجامعة بالمنصورة',
            diabetesMeds: 'أدوية السكر',
            diabetesMedsDesc: 'طلبك لأدوية السكر من مستشفى الدولي التخصصي لا يزال قيد المراجعة',
            donated: 'تم التبرع',
            donatedDesc: 'تم توجيه تبرعاتك لأدوية الضغط لمستشفى السلاب',
            newAppointment: 'موعد جديد',
            newAppointmentDesc: 'تم تحديد موعد لاستلام تبرعك لأدوية الأعصاب يوم 10 أبريل 2026',
            time3h: 'منذ 3 ساعات',
            time1d: 'منذ يوم',
            time3d: 'منذ 3 أيام',
            time1w: 'منذ أسبوع',
            clicked: 'تم النقر على الإشعار:'
        },
        requests: {
            title: 'تفاصيل الطلب',
            reqNum: ':رقم الطلب',
            underReview: 'قيد المراجعة',
            desc1: 'مسكن وخافض للحرارة',
            desc2: 'باراستامول',
            desc3: 'ألم شديد',
            prescImage: 'عرض صورة الروشته',
            idImage: 'عرض صورة البطاقة',
            cancelReq: 'إلغاء الطلب',
            editReq: 'تعديل الطلب',
            changeImage: 'اضغط لتغيير الصورة'
        },
        donations: {
            title: 'لا يوجد تبرعات حالياً',
            active: 'ابدأ بالتبرع الآن لمساعدة الآخرين.'
        }
    },
    en: {
        common: {
            edit: 'Edit',
            save: 'Save Changes',
            cancel: 'Cancel',
            login: 'Login',
            logout: 'Logout',
            back: 'Back'
        },
        nav: {
            home: 'Home',
            search: 'Search Hospital',
            medicine: 'Medicine Services',
            firstAid: 'First Aid',
            profile: 'Profile',
            myRequests: 'My Requests',
            myDonations: 'My Donations',
            notifications: 'Notifications',
            settings: 'Settings'
        },
        settings: {
            account: 'Account',
            general: 'General',
            changePhoto: 'Change Photo',
            name: 'Name:',
            password: 'Password:',
            email: 'Email:',
            resetPassword: 'Reset Password',
            darkMode: 'Dark mode coming soon',
            mode: 'Mode:',
            language: 'Language:',
            editData: 'Edit Profile',
            role: 'Registered User'
        },
        notifications: {
            title: 'Notifications',
            heartMeds: 'Heart Medications',
            heartMedsDesc: 'Your donation for heart medications was successfully received by Mansoura University Hospital',
            diabetesMeds: 'Diabetes Medications',
            diabetesMedsDesc: 'Your request for diabetes medications from International Specialist Hosp. is still under review',
            donated: 'Donated',
            donatedDesc: 'Your donations for blood pressure meds have been directed to Al-Sallab Hospital',
            newAppointment: 'New Appointment',
            newAppointmentDesc: 'An appointment has been scheduled to receive your nerve meds donation on April 10, 2026',
            time3h: '3 hours ago',
            time1d: '1 day ago',
            time3d: '3 days ago',
            time1w: '1 week ago',
            clicked: 'Notification clicked:'
        },
        requests: {
            title: 'Request Details',
            reqNum: 'Request Number:',
            underReview: 'Under Review',
            desc1: 'Painkiller and Antipyretic',
            desc2: 'Paracetamol',
            desc3: 'Severe Pain',
            prescImage: 'View Prescription',
            idImage: 'View ID Card',
            cancelReq: 'Cancel Request',
            editReq: 'Edit Request',
            changeImage: 'Click to change image'
        }
    }
};
// Translation Helper
function t(path) {
    const keys = path.split('.');
    let result = translations[state.lang];
    for (const key of keys) {
        if (result && result[key]) {
            result = result[key];
        } else {
            return path;
        }
    }
    return result;
}
// Update UI Translations
function updateI18n() {
    document.querySelectorAll('[data-i18n]').forEach(el => {
        const path = el.getAttribute('data-i18n');
        el.textContent = t(path);
    });
    
    // Update direction and lang on root
    document.documentElement.dir = state.lang === 'ar' ? 'rtl' : 'ltr';
    document.documentElement.lang = state.lang;
    
    // Refresh icons because they might need to flip
    if (window.lucide) lucide.createIcons();
}
// Routing logic
function navigateTo(viewId) {
    state.currentView = viewId;
    const mainContent = document.getElementById('main-content');
    let templateId = '';
    if (viewId.startsWith('settings')) {
        templateId = 'view-' + viewId;
    } else {
        templateId = 'view-' + viewId;
    }
    const template = document.getElementById(templateId);
    if (template) {
        mainContent.innerHTML = '';
        mainContent.appendChild(template.content.cloneNode(true));
        
        // Custom logic for specific views
        if (viewId === 'notifications') renderNotifications();
        if (viewId === 'profile') renderProfile();
        if (viewId === 'settings-account') renderAccount();
        if (viewId === 'settings-general') {
            document.getElementById('lang-select').value = state.lang;
        }
        // Highlight active sidebar item
        document.querySelectorAll('.sidebar-item').forEach(el => {
            const elView = el.getAttribute('data-view');
            if (viewId.startsWith(elView) || (elView === 'settings' && viewId.startsWith('settings'))) {
                el.classList.add('active');
            } else {
                el.classList.remove('active');
            }
        });
        // Initialize Lucide icons for injected content
        lucide.createIcons();
        updateI18n();
    }
}
// Render Logic for Views
function renderNotifications() {
    const list = document.getElementById('notifications-list');
    const data = [
        { title: t('notifications.heartMeds'), desc: t('notifications.heartMedsDesc'), time: t('notifications.time3h'), color: '#28a745', icon: 'heart-pulse', subIcon: 'check-circle-2' },
        { title: t('notifications.diabetesMeds'), desc: t('notifications.diabetesMedsDesc'), time: t('notifications.time1d'), color: '#e0a800', icon: 'pill', subIcon: 'hourglass' },
        { title: t('notifications.donated'), desc: t('notifications.donatedDesc'), time: t('notifications.time3d'), color: '#387fa7', icon: 'heart-handshake' },
        { title: t('notifications.newAppointment'), desc: t('notifications.newAppointmentDesc'), time: t('notifications.time1w'), color: '#5ba4c2', icon: 'calendar-clock' }
    ];
    list.innerHTML = data.map(n => `
        <div class="list-item" onclick="alert('${t('notifications.clicked')} ${n.title}')" style="cursor: pointer; border-inline-start: 6px solid ${n.color}; padding: 15px 20px; display: flex; gap: 15px; align-items: flex-start;">
            <div style="display: flex; flex-direction: column; alignItems: center; gap: 5px;">
                <i data-lucide="${n.icon}" style="width: 30px; height: 30px;"></i>
                ${n.subIcon ? `<i data-lucide="${n.subIcon}" style="width: 20px; height: 20px; color: ${n.color}"></i>` : ''}
            </div>
            <div style="text-align: start; flex: 1;">
                <h3 style="font-size: 1.2rem; margin-bottom: 5px; color: var(--text-main);">${n.title}</h3>
                <p style="color: var(--text-muted); font-size: 1rem; margin-bottom: 8px;">${n.desc}</p>
                <span style="color: #888; font-size: 0.9rem;">${n.time}</span>
            </div>
        </div>
    `).join('');
    lucide.createIcons();
}
function renderProfile() {
    document.getElementById('profile-page-avatar').src = state.avatar;
    document.getElementById('profile-name').textContent = state.userName;
    document.getElementById('profile-name-2').textContent = state.userName;
    document.getElementById('profile-email').textContent = state.userEmail;
}
function renderAccount() {
    document.querySelectorAll('.profile-avatar-large').forEach(img => img.src = state.avatar);
}
// Action Handlers
function changeLanguage(lang) {
    state.lang = lang;
    updateI18n();
    // Re-render current view to update icons and static text
    navigateTo(state.currentView);
}
function handleFileChange(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onloadend = () => {
            state.avatar = reader.result;
            document.getElementById('sidebar-avatar').src = state.avatar;
            renderAccount();
        };
        reader.readAsDataURL(file);
    }
}
function handleImageUpdate(input, imgId) {
    const file = input.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onloadend = () => {
            document.getElementById(imgId).src = reader.result;
        };
        reader.readAsDataURL(file);
    }
}
// Initial Load
window.onload = () => {
    navigateTo('settings-account');
    document.getElementById('sidebar-avatar').src = state.avatar;
};
