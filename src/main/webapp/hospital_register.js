function validateForm() {
    let isValid = true;

    // Validate name
    if (nameInput.value.trim() === '') {
        isValid = false;
        showError('name', 'Please enter a hospital name.');
    } else {
        hideError('name');
    }

    // Validate mobile
    if (mobileInput.value.trim() === '') {
        isValid = false;
        showError('mobile', 'Please enter a contact number.');
    } else {
        hideError('mobile');
    }

    // Validate email
    if (emailInput.value.trim() === '') {
        isValid = false;
        showError('email', 'Please enter an email address.');
    } else if (!validateEmail(emailInput.value.trim())) {
        isValid = false;
        showError('email', 'Please enter a valid email address.');
    } else {
        hideError('email');
    }

    // Validate address
    if (addressInput.value.trim() === '') {
        isValid = false;
        showError('address', 'Please enter a hospital address.');
    } else {
        hideError('address');
    }

    // Validate password
    if (passwordInput.value.trim() === '') {
        isValid = false;
        showError('password', 'Please enter a password.');
    } else if (!validatePassword(passwordInput.value.trim())) {
        isValid = false;
        showError(
            'password',
            'Password must start with an uppercase letter, contain at least one special character, and be at least 8 characters long.'
        );
    } else {
        hideError('password');
    }

    // Validate confirm password
    if (confirmPasswordInput.value.trim() === '') {
        isValid = false;
        showError('confirmPassword', 'Please confirm the password.');
    } else if (confirmPasswordInput.value.trim() !== passwordInput.value.trim()) {
        isValid = false;
        showError('confirmPassword', 'Passwords do not match.');
    } else {
        hideError('confirmPassword');
    }

    return isValid;
}

function validateEmail(email) {
    const emailRegex = /^[a-z][^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function validatePassword(password) {
    const passwordRegex = /^(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return passwordRegex.test(password);
}
