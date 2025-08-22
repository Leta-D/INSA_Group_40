document.addEventListener("DOMContentLoaded", () => {

  const h1 = document.querySelector("h1");
  const originalText = h1.textContent.trim();
  h1.textContent = "";

  let index = 0;
  const type = () => {
    if (index < originalText.length) {
      h1.textContent += originalText.charAt(index);
      index++;
      setTimeout(type, 35);
    }
  };
  type();


  const container = document.querySelector(".container");

  container.addEventListener("mouseenter", () => {
    container.style.transform = "scale(1.03) translateY(-5px)";
    container.style.boxShadow = "0 20px 40px rgba(0, 0, 0, 0.25)";
  });

  container.addEventListener("mouseleave", () => {
    container.style.transform = "scale(1) translateY(0)";
    container.style.boxShadow = "0 10px 30px rgba(0, 0, 0, 0.2)";
  });


  document.querySelectorAll("button").forEach((button) => {
    button.style.position = "relative";
    button.style.overflow = "hidden";

    button.addEventListener("click", function (e) {
      const rect = button.getBoundingClientRect();
      const x = e.clientX - rect.left; // x position within the element
      const y = e.clientY - rect.top;  // y position within the element

      const ripple = document.createElement("span");
      ripple.style.position = "absolute";
      ripple.style.width = "60px";
      ripple.style.height = "60px";
      ripple.style.borderRadius = "50%";
      ripple.style.backgroundColor = "rgba(30, 122, 84, 0.4)";
      ripple.style.transform = "scale(0)";
      ripple.style.left = `${x - 30}px`;
      ripple.style.top = `${y - 30}px`;
      ripple.style.pointerEvents = "none";
      ripple.style.transition = "transform 0.9s, opacity 1s";
      ripple.style.zIndex = "0";

      // Append and animate
      button.appendChild(ripple);

      // Trigger reflow to enable transition
      ripple.offsetHeight;
      ripple.style.transform = "scale(6)";
      ripple.style.opacity = "0";

      // Remove after animation
      setTimeout(() => {
        ripple.remove();
      }, 1000);
    });
  });

  // 4. Subtle Floating Animation when not interacting
  let floating = true;
  let direction = 1;

  const floatAnimation = setInterval(() => {
    if (!document.querySelector(".container:hover") && floating) {
      container.style.transition = "transform 1.5s ease-in-out";
      container.style.transform = `translateY(${direction * 6}px) scale(1)`;
      direction *= -1;
    }
  }, 3000);

  // Pause float on hover
  container.addEventListener("mouseenter", () => {
    floating = false;
    container.style.transition = "transform 0.3s ease";
  });

  container.addEventListener("mouseleave", () => {
    floating = true;
  });


  const body = document.body;
  const cursorGlow = document.createElement("div");
  cursorGlow.style.position = "fixed";
  cursorGlow.style.width = "200px";
  cursorGlow.style.height = "200px";
  cursorGlow.style.borderRadius = "50%";
  cursorGlow.style.background = "radial-gradient(circle, rgba(8, 8, 8, 0.15) 10%, transparent 70%)";
  cursorGlow.style.pointerEvents = "none";
  cursorGlow.style.zIndex = "-1";
  cursorGlow.style.transform = "translate(-50%, -50%)";
  cursorGlow.style.opacity = "0";
  cursorGlow.style.transition = "opacity 0.4s ease";

  body.appendChild(cursorGlow);

  document.addEventListener("mousemove", (e) => {
    cursorGlow.style.opacity = "0.7";
    cursorGlow.style.left = `${e.clientX}px`;
    cursorGlow.style.top = `${e.clientY}px`;
  });

  document.addEventListener("mouseout", () => {
    cursorGlow.style.opacity = "0";
  });
});