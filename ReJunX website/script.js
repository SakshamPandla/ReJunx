
// JavaScript to make elements clickable
document.addEventListener('DOMContentLoaded', function() {
    // Select elements
    const featuresLink = document.getElementById('features-link');
    const aboutLink = document.getElementById('about-link');
    const contactLink = document.getElementById('contact-link');
    const sellBtn = document.getElementById('sell-btn');

    // Click event listeners
    featuresLink.addEventListener('click', function(event) {
        event.preventDefault();
        alert('Features clicked');
    });

    aboutLink.addEventListener('click', function(event) {
        event.preventDefault();
        alert('About clicked');
    });

    contactLink.addEventListener('click', function(event) {
        event.preventDefault();
        alert('Contact clicked');
    });

    sellBtn.addEventListener('click', function() {
        alert('Sell your e-waste button clicked');
    });

    const toggleNav = (navbar, mobileNav) => {
        navbar.classList.toggle("active");
        mobileNav.classList.toggle("hamburger-active");
    };


    if (primaryMobileNav && primaryNavbar) {
        primaryMobileNav.addEventListener("click", () =>
            toggleNav(primaryNavbar, primaryMobileNav),
        );
    }

    if (secondaryMobileNav && secondaryNavbar) {
        secondaryMobileNav.addEventListener("click", () =>
            toggleNav(secondaryNavbar, secondaryMobileNav),
        );
    }

    // JavaScript for smooth scrolling or interactions
    document.querySelectorAll('.learn-more-btn').forEach(button => {
        button.addEventListener('click', (event) => {
            event.preventDefault();
            alert('Learn more clicked!');
        });




// what will you get
        document.querySelector('.learn-more-btn').addEventListener('click', function() {
            alert('Discover the benefits of recycling your E-Waste!');
        });





// our process

        // JavaScript to enhance user interactivity
        document.addEventListener("DOMContentLoaded", () => {
            const steps = document.querySelectorAll(".process-step");
            const images = document.querySelectorAll(".process-image img");

            // Adding click event to each process step
            steps.forEach((step) => {
                step.addEventListener("click", () => {
                    step.classList.toggle("active-step");
                });
            });

            // Adding animation on scroll for images
            window.addEventListener("scroll", () => {
                images.forEach((img) => {
                    const rect = img.getBoundingClientRect();
                    if (rect.top < window.innerHeight) {
                        img.style.transform = "scale(1.1)";
                    } else {
                        img.style.transform = "scale(1)";
                    }
                });
            });
        });


});



