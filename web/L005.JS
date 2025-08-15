// === 1. DOM Loaded Event ===
document.addEventListener("DOMContentLoaded", function () {
  // Initialize everything when page loads
  setupSmoothScroll();
  setupHeaderBehavior();
  setupTestimonialSlider();
  setupScrollAnimations();
  setupSocialHoverEffects();
});

// === 2. Smooth Scrolling for All Anchor Links ===
function setupSmoothScroll() {
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault();
      const targetId = this.getAttribute("href");
      if (targetId === "#") return;

      const target = document.querySelector(targetId);
      if (target) {
        window.scrollTo({
          top: target.offsetTop - 80,
          behavior: "smooth",
        });
      }
    });
  });
}

// === 3. Dynamic Header: Shrinks on Scroll ===
function setupHeaderBehavior() {
  const header = document.querySelector(".header");
  let lastScrollTop = 0;

  window.addEventListener("scroll", () => {
    const scrollTop = window.pageYOffset;

    // Shrink header on scroll down, expand on scroll up
    if (scrollTop > 50 && scrollTop > lastScrollTop) {
      header.style.transform = "translateY(-100%)";
    } else {
      header.style.transform = "translateY(0)";
    }

    // Change background on scroll
    if (scrollTop > 30) {
      header.style.boxShadow = "0 4px 12px rgba(0,0,0,0.1)";
      header.style.padding = "8px 20px";
    } else {
      header.style.boxShadow = "0 2px 5px rgba(0,0,0,0.1)";
      header.style.padding = "10px 20px";
    }

    lastScrollTop = scrollTop;
  });
}

// === 4. Auto-Rotating Testimonial Slider (Infinite Loop) ===
function setupTestimonialSlider() {
  const slider = document.querySelector(".testimonial-slider");
  const cards = document.querySelectorAll(".testimonial-card");
  if (!slider || cards.length === 0) return;

  const cardWidth = cards[0].offsetWidth + 20; // + gap
  let index = 0;
  let autoSlide;

  function nextSlide() {
    index++;
    if (index >= cards.length) index = 0;
    slider.scrollTo({
      left: index * cardWidth,
      behavior: "smooth",
    });
  }

  // Start auto-rotation
  function startAutoSlide() {
    autoSlide = setInterval(nextSlide, 4000);
  }

  // Pause on hover
  slider.addEventListener("mouseenter", () => clearInterval(autoSlide));
  slider.addEventListener("mouseleave", startAutoSlide);

  // Restart if user scrolls manually
  slider.addEventListener("scroll", () => {
    clearTimeout(slider.scrollTimer);
    slider.scrollTimer = setTimeout(() => {
      const scrollLeft = Math.round(slider.scrollLeft);
      const newIndex = Math.round(scrollLeft / cardWidth);
      if (newIndex >= 0 && newIndex < cards.length) {
        index = newIndex;
      }
    }, 100);
  });

  startAutoSlide(); // Start rotation
}

// === 5. Scroll-Triggered Animations (Re-usable & Repeats on Scroll) ===
function setupScrollAnimations() {
  const animateElements = document.querySelectorAll(
    ".feature-card, .about-content, .cta-section h2, .cta-section p, .testimonial-card"
  );

  const observerOptions = {
    threshold: 0.1,
    rootMargin: "0px 0px -100px 0px",
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.style.opacity = "1";
        entry.target.style.transform = "translateY(0)";
        entry.target.style.transition = "opacity 0.7s ease, transform 0.7s ease";
      } else {
        // Reset when out of view (so it can re-animate on next scroll)
        entry.target.style.opacity = "0";
        entry.target.style.transform = "translateY(30px)";
      }
    });
  }, observerOptions);

  // Apply observer to all animate-able elements
  animateElements.forEach((el) => {
    el.style.opacity = "0";
    el.style.transform = "translateY(30px)";
    observer.observe(el);
  });

  // Re-observe even after animation (keeps working on scroll up/down)
  window.addEventListener("scroll", () => {
    animateElements.forEach((el) => {
      observer.unobserve(el);
      observer.observe(el); // Re-observe for re-trigger
    });
  });
}

// === 6. Enhanced Social Media Hover Effects (Pulse + Color Change) ===
function setupSocialHoverEffects() {
  const socialIcons = document.querySelectorAll(".social-icon");

  socialIcons.forEach((icon) => {
    // Save original color
    icon.style.transition = "all 0.3s ease";
    icon.style.color = "#fff";

    icon.addEventListener("mouseenter", () => {
      icon.style.transform = "scale(1.4)";
      icon.style.color = getRandomBrightColor();
    });

    icon.addEventListener("mouseleave", () => {
      icon.style.transform = "scale(1)";
      icon.style.color = "#fff";
    });
  });
}

// Utility: Get a random bright color for hover effect
function getRandomBrightColor() {
  const hue = Math.floor(Math.random() * 360);
  const saturation = 80;
  const lightness = 60;
  return `hsl(${hue}, ${saturation}%, ${lightness}%)`;
}

// === 7. Optional: Floating CTA Button that Appears on Scroll ===
function createFloatingCTA() {
  const floatingBtn = document.createElement("button");
  floatingBtn.innerText = "🌟 Donate Now";
  floatingBtn.style.cssText = `
    position: fixed;
    bottom: 30px;
    right: 30px;
    padding: 12px 20px;
    background: #0ea5e9;
    color: white;
    border: none;
    border-radius: 50px;
    font-size: 1rem;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(14, 165, 233, 0.4);
    z-index: 1000;
    opacity: 0;
    transform: translateY(20px);
    transition: all 0.4s ease;
  `;

  floatingBtn.addEventListener("click", () => {
    document.getElementById("get-started").scrollIntoView({ behavior: "smooth" });
  });

  document.body.appendChild(floatingBtn);

  // Show on scroll
  window.addEventListener("scroll", () => {
    if (window.scrollY > 400) {
      floatingBtn.style.opacity = "1";
      floatingBtn.style.transform = "translateY(0)";
    } else {
      floatingBtn.style.opacity = "0";
      floatingBtn.style.transform = "translateY(20px)";
    }
  });
}

// Call it if you want the floating button
createFloatingCTA();