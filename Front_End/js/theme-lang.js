/* ================================================
   theme-lang.js — النسخة النهائية الكاملة
   ================================================ */

// تطبيق الثيم فوراً قبل ظهور الصفحة (يمنع الوميض)
(function () {
  if (localStorage.getItem('theme') === 'dark') {
    document.documentElement.classList.add('dark-mode');
  }
})();

const TRANSLATIONS = {
  en: {
    nav_home: 'Home Page', nav_hosp: 'Hospital Info',
    nav_patient: 'Patient', setting: 'Setting',
    nav_dashboard: 'Dashboard', nav_users: 'Users',
    nav_hospitals: 'Hospitals', nav_requests: 'Requests',
    nav_donations: 'Donations', nav_inventory: 'Inventory',
    sys_admin_brand: 'System Admin',
    welcome: 'Welcome', logout: 'Log out',
    general: 'General', account: 'Account',
    language_label: 'Language:', themes: 'Themes:',
    light: 'Light', dark: 'Dark',
    visibility: 'Visibility:', public: 'Public', private: 'Private',
    info_note: 'Set to "Private" to temporarily hide your hospital from public view.',
    work_time: 'Work Time:', to_text: 'to',
    edit_btn: 'Edit', save_btn: 'Save Changes', cancel_btn: 'Cancel',
    acc_name: 'Name:', acc_username: 'User Name:', acc_email: 'Email:',
    acc_reset: 'Reset Password', acc_role: 'Admin',
    modal_reset_title: 'Reset Password',
    modal_reset_body: 'Do you want to reset your password? A reset link will be sent to your email.',
    modal_send: 'Send Link',
    modal_logout_title: 'Log Out',
    modal_logout_body: 'Are you sure you want to log out?',
    page_home_title: 'Welcome Back, Admin',
    page_home_sub: 'Manage your hospital system efficiently from here',
    card_hosp_title: 'Hospital Info',
    card_hosp_sub: 'Edit hospital details and services',
    card_patient_title: 'Patient',
    card_patient_sub: 'View and manage patient records',
    card_setting_title: 'Setting',
    card_setting_sub: 'Configure system settings',
    page_hosp_title: 'Hospital Information',
    hospital_name: 'Hospital Name:', location: 'Location:',
    phone: 'Phone Number:', description: 'Description:',
    hosp_services: 'Hospital Services:', hosp_depts: 'Hospital Departments:',
    page_patient_title: 'Patient Information',
    add_patient: '+ Add Patient',
    col_id: 'ID', col_name: 'Name', col_age: 'Age',
    col_gender: 'Gender', col_phone: 'Phone',
    col_disease: 'Disease', col_status: 'Status', col_actions: 'Actions',
    inv_title: 'Inventory Dashboard', inv_add: '+ Add Item',
    inv_status_all: 'Status: All',
    inv_in_stock: 'In Stock', inv_low: 'Low Stock', inv_out: 'Out of Stock',
    inv_col_id: 'Item_id', inv_col_name: 'Item Name', inv_col_cat: 'Category',
    inv_col_qty: 'Quantity', inv_col_status: 'Status',
    inv_col_date: 'Expire_Date', inv_col_action: 'Action',
    inv_print: 'Print Report',
    inv_modal_add: 'Add New Item', inv_modal_edit: 'Edit Item',
    inv_label_name: 'Item Name', inv_label_cat: 'Category',
    inv_label_qty: 'Quantity', inv_label_date: 'Expire Date',
    inv_label_status: 'Status', inv_save: 'Save',
    inv_delete_title: 'Delete Item',
    inv_delete_confirm: 'This action cannot be undone.',
    modal_delete_sure: 'Are you sure you want to delete',
    inv_delete_btn: 'Delete',
  },
  ar: {
    nav_home: 'الصفحة الرئيسية', nav_hosp: 'بيانات المستشفى',
    nav_patient: 'المريض', setting: 'الإعدادات',
    nav_dashboard: 'لوحة التحكم', nav_users: 'المستخدمون',
    nav_hospitals: 'المستشفيات', nav_requests: 'الطلبات',
    nav_donations: 'التبرعات', nav_inventory: 'المخزون',
    sys_admin_brand: 'مدير النظام',
    welcome: 'مرحباً', logout: 'تسجيل الخروج',
    general: 'عام', account: 'الحساب',
    language_label: 'اللغة:', themes: 'المظهر:',
    light: 'فاتح', dark: 'داكن',
    visibility: 'الظهور:', public: 'عام', private: 'خاص',
    info_note: 'اضبط على "خاص" لإخفاء مستشفاك مؤقتاً عن العرض العام.',
    work_time: 'وقت العمل:', to_text: 'إلى',
    edit_btn: 'تعديل', save_btn: 'حفظ التغييرات', cancel_btn: 'إلغاء',
    acc_name: 'الاسم:', acc_username: 'اسم المستخدم:', acc_email: 'البريد الإلكتروني:',
    acc_reset: 'إعادة تعيين كلمة المرور', acc_role: 'مدير',
    modal_reset_title: 'إعادة تعيين كلمة المرور',
    modal_reset_body: 'هل تريد إعادة تعيين كلمة المرور؟ سيتم إرسال رابط إلى بريدك الإلكتروني.',
    modal_send: 'إرسال الرابط',
    modal_logout_title: 'تسجيل الخروج',
    modal_logout_body: 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
    page_home_title: 'مرحباً بعودتك، Admin',
    page_home_sub: 'إدارة نظام مستشفاك بكفاءة من هنا',
    card_hosp_title: 'بيانات المستشفى',
    card_hosp_sub: 'تعديل تفاصيل وخدمات المستشفى',
    card_patient_title: 'المريض',
    card_patient_sub: 'عرض وإدارة سجلات المرضى',
    card_setting_title: 'الإعدادات',
    card_setting_sub: 'ضبط إعدادات النظام',
    page_hosp_title: 'بيانات المستشفى',
    hospital_name: 'اسم المستشفى:', location: 'الموقع:',
    phone: 'رقم الهاتف:', description: 'الوصف:',
    hosp_services: 'خدمات المستشفى:', hosp_depts: 'أقسام المستشفى:',
    page_patient_title: 'بيانات المرضى',
    add_patient: '+ إضافة مريض',
    col_id: 'الرقم', col_name: 'الاسم', col_age: 'العمر',
    col_gender: 'الجنس', col_phone: 'الهاتف',
    col_disease: 'المرض', col_status: 'الحالة', col_actions: 'الإجراءات',
    inv_title: 'لوحة المخزون', inv_add: '+ إضافة عنصر',
    inv_status_all: 'الحالة: الكل',
    inv_in_stock: 'متوفر', inv_low: 'مخزون منخفض', inv_out: 'غير متوفر',
    inv_col_id: 'رقم العنصر', inv_col_name: 'اسم العنصر', inv_col_cat: 'الفئة',
    inv_col_qty: 'الكمية', inv_col_status: 'الحالة',
    inv_col_date: 'تاريخ الانتهاء', inv_col_action: 'الإجراء',
    inv_print: 'طباعة التقرير',
    inv_modal_add: 'إضافة عنصر جديد', inv_modal_edit: 'تعديل العنصر',
    inv_label_name: 'اسم العنصر', inv_label_cat: 'الفئة',
    inv_label_qty: 'الكمية', inv_label_date: 'تاريخ الانتهاء',
    inv_label_status: 'الحالة', inv_save: 'حفظ',
    inv_delete_title: 'حذف العنصر',
    inv_delete_confirm: 'لا يمكن التراجع عن هذا الإجراء.',
    modal_delete_sure: 'هل أنت متأكد أنك تريد حذف',
    inv_delete_btn: 'حذف',
  }
};

// الدالة الأساسية للترجمة
function applyTranslations(lang) {
  const isAr = lang === 'ar';
  document.documentElement.dir = isAr ? 'rtl' : 'ltr';
  document.documentElement.lang = lang;

  document.querySelectorAll('[data-i18n]').forEach(el => {
    const key = el.getAttribute('data-i18n');
    if (TRANSLATIONS[lang] && TRANSLATIONS[lang][key]) {
      el.innerText = TRANSLATIONS[lang][key];
    }
  });

  // ترجمة time-box
  document.querySelectorAll('.time-box').forEach(box => {
    if (isAr) box.innerText = box.innerText.replace(/AM/gi,'صباحاً').replace(/PM/gi,'مساءً');
    else       box.innerText = box.innerText.replace(/صباحاً/g,'AM').replace(/مساءً/g,'PM');
  });

  // ترجمة select options في inventory
  const sf = document.getElementById('statusFilter');
  if (sf) {
    sf.options[0].text = isAr ? 'الحالة: الكل' : 'Status: All';
    sf.options[1].text = isAr ? 'متوفر'         : 'In Stock';
    sf.options[2].text = isAr ? 'مخزون منخفض'  : 'Low Stock';
    sf.options[3].text = isAr ? 'غير متوفر'     : 'Out of Stock';
  }

  // لو في renderTable في الصفحة (inventory) استدعيها
  if (typeof renderTable === 'function' && typeof items !== 'undefined') {
    renderTable(items);
  }
}

// changeLanguage تُستدعى من صفحة الإعدادات
function changeLanguage(lang) {
  localStorage.setItem('lang', lang);
  applyTranslations(lang);
}

// تطبيق الثيم
function setTheme(theme) {
  if (theme === 'dark') {
    document.body.classList.add('dark-mode');
    document.documentElement.classList.add('dark-mode');
    localStorage.setItem('theme', 'dark');
  } else {
    document.body.classList.remove('dark-mode');
    document.documentElement.classList.remove('dark-mode');
    localStorage.setItem('theme', 'light');
  }
  document.querySelectorAll('.theme-option').forEach(opt => {
    opt.classList.remove('active');
    const radio = opt.querySelector('input[type="radio"]');
    const isDark = opt.innerText.trim().includes('Dark') || opt.innerText.trim().includes('داكن');
    if ((theme==='dark' && isDark) || (theme==='light' && !isDark)) {
      opt.classList.add('active');
      if (radio) radio.checked = true;
    }
  });
}

// تشغيل تلقائي عند اكتمال تحميل الصفحة كاملاً
window.addEventListener('load', () => {
  setTheme(localStorage.getItem('theme') || 'light');
  const savedLang = localStorage.getItem('lang') || 'en';
  const select = document.getElementById('langSelect');
  if (select) select.value = savedLang;
  if (savedLang !== 'en') applyTranslations(savedLang);
});