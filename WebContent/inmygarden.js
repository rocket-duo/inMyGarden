$(document).ready(function() {
	$(".d_imgSlide").each(function() {
		var $container = $(this), 
		$slideGroup = $container.find(".d_imgSlides"),
		$slides = $slideGroup.find(".slide"),
		$nav = $container.find(".d_slideshowNav"),
		$indicator = $container.find(".d_slideshow-indicator"),
		slideCount = $slides.length,
		indicatorHTML = "",
		currentIndex = 0,
		duration = 500,
		easing = "easeInOutExpo",
		interval = 4000,
		timer;

		$slides.each(function(i) {
			$(this).css({ left:100 * i + "%" });
			indicatorHTML += "<a href='#'>" + (i + 1) + "</a>";
		});
		$indicator.html(indicatorHTML);

		function goToSlide(idx) {
			$slideGroup.animate({ left:-100 * idx + "%" }, duration, easing);
			currentIndex = idx;
			updateNav();
		}

		function updateNav() {
			var $navPrev = $nav.find(".prev");
			var $navNext = $nav.find(".next");

			if (currentIndex == 0) {
				$navPrev.addClass("disabled");
			} else {
				$navPrev.removeClass("disabled");
			}
			if (currentIndex == slideCount - 1) {
				$navNext.addClass("disabled");
			} else {
				$navNext.removeClass("disabled");
			}

			$indicator.find("a").removeClass("active").eq(currentIndex).addClass("active");
		}

		function startTimer() {
			timer = setInterval(function() {
				var nextIndex = (currentIndex + 1) % slideCount;
				goToSlide(nextIndex);
			}, interval);
		}
		
		function stopTimer() {
			clearInterval(timer);
		}

		$nav.on("click", "a", function(event) {
			event.preventDefault();

			if ($(this).hasClass("prev")) {
				goToSlide(currentIndex - 1);
			} else {
				goToSlide(currentIndex + 1);
			}
		});

		$indicator.on("click", "a", function(event) {
			event.preventDefault();
			if (!$(this).hasClass("active")) {
				goToSlide($(this).index());
			}
		});

		$container.on({
			mouseenter:stopTimer,
			mouseleave:startTimer
		});

		goToSlide(currentIndex);
		
		startTimer();
	});
});