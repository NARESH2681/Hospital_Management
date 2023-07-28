const form = document.getElementById('myForm');
const email = document.getElementById('email');
const password = document.getElementById('password');
const emailError = document.getElementById('emailError');
const passwordError = document.getElementById('passwordError');

form.addEventListener('submit', function (e) {
  e.preventDefault();
  validateForm();
});

function validateForm() {
  emailError.textContent = '';
  passwordError.textContent = '';

  if (email.value === '') {
    emailError.textContent = 'Email is required';
  } else if (!validateEmail(email.value)) {
    emailError.textContent = 'Please enter a valid email';
  }

  if (password.value === '') {
    passwordError.textContent = 'Password is required';
  }
}

function validateEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}


