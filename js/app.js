(() => {
  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const toggle = document.querySelector('.nav-toggle');
  const menu = document.querySelector('.nav-menu');

  if (toggle && menu) {
    toggle.addEventListener('click', () => {
      const open = menu.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(open));
    });

    menu.querySelectorAll('a').forEach((link) => {
      const current = location.pathname.split('/').pop() || 'index.html';
      const href = link.getAttribute('href') || '';
      if (href.endsWith(current) || (current === '' && href.endsWith('index.html'))) {
        link.classList.add('is-active');
      }
      link.addEventListener('click', () => {
        menu.classList.remove('is-open');
        toggle.setAttribute('aria-expanded', 'false');
      });
    });
  }

  const revealElements = document.querySelectorAll('.reveal');
  const revealObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target);
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -8% 0px' });
  revealElements.forEach((item) => revealObserver.observe(item));

  if (!prefersReduced) {
    const parallaxItems = document.querySelectorAll('[data-parallax]');
    let ticking = false;

    const updateParallax = () => {
      const viewport = window.innerHeight || 1;
      parallaxItems.forEach((el) => {
        const speed = parseFloat(el.dataset.parallax || '0.05');
        const rect = el.getBoundingClientRect();
        const center = rect.top + rect.height / 2;
        const offset = (center - viewport / 2) * speed;
        el.style.transform = `translate3d(0, ${offset * -0.22}px, 0)`;
      });
      ticking = false;
    };

    const onScroll = () => {
      if (ticking) return;
      window.requestAnimationFrame(updateParallax);
      ticking = true;
    };

    updateParallax();
    window.addEventListener('scroll', onScroll, { passive: true });
    window.addEventListener('resize', onScroll, { passive: true });

    document.querySelectorAll('.magnetic').forEach((button) => {
      button.addEventListener('mousemove', (event) => {
        const rect = button.getBoundingClientRect();
        const x = event.clientX - rect.left - rect.width / 2;
        const y = event.clientY - rect.top - rect.height / 2;
        button.style.transform = `translate(${x * 0.08}px, ${y * 0.12 - 2}px)`;
      });
      button.addEventListener('mouseleave', () => {
        button.style.transform = '';
      });
    });
  }
})();
