
    const form = document.getElementById('registrationForm');

    form.addEventListener('submit', function (event) {
      event.preventDefault();
      validateForm();
    });

    function validateForm() {
      // Reset error messages
      resetErrorMessages();

      // Validate each input field
      const nameInput = document.getElementById('name');
      if (!nameInput.value) {
        showError('nameError', 'Please enter a name');
      }

      const emailInput = document.getElementById('email');
      if (!emailInput.value) {
        showError('emailError', 'Please enter an email');
      } else if (!isValidEmail(emailInput.value)) {
        showError('emailError', 'Please enter a valid email');
      }

      const mobileInput = document.getElementById('mobile');
      if (!mobileInput.value) {
        showError('mobileError', 'Please enter a mobile number');
      }

      const passwordInput = document.getElementById('password');
      if (!passwordInput.value) {
        showError('passwordError', 'Please enter a password');
      }

      const confirmPasswordInput = document.getElementById('confirmPassword');
      if (!confirmPasswordInput.value) {
        showError('confirmPasswordError', 'Please confirm the password');
      } else if (passwordInput.value !== confirmPasswordInput.value) {
        showError('confirmPasswordError', 'Passwords do not match');
      }

      const dobInput = document.getElementById('dob');
      if (!dobInput.value) {
        showError('dobError', 'Please enter a date of birth');
      }

      const aadharInput = document.getElementById('aadhar');
      if (!aadharInput.value) {
        showError('addressError', 'Please enter an address');
      }

      const addressInput = document.getElementById('address');
      if (!addressInput.value) {
        showError('aadharError', 'Please enter an Aadhar number');
      }

      const genderInputs = document.querySelectorAll('input[name="gender"]');
      let genderSelected = false;
      genderInputs.forEach(function (input) {
        if (input.checked) {
          genderSelected = true;
        }
      });
      if (!genderSelected) {
        showError('genderError', 'Please select a gender');
      }

      if (checkErrors()) {
        form.submit();
      }
    }

    function showError(id, message) {
      const errorElement = document.getElementById(id);
      errorElement.textContent = message;
    }

    function resetErrorMessages() {
      const errorElements = document.getElementsByClassName('error-message');
      Array.from(errorElements).forEach(function (element) {
        element.textContent = '';
      });
    }

    function checkErrors() {
      const errorElements = document.getElementsByClassName('error-message');
      let hasErrors = false;
      Array.from(errorElements).forEach(function (element) {
        if (element.textContent) {
          hasErrors = true;
        }
      });
      return !hasErrors;
    }

    function isValidEmail(email) {
      const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      return emailRegex.test(email);
    }
