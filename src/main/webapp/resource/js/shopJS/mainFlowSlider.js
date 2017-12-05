
$(document).ready(function() {

    var EASING = 0.05,
        FPS = 60,
        $paneTarget = $('#scroll'),
        $paneContainer = $('#scrollContainer'),
        windowWidth = $(window).width(),
        containerWidth = 0,
        maxScroll = 0,
        posX = 0,   // Keep track of the container position with posX
        targetX = 0,
        animInterval = false;   // No interval is set by default
    
    $paneTarget.find('li').each(function() {
        containerWidth += $(this).width();
        $paneContainer.width(containerWidth);
    });
    
    // Set maximum amount the container can scroll
    // negative because we're gonna scroll to left
    maxScroll = -(containerWidth - windowWidth);
    
    // This gets called from the setInterval and handles the animating of the scroll container
    function animationLoop() {
        var dx = targetX - posX,    // Difference
            vx = dx * EASING;       // Velocity
        
        // Add velocity to x position and update css with new position
        posX += vx;
        $paneContainer.css({left: posX});
        
        // When end target is reached stop the interval
        if (Math.round(posX) === targetX) {
            clearInterval(animInterval);
            animInterval = false;
        }
    }
    
    function startAnimation() {
        // Only start animation interval when it's not already running
        if (!animInterval) {
            animInterval = setInterval(animationLoop, 1000 / FPS);
        }
    }

    $paneTarget.on('mousemove', function(event) {
        // Calculate the new x position for the scroll container
        targetX = Math.round((event.pageX / windowWidth) * maxScroll);
        
        startAnimation();
    });
    
    $(window).on('resize', function() {
        windowWidth = $(window).width();
        maxScroll = -(containerWidth - windowWidth);
        
        // OPTIONAL:
        // Move scrollpane to original position on resize
        targetX = 0;
        // Animate to newly set target
        startAnimation();
    });

});