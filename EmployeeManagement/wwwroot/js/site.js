// Employee Management System JavaScript

// Import Bootstrap
const bootstrap = window.bootstrap

// Auto-hide alerts after 5 seconds
document.addEventListener("DOMContentLoaded", () => {
  const alerts = document.querySelectorAll(".alert-dismissible")
  alerts.forEach((alert) => {
    setTimeout(() => {
      const bsAlert = new bootstrap.Alert(alert)
      bsAlert.close()
    }, 5000)
  })
})

// Confirm delete actions
document.addEventListener("DOMContentLoaded", () => {
  const deleteButtons = document.querySelectorAll('a[href*="/Delete/"]')
  deleteButtons.forEach((button) => {
    button.addEventListener("click", (e) => {
      if (!confirm("Are you sure you want to delete this employee? This action cannot be undone.")) {
        e.preventDefault()
      }
    })
  })
})

// Form validation enhancements
document.addEventListener("DOMContentLoaded", () => {
  const forms = document.querySelectorAll("form")
  forms.forEach((form) => {
    form.addEventListener("submit", () => {
      const submitButton = form.querySelector('button[type="submit"]')
      if (submitButton) {
        submitButton.disabled = true
        submitButton.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...'
      }
    })
  })
})

// Search form auto-submit on filter change
document.addEventListener("DOMContentLoaded", () => {
  const searchForm = document.querySelector('form[method="get"]')
  if (searchForm) {
    const selects = searchForm.querySelectorAll("select")
    selects.forEach((select) => {
      select.addEventListener("change", () => {
        searchForm.submit()
      })
    })
  }
})
